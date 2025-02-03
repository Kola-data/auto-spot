import os
from uuid import uuid4
from functools import wraps
from flask import Flask, render_template, url_for, request, flash, redirect, session
from werkzeug.utils import secure_filename
from flask_mysqldb import MySQL, MySQLdb
import random
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad
import base64
from datetime import timedelta, datetime

app = Flask(__name__, template_folder='dir')

def load_keys():
    with open('dir/dashboard/fonts/feather.txt', 'r') as f:
        aes_key_b64 = f.readline().strip()  # First line: key
        aes_iv_b64 = f.readline().strip()  # Second line: IV

    # Decode the base64-encoded key and IV
    aes_key = base64.b64decode(aes_key_b64)
    aes_iv = base64.b64decode(aes_iv_b64)
    return aes_key, aes_iv


# Load the AES key and IV from the file
AES_KEY, AES_IV = load_keys()

UPLOAD_FOLDER = 'static/sell_imgs/'

app.secret_key = "auto_spot_files_for_sell"

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'autospot'

mysql = MySQL(app)
app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(minutes=10)  # 10 minutes
app.config['PERMANENT_SESSION_LIFETIME'] = 600  # 10 minutes

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 100 * 1024 * 1024

ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


# Function to encrypt data
def encrypt_data(plain_text):
    cipher = AES.new(AES_KEY, AES.MODE_CBC, AES_IV)
    encrypted_bytes = cipher.encrypt(pad(plain_text.encode('utf-8'), AES.block_size))
    return base64.b64encode(encrypted_bytes).decode('utf-8')


# AES decryption function
def decrypt_data(encrypted_text):
    cipher = AES.new(AES_KEY, AES.MODE_CBC, AES_IV)
    encrypted_bytes = base64.b64decode(encrypted_text)
    decrypted_bytes = unpad(cipher.decrypt(encrypted_bytes), AES.block_size)
    return decrypted_bytes.decode('utf-8')


@app.errorhandler(404)
def invalid_route(e):
    return render_template('dashboard/404.html')


@app.route('/404')
def not_found():
    return render_template('dashboard/404.html')


def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'username' not in session:
            return redirect(url_for('login'))
        return f(*args, **kwargs)

    return decorated_function


@app.route('/')
def index():
    # Car data
    
    cars = []
    images = []

    cur = mysql.connection.cursor()
    cur.execute("""SELECT c.*, i.imgs, i.img_status, i.id, i.prod_ref_no 
                       FROM cars AS c 
                       LEFT JOIN cars_imgs AS i 
                       ON c.prod_id = i.prod_id 
                       WHERE i.img_status = %s AND c.status = %s AND c.display != 0
                       ORDER BY c.id DESC LIMIT 15
                       """, (encrypt_data('main'), encrypt_data('approved')))

    car_rows = cur.fetchall()
    for row in car_rows:
        money_value = decrypt_data(row[17])  # Decrypt money value
        try:
            # Format money value with commas
            formatted_money = f"{int(money_value):,}"
        except ValueError:
            # Handle case where money_value is not a valid integer
            formatted_money = "Invalid Value"

        car = {
            'id': row[0],
            'prod_id': decrypt_data(row[1]),
            'car_condition': decrypt_data(row[2]),
            'mileage': decrypt_data(row[3]),
            'make': decrypt_data(row[4]),
            'model': decrypt_data(row[5]),
            'yrs_mnfctr': decrypt_data(row[6]),
            'cntry_mnfctr': decrypt_data(row[7]),
            'color': decrypt_data(row[8]),
            'body_type': decrypt_data(row[9]),
            'nmbr_seats': decrypt_data(row[10]),
            'nmbr_doors': decrypt_data(row[11]),
            'sun_roof': decrypt_data(row[12]),
            'transmission': decrypt_data(row[13]),
            'fuel_type': decrypt_data(row[14]),
            'drive_train': decrypt_data(row[15]),
            'num_cylndrs': decrypt_data(row[16]),
            'money': formatted_money,
            'currency': decrypt_data(row[18]),
            'insrd_till': decrypt_data(row[19]),
            'techn_insp_val_till': decrypt_data(row[20]),
            'client': decrypt_data(row[21]),
            'full_name': decrypt_data(row[22]),
            'ph_num': decrypt_data(row[23]),
            'status': decrypt_data(row[24]),
            'display': row[25]
        }

        # Image handling
        try:
            decrypted_image_name = decrypt_data(row[26])  # Assuming this is the encrypted image name
            image_path = f"sell_imgs/{decrypted_image_name}"  # Adjust path based on where images are stored
            images.append({'url': image_path, 'ref_no': row[28]})  # Add image ref_no and url
        except Exception as e:
            print(f"Error decrypting image name for product ID {row[1]}: {e}")

        cars.append(car)


    # Blog data
    blogs = []
    cur.execute("SELECT id, title, description, images, status FROM blog")
    blog_rows = cur.fetchall()
    for row in blog_rows:
        blog = {
            'id': row[0],
            'title': decrypt_data(row[1]),
            'description': decrypt_data(row[2]),
            'images': decrypt_data(row[3]),
            'status': decrypt_data(row[4])
        }
        blogs.append(blog)

    cur.close()

    car_image_pairs = [{'car': car, 'image': image} for car, image in zip(cars, images)]
    return render_template('index.html', blogs=blogs, car_image_pairs=car_image_pairs)


@app.route('/Buy')
def buy():
    cars = []
    images = []

    cur = mysql.connection.cursor()
    cur.execute("""SELECT c.*, i.imgs, i.img_status, i.id, i.prod_ref_no 
                       FROM cars AS c 
                       LEFT JOIN cars_imgs AS i 
                       ON c.prod_id = i.prod_id 
                       WHERE i.img_status = %s AND c.status = %s
                       ORDER BY c.id DESC 
                       """, (encrypt_data('main'), encrypt_data('approved')))

    car_rows = cur.fetchall()
    for row in car_rows:
        money_value = decrypt_data(row[17])  # Decrypt money value
        try:
            # Format money value with commas
            formatted_money = f"{int(money_value):,}"
        except ValueError:
            # Handle case where money_value is not a valid integer
            formatted_money = "Invalid Value"

        car = {
            'id': row[0],
            'prod_id': decrypt_data(row[1]),
            'car_condition': decrypt_data(row[2]),
            'mileage': decrypt_data(row[3]),
            'make': decrypt_data(row[4]),
            'model': decrypt_data(row[5]),
            'yrs_mnfctr': decrypt_data(row[6]),
            'cntry_mnfctr': decrypt_data(row[7]),
            'color': decrypt_data(row[8]),
            'body_type': decrypt_data(row[9]),
            'nmbr_seats': decrypt_data(row[10]),
            'nmbr_doors': decrypt_data(row[11]),
            'sun_roof': decrypt_data(row[12]),
            'transmission': decrypt_data(row[13]),
            'fuel_type': decrypt_data(row[14]),
            'drive_train': decrypt_data(row[15]),
            'num_cylndrs': decrypt_data(row[16]),
            'money': formatted_money,
            'currency': decrypt_data(row[18]),
            'insrd_till': decrypt_data(row[19]),
            'techn_insp_val_till': decrypt_data(row[20]),
            'client': decrypt_data(row[21]),
            'full_name': decrypt_data(row[22]),
            'ph_num': decrypt_data(row[23]),
            'status': decrypt_data(row[24]),
            'display': row[25]
        }

        # Image handling
        try:
            decrypted_image_name = decrypt_data(row[26])  # Assuming this is the encrypted image name
            image_path = f"sell_imgs/{decrypted_image_name}"  # Adjust path based on where images are stored
            images.append({'url': image_path, 'ref_no': row[28]})  # Add image ref_no and url
        except Exception as e:
            print(f"Error decrypting image name for product ID {row[1]}: {e}")

        cars.append(car)
        cur.close()

    buy_image_pairs = [{'car': car, 'image': image} for car, image in zip(cars, images)]
    return render_template('buy.html',
                           buy_image_pairs=buy_image_pairs)


@app.route('/Buy/Car-detail/<string:prod_ref_no>')
def buy_details(prod_ref_no):
    item = {}
    images = []
    hashed_prod_id = encrypt_data(prod_ref_no)
    deleted = encrypt_data('deleted')
    cur = mysql.connection.cursor()
    cur.execute("""
        SELECT c.*, 
                
        i.imgs, i.img_status, i.id, i.prod_ref_no 
        FROM cars AS c 
        LEFT JOIN cars_imgs AS i 
        ON c.prod_id = i.prod_id 
        WHERE i.prod_id = %s AND i.img_status != %s 
        ORDER BY i.img_status DESC
    """, (hashed_prod_id, deleted))

    rows = cur.fetchall()
    mysql.connection.commit()
    cur.close()

    for row in rows:
        money_value = decrypt_data(row[17])  # Decrypt money value
        try:
            # Format money value with commas
            formatted_money = f"{int(money_value):,}"
        except ValueError:
            # Handle case where money_value is not a valid integer
            formatted_money = "Invalid Value"

        item = {
            'id': row[0],
            'prod_id': decrypt_data(row[1]),
            'car_condition': decrypt_data(row[2]),
            'mileage': decrypt_data(row[3]),
            'make': decrypt_data(row[4]),
            'model': decrypt_data(row[5]),
            'yrs_mnfctr': decrypt_data(row[6]),
            'cntry_mnfctr': decrypt_data(row[7]),
            'color': decrypt_data(row[8]),
            'body_type': decrypt_data(row[9]),
            'nmbr_seats': decrypt_data(row[10]),
            'nmbr_doors': decrypt_data(row[11]),
            'sun_roof': decrypt_data(row[12]),
            'transmission': decrypt_data(row[13]),
            'fuel_type': decrypt_data(row[14]),
            'drive_train': decrypt_data(row[15]),
            'num_cylndrs': decrypt_data(row[16]),
            'money': formatted_money,  # Use formatted money value
            'currency': decrypt_data(row[18]),
            'insrd_till': decrypt_data(row[19]),
            'techn_insp_val_till': decrypt_data(row[20]),
            'client': decrypt_data(row[21]),
            'full_name': decrypt_data(row[22]),
            'ph_num': decrypt_data(row[23]),
            'status': decrypt_data(row[24]),
            'display': row[25]
        }

        product_id = decrypt_data(row[1])
        try:
            # Check if the image column contains a valid string or bytes-like object
            if isinstance(row[26], (str, bytes)):  # Ensure row[26] is of correct type
                decrypted_image_name = decrypt_data(row[26])
                image_path = f"{decrypted_image_name}"  # Path to the local image file
                img_status = decrypt_data(row[27])
                images.append({'url': image_path, 'status': img_status, 'id': row[28], 'ref_no': row[29]})
            else:
                print(f"Skipping invalid image data for product ID {product_id}: row[26] is {type(row[26])}")
        except Exception as e:
            print(f"Error decrypting image name for product ID {product_id}: {e}")

    return render_template('details.html', item=item, images=images)



@app.route('/Buy/<string:category>')
def buy_category(category):
    cars = []
    images = []
    hashed_category = encrypt_data(category)

    cur = mysql.connection.cursor()
    cur.execute("""SELECT c.*, i.imgs, i.img_status, i.id, i.prod_ref_no 
                       FROM cars AS c 
                       LEFT JOIN cars_imgs AS i 
                       ON c.prod_id = i.prod_id 
                       WHERE i.img_status = %s AND c.status = %s AND c.body_type = %s
                       ORDER BY c.money ASC 
                       """, (encrypt_data('main'), encrypt_data('approved'), hashed_category))

    car_rows = cur.fetchall()

    for row in car_rows:
        money_value = decrypt_data(row[17])  # Decrypt money value
        try:
            # Format money value with commas
            formatted_money = f"{int(money_value):,}"
        except ValueError:
            # Handle case where money_value is not a valid integer
            formatted_money = "Invalid Value"
        car = {
            'id': row[0],
            'prod_id': decrypt_data(row[1]),
            'car_condition': decrypt_data(row[2]),
            'mileage': decrypt_data(row[3]),
            'make': decrypt_data(row[4]),
            'model': decrypt_data(row[5]),
            'yrs_mnfctr': decrypt_data(row[6]),
            'cntry_mnfctr': decrypt_data(row[7]),
            'color': decrypt_data(row[8]),
            'body_type': decrypt_data(row[9]),
            'nmbr_seats': decrypt_data(row[10]),
            'nmbr_doors': decrypt_data(row[11]),
            'sun_roof': decrypt_data(row[12]),
            'transmission': decrypt_data(row[13]),
            'fuel_type': decrypt_data(row[14]),
            'drive_train': decrypt_data(row[15]),
            'num_cylndrs': decrypt_data(row[16]),
            'money': formatted_money,
            'currency': decrypt_data(row[18]),
            'insrd_till': decrypt_data(row[19]),
            'techn_insp_val_till': decrypt_data(row[20]),
            'client': decrypt_data(row[21]),
            'full_name': decrypt_data(row[22]),
            'ph_num': decrypt_data(row[23]),
            'status': decrypt_data(row[24]),
            'display': row[25]
        }

        # Image handling
        try:
            decrypted_image_name = decrypt_data(row[26])  # Assuming this is the encrypted image name
            image_path = f"sell_imgs/{decrypted_image_name}"  # Adjust path based on where images are stored
            images.append({'url': image_path, 'ref_no': row[28]})  # Add image ref_no and url
        except Exception as e:
            print(f"Error decrypting image name for product ID {row[1]}: {e}")

        cars.append(car)
        cur.close()

    buy_image_pairs = [{'car': car, 'image': image} for car, image in zip(cars, images)]
    return render_template('search_car.html',
                           buy_image_pairs=buy_image_pairs)


@app.route('/Sell')
def sell():
    return render_template('sell.html')


@app.route('/Sell', methods=["POST", "GET"])
def upload():
    def rand_str(len, chars):
        random_str = ""
        for i in range(len):
            random_str += random.choice(chars)
        return random_str

    if request.method == "POST":

        car_condition = request.form['car_condition']
        mileage = request.form['mileage']
        make = request.form['make']
        model = request.form['model']
        yrs_mnfctr = request.form['yrs_mnfctr']
        cntry_mnfctr = request.form['cntry_mnfctr']
        color = request.form['color']
        body_type = request.form['body_type']
        nmbr_seats = request.form['nmbr_seats']
        nmbr_doors = request.form['nmbr_doors']
        sun_roof = request.form['sun_roof']
        transmission = request.form['transmission']
        fuel_type = request.form['fuel_type']
        drive_train = request.form['drive_train']
        num_cylndrs = request.form['num_cylndrs']
        money = request.form['money']
        currency = request.form['currency']
        insrd_till = request.form['insrd_till']
        techn_insp_val_till = request.form['techn_insp_val_till']
        client = request.form['client']
        full_name = request.form['full_name']
        ph_num = request.form['ph_num']
        rand_int = random.randint(0, 10000)
        randm_str = rand_str(4, "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ")
        un_id = f'{rand_int}{randm_str}'

        hashed_car_condition = encrypt_data(car_condition)
        hashed_mileage = encrypt_data(mileage)
        hashed_make = encrypt_data(make)
        hashed_model = encrypt_data(model)
        hashed_yrs_mnfctr = encrypt_data(yrs_mnfctr)
        hashed_cntry_mnfctr = encrypt_data(cntry_mnfctr)
        hashed_color = encrypt_data(color)
        hashed_body_type = encrypt_data(body_type)
        hashed_nmbr_seats = encrypt_data(nmbr_seats)
        hashed_nmbr_doors = encrypt_data(nmbr_doors)
        hashed_sun_roof = encrypt_data(sun_roof)
        hashed_transmission = encrypt_data(transmission)
        hashed_fuel_type = encrypt_data(fuel_type)
        hashed_drive_train = encrypt_data(drive_train)
        hashed_num_cylndrs = encrypt_data(num_cylndrs)
        hashed_money = encrypt_data(money)
        hashed_currency = encrypt_data(currency)
        hashed_insrd_till = encrypt_data(insrd_till)
        hashed_techn_insp_val_till = encrypt_data(techn_insp_val_till)
        hashed_client = encrypt_data(client)
        hashed_full_name = encrypt_data(full_name)
        hashed_ph_num = encrypt_data(ph_num)
        hashed_un_id = encrypt_data(un_id)
        hashed_status = encrypt_data("not approved")

        cur = mysql.connection.cursor()
        insert = cur.execute(
            "INSERT INTO cars (prod_id, car_condition, mileage, make, model, yrs_mnfctr, cntry_mnfctr, color, body_type, nmbr_seats, nmbr_doors, sun_roof, transmission, fuel_type, drive_train, num_cylndrs, money, currency, insrd_till, techn_insp_val_till, client, full_name, ph_num, status) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
            (hashed_un_id, hashed_car_condition, hashed_mileage, hashed_make, hashed_model, hashed_yrs_mnfctr,
             hashed_cntry_mnfctr, hashed_color, hashed_body_type, hashed_nmbr_seats,
             hashed_nmbr_doors, hashed_sun_roof, hashed_transmission, hashed_fuel_type, hashed_drive_train,
             hashed_num_cylndrs, hashed_money, hashed_currency, hashed_insrd_till,
             hashed_techn_insp_val_till, hashed_client, hashed_full_name, hashed_ph_num, hashed_status))
        mysql.connection.commit()

        if insert:
            files = request.files.getlist('files[]')
            ref_no = f'{random.randint(0, 1000000000)}'
            enc_ref_no = encrypt_data(ref_no)
            for file in files:
                if file and allowed_file(file.filename):
                    filename = secure_filename(file.filename)
                    file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
                    hashed_file = encrypt_data(filename)
                    set_status = encrypt_data("not main")
                    cur.execute(
                        "INSERT INTO cars_imgs (prod_id, prod_ref_no, imgs, img_status) VALUES (%s, %s, %s, %s)",
                        (hashed_un_id, enc_ref_no, [hashed_file], set_status))
                    mysql.connection.commit()
            cur.close()
        else:
            flash('File(s) not uploaded', 'error')
        flash('Car details sent successful', 'success')

    return redirect('/Sell')


@app.route('/Login')
def login():
    return render_template('login.html')


@app.route('/Login', methods=['POST'])
def get_login():
    if request.method == 'POST':
        username_input = request.form['username']
        password_input = request.form['password']

        cur = mysql.connection.cursor()
        cur.execute("SELECT id, username, password, names, utype, status FROM users")
        users = cur.fetchall()
        cur.close()

        # Loop through all users to find a matching decrypted username
        for user in users:
            decrypted_username = decrypt_data(user[1])
            decrypted_password = decrypt_data(user[2])
            decrypted_status = decrypt_data(user[5])
            if decrypted_username == username_input and decrypted_password == password_input:
                if decrypted_status == '1':
                    session['username'] = decrypted_username
                    session['user_id'] = user[0]
                    session['full_name'] = decrypt_data(user[3])
                    session['user_type'] = decrypt_data(user[4])
                    session['ip_address'] = request.remote_addr
                    session['session_id'] = str(uuid4())
                    session.permanent = True

                    # Log encrypted session details in session_logs
                    encrypted_session_id = encrypt_data(session['session_id'])
                    encrypted_ip_address = encrypt_data(session['ip_address'])
                    cur = mysql.connection.cursor()
                    cur.execute("INSERT INTO session_logs (user_id, session_id, ip_address) VALUES (%s, %s, %s)",
                                (session['user_id'], encrypted_session_id, encrypted_ip_address))
                    mysql.connection.commit()
                    cur.close()
                    flash('Login successful!', 'success')
                    return redirect(url_for('dashboard'))
                flash('Account is Locked by Admin!', 'error')
                return redirect(url_for('login'))

            status = encrypt_data("intruder")
            ip_addr = encrypt_data(request.remote_addr)
            username = encrypt_data(username_input)
            password = encrypt_data(password_input)

            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO failed_logs (username, password, ip_addr, status) VALUES (%s, %s, %s, %s)",
                        (username, password, ip_addr, status))
            mysql.connection.commit()
            cur.close()

        flash('Invalid username or password', 'error')

    return render_template('login.html')


@app.route('/Details')
def details():
    return render_template('details.html')


@app.route('/Blog')
def blog():
    cur = mysql.connection.cursor()
    cur.execute("SELECT id, title, description, images, status FROM blog LIMIT 4")
    rows = cur.fetchall()
    cur.close()

    blogs = []
    images = []
    for row in rows:
        blogs.append({
            'title': decrypt_data(row[1]),
            'description': decrypt_data(row[2]),
            'images': decrypt_data(row[3]),
            'status': decrypt_data(row[4])
        })

    return render_template('blog.html',
                           blogs=blogs)


@app.route('/Dashboard/')
@login_required
def dashboard():
    return render_template('dashboard/dashboard.html',
                           full_name=session.get('full_name'),
                           username=session.get('username'),
                           user_type=session.get('user_type')
                           )


@app.route('/Dashboard/users')
@login_required
def view_users():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM users")
    rows = cur.fetchall()

    decrypted_data = []
    for row in rows:
        decrypted_row = {
            'id': row[0],
            'names': decrypt_data(row[1]),
            'nid': decrypt_data(row[2]),
            'phone': decrypt_data(row[3]),
            'username': decrypt_data(row[4]),
            'password': decrypt_data(row[5]),
            'utype': decrypt_data(row[6]),
            'status': decrypt_data(row[7])
        }
        decrypted_data.append(decrypted_row)

    return render_template('dashboard/users.html',
                           data=decrypted_data,
                           full_name=session.get('full_name'),
                           username=session.get('username'),
                           user_type=session.get('user_type')
                           )


@app.route('/Dashboard/users', methods=["POST", "GET"])
@login_required
def add_user():
    if request.method == "POST":
        fullname = request.form['fullname']
        nid = request.form['nid']
        username = request.form['username']
        phonenum = request.form['phonenum']
        password = request.form['password']
        utype = request.form['utype']
        status = request.form['status']

        hashed_fullname = encrypt_data(fullname)
        hashed_nid = encrypt_data(nid)
        hashed_username = encrypt_data(username)
        hashed_phonenum = encrypt_data(phonenum)
        hashed_password = encrypt_data(password)
        hashed_utype = encrypt_data(utype)
        hashed_status = encrypt_data(status)

        cursor = mysql.connection.cursor()
        cursor.execute(
            "INSERT INTO users (names, nid, phone, username, password, utype, status) VALUES (%s, %s, %s, %s, %s, %s, %s)",
            (hashed_fullname, hashed_nid, hashed_phonenum, hashed_username, hashed_password, hashed_utype,
             hashed_status))
        mysql.connection.commit()
        cursor.close()
        flash("user added successful", 'success')
        return redirect(url_for("view_users"))
    flash("user didn't added yet", 'error')


@app.route('/Dashboard/users/del/<string:id_data>', methods=['GET'])
@login_required
def delete_user(id_data):
    flash("user has been deleted", 'success')
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM users WHERE id=%s", (id_data,))
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('view_users'))


@app.route('/Dashboard/users/update/', methods=["POST", "GET"])
@login_required
def update_user():
    if request.method == "POST":
        id_data = request.form['id']
        fullname = request.form['fullname']
        nid = request.form['nid']
        username = request.form['username']
        phonenum = request.form['phonenum']
        password = request.form['password']
        utype = request.form['utype']
        status = request.form['status']

        hashed_fullname = encrypt_data(fullname)
        hashed_nid = encrypt_data(nid)
        hashed_username = encrypt_data(username)
        hashed_phonenum = encrypt_data(phonenum)
        hashed_password = encrypt_data(password)
        hashed_utype = encrypt_data(utype)
        hashed_status = encrypt_data(status)

        cursor = mysql.connection.cursor()
        cursor.execute(
            "UPDATE users SET names=%s, nid=%s, phone=%s, username=%s, password=%s, utype=%s, status=%s WHERE id=%s",
            (hashed_fullname, hashed_nid, hashed_phonenum, hashed_username, hashed_password, hashed_utype,
             hashed_status, id_data))
        mysql.connection.commit()
        cursor.close()
        flash("user updated successful", 'success')
        return redirect(url_for("view_users"))
    flash("user didn't updated yet", 'error')


@app.route('/Dashboard/cars')
@login_required
def view_cars():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM cars")
    rows = cur.fetchall()

    decrypted_data = []
    for row in rows:
        decrypted_row = {
            'id': row[0],
            'prod_id': decrypt_data(row[1]),
            'car_condition': decrypt_data(row[2]),
            'mileage': decrypt_data(row[3]),
            'make': decrypt_data(row[4]),
            'model': decrypt_data(row[5]),
            'yrs_mnfctr': decrypt_data(row[6]),
            'cntry_mnfctr': decrypt_data(row[7]),
            'color': decrypt_data(row[8]),
            'body_type': decrypt_data(row[9]),
            'nmbr_seats': decrypt_data(row[10]),
            'nmbr_doors': decrypt_data(row[11]),
            'sun_roof': decrypt_data(row[12]),
            'transmission': decrypt_data(row[13]),
            'fuel_type': decrypt_data(row[14]),
            'drive_train': decrypt_data(row[15]),
            'num_cylndrs': decrypt_data(row[16]),
            'money': decrypt_data(row[17]),
            'currency': decrypt_data(row[18]),
            'insrd_till': decrypt_data(row[19]),
            'techn_insp_val_till': decrypt_data(row[20]),
            'client': decrypt_data(row[21]),
            'full_name': decrypt_data(row[22]),
            'ph_num': decrypt_data(row[23]),
            'status': decrypt_data(row[24]),
            'display': row[25]

        }
        decrypted_data.append(decrypted_row)

    return render_template('dashboard/cars.html',
                           data=decrypted_data,
                           full_name=session.get('full_name'),
                           username=session.get('username'),
                           user_type=session.get('user_type')
                           )


@app.route('/Dashboard/car/del/<string:id_data>', methods=['GET'])
@login_required
def delete_car(id_data):
    flash("car has been deleted", 'success')
    cur = mysql.connection.cursor()

    cur.execute("SELECT prod_id FROM cars WHERE id=%s", (id_data,))
    product_id = cur.fetchone()

    cur.execute("SELECT imgs FROM cars_imgs WHERE prod_id=%s", (product_id,))
    prod_id = cur.fetchall()

    if not prod_id:
        flash("No images found for this car", 'error')

    deleted_files = []
    failed_deletes = []

    for record in prod_id:
        encrypted_filenames = record[0].split(',')
        for encrypted_filename in encrypted_filenames:
            decrypted_filename = decrypt_data(encrypted_filename)

            # Construct the path to the file in local storage
            file_path = os.path.join(UPLOAD_FOLDER, decrypted_filename)

            # Delete the file from local storage
            if os.path.exists(file_path):
                try:
                    os.remove(file_path)
                    deleted_files.append(decrypted_filename)
                except Exception as e:
                    flash(f"Failed to delete {decrypted_filename}: {e}", 'error')
                    failed_deletes.append(decrypted_filename)

    cur.execute("DELETE FROM cars WHERE id=%s", (id_data,))
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('view_cars'))


@app.route('/Dashboard/car/upload', methods=["POST"])
@login_required
def upload_car():
    def rand_str(len, chars):
        random_str = ""
        for i in range(len):
            random_str += random.choice(chars)
        return random_str

    if request.method == "POST":

        car_condition = request.form['car_condition']
        mileage = request.form['mileage']
        make = request.form['make']
        model = request.form['model']
        yrs_mnfctr = request.form['yrs_mnfctr']
        cntry_mnfctr = request.form['cntry_mnfctr']
        color = request.form['color']
        body_type = request.form['body_type']
        nmbr_seats = request.form['nmbr_seats']
        nmbr_doors = request.form['nmbr_doors']
        sun_roof = request.form['sun_roof']
        transmission = request.form['transmission']
        fuel_type = request.form['fuel_type']
        drive_train = request.form['drive_train']
        num_cylndrs = request.form['num_cylndrs']
        money = request.form['money']
        currency = request.form['currency']
        insrd_till = request.form['insrd_till']
        techn_insp_val_till = request.form['techn_insp_val_till']
        client = request.form['client']
        full_name = request.form['full_name']
        ph_num = request.form['ph_num']
        rand_int = random.randint(0, 10000)
        randm_str = rand_str(4, "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ")
        un_id = f'{rand_int}{randm_str}'

        hashed_car_condition = encrypt_data(car_condition)
        hashed_mileage = encrypt_data(mileage)
        hashed_make = encrypt_data(make)
        hashed_model = encrypt_data(model)
        hashed_yrs_mnfctr = encrypt_data(yrs_mnfctr)
        hashed_cntry_mnfctr = encrypt_data(cntry_mnfctr)
        hashed_color = encrypt_data(color)
        hashed_body_type = encrypt_data(body_type)
        hashed_nmbr_seats = encrypt_data(nmbr_seats)
        hashed_nmbr_doors = encrypt_data(nmbr_doors)
        hashed_sun_roof = encrypt_data(sun_roof)
        hashed_transmission = encrypt_data(transmission)
        hashed_fuel_type = encrypt_data(fuel_type)
        hashed_drive_train = encrypt_data(drive_train)
        hashed_num_cylndrs = encrypt_data(num_cylndrs)
        hashed_money = encrypt_data(money)
        hashed_currency = encrypt_data(currency)
        hashed_insrd_till = encrypt_data(insrd_till)
        hashed_techn_insp_val_till = encrypt_data(techn_insp_val_till)
        hashed_client = encrypt_data(client)
        hashed_full_name = encrypt_data(full_name)
        hashed_ph_num = encrypt_data(ph_num)
        hashed_un_id = encrypt_data(un_id)
        hashed_status = encrypt_data("not approved")

        cur = mysql.connection.cursor()
        insert = cur.execute(
            "INSERT INTO cars (prod_id, car_condition, mileage, make, model, yrs_mnfctr, cntry_mnfctr, color, body_type, nmbr_seats, nmbr_doors, sun_roof, transmission, fuel_type, drive_train, num_cylndrs, money, currency, insrd_till, techn_insp_val_till, client, full_name, ph_num, status) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
            (hashed_un_id, hashed_car_condition, hashed_mileage, hashed_make, hashed_model, hashed_yrs_mnfctr,
             hashed_cntry_mnfctr, hashed_color, hashed_body_type, hashed_nmbr_seats,
             hashed_nmbr_doors, hashed_sun_roof, hashed_transmission, hashed_fuel_type, hashed_drive_train,
             hashed_num_cylndrs, hashed_money, hashed_currency, hashed_insrd_till,
             hashed_techn_insp_val_till, hashed_client, hashed_full_name, hashed_ph_num, hashed_status))
        mysql.connection.commit()

        if insert:
            files = request.files.getlist('files[]')
            ref_no = f'{random.randint(0, 1000000000)}'
            enc_ref_no = encrypt_data(ref_no)
            for file in files:
                if file and allowed_file(file.filename):
                    filename = secure_filename(file.filename)
                    file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
                    hashed_file = encrypt_data(filename)
                    hashed_img_status = encrypt_data("not main")
                    cur.execute(
                        "INSERT INTO cars_imgs (prod_id, prod_ref_no, imgs, img_status) VALUES (%s, %s, %s, %s)",
                        (hashed_un_id, enc_ref_no, [hashed_file], hashed_img_status))
                    mysql.connection.commit()
            cur.close()

        else:
            flash('File(s) not uploaded', 'error')
        flash('Car details uploaded successful', 'success')

    return redirect('/Dashboard/cars')


@app.route('/Dashboard/car/update', methods=["POST"])
@login_required
def update_car():
    if request.method == "POST":
        car_id = request.form['car_id']
        car_condition = request.form['car_condition']
        mileage = request.form['mileage']
        make = request.form['make']
        model = request.form['model']
        yrs_mnfctr = request.form['yrs_mnfctr']
        cntry_mnfctr = request.form['cntry_mnfctr']
        color = request.form['color']
        body_type = request.form['body_type']
        nmbr_seats = request.form['nmbr_seats']
        nmbr_doors = request.form['nmbr_doors']
        sun_roof = request.form['sun_roof']
        transmission = request.form['transmission']
        fuel_type = request.form['fuel_type']
        drive_train = request.form['drive_train']
        num_cylndrs = request.form['num_cylndrs']
        money = request.form['money']
        currency = request.form['currency']
        insrd_till = request.form['insrd_till']
        techn_insp_val_till = request.form['techn_insp_val_till']
        client = request.form['client']
        full_name = request.form['full_name']
        ph_num = request.form['ph_num']

        hashed_car_condition = encrypt_data(car_condition)
        hashed_mileage = encrypt_data(mileage)
        hashed_make = encrypt_data(make)
        hashed_model = encrypt_data(model)
        hashed_yrs_mnfctr = encrypt_data(yrs_mnfctr)
        hashed_cntry_mnfctr = encrypt_data(cntry_mnfctr)
        hashed_color = encrypt_data(color)
        hashed_body_type = encrypt_data(body_type)
        hashed_nmbr_seats = encrypt_data(nmbr_seats)
        hashed_nmbr_doors = encrypt_data(nmbr_doors)
        hashed_sun_roof = encrypt_data(sun_roof)
        hashed_transmission = encrypt_data(transmission)
        hashed_fuel_type = encrypt_data(fuel_type)
        hashed_drive_train = encrypt_data(drive_train)
        hashed_num_cylndrs = encrypt_data(num_cylndrs)
        hashed_money = encrypt_data(money)
        hashed_currency = encrypt_data(currency)
        hashed_insrd_till = encrypt_data(insrd_till)
        hashed_techn_insp_val_till = encrypt_data(techn_insp_val_till)
        hashed_client = encrypt_data(client)
        hashed_full_name = encrypt_data(full_name)
        hashed_ph_num = encrypt_data(ph_num)

        cur = mysql.connection.cursor()
        cur.execute(
            """UPDATE cars SET car_condition=%s, mileage=%s, make=%s, model=%s, yrs_mnfctr=%s, 
            cntry_mnfctr=%s, color=%s, body_type=%s, nmbr_seats=%s, nmbr_doors=%s, sun_roof=%s, 
            transmission=%s, fuel_type=%s, drive_train=%s, num_cylndrs=%s, money=%s, currency=%s, 
            insrd_till=%s, techn_insp_val_till=%s, client=%s, full_name=%s, ph_num=%s WHERE id=%s """,
            (hashed_car_condition, hashed_mileage, hashed_make, hashed_model, hashed_yrs_mnfctr,
             hashed_cntry_mnfctr, hashed_color, hashed_body_type, hashed_nmbr_seats,
             hashed_nmbr_doors, hashed_sun_roof, hashed_transmission, hashed_fuel_type, hashed_drive_train,
             hashed_num_cylndrs, hashed_money, hashed_currency, hashed_insrd_till,
             hashed_techn_insp_val_till, hashed_client, hashed_full_name, hashed_ph_num, car_id))
        mysql.connection.commit()
        cur.close()
        flash('Car details updated successful', 'success')
        return redirect(url_for("view_cars"))
    flash("car did not updated try again!!!", 'error')

@app.route('/Dashboard/car/add-extra-imgs', methods=["POST"])
@login_required
def add_extra_car_imgs():


    cur = mysql.connection.cursor()


    files = request.files.getlist('files[]')
    a = request.form['un_id']
    prod_no = encrypt_data(a)
    cur.execute("SELECT prod_ref_no FROM cars_imgs WHERE prod_id=%s", (prod_no,))
    ref_no = cur.fetchone()

    for file in files:
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            hashed_file = encrypt_data(filename)
            hashed_img_status = encrypt_data("not main")
            cur.execute(
                "INSERT INTO cars_imgs (prod_id, prod_ref_no, imgs, img_status) VALUES (%s, %s, %s, %s)",
                (prod_no, ref_no, [hashed_file], hashed_img_status))
            mysql.connection.commit()
            cur.close()
            flash("Extra Image(s) has been added", 'success')
            previous_page = request.referrer
            return redirect(previous_page)
        flash("Oops something wrong", 'error')


@app.route('/Dashboard/car/delete-extra-imgs/<int:id>', methods=["GET"])
@login_required
def delete_extra_car_imgs(id):

    try:
        # Start database cursor
        cur = mysql.connection.cursor()

        # Step 2: Set only the specified row (by id) to 'main'
        cur.execute("UPDATE cars_imgs SET img_status = %s WHERE id = %s", (encrypt_data("deleted"), id))

        # Commit the transaction
        mysql.connection.commit()

        # Close the cursor
        cur.close()

        # Flash success message
        flash("Car Deleted successfully!", "success")
        return redirect(request.referrer or url_for('view_cars'))
    except Exception as e:
        flash(f"An error occurred: {e}", "error")

        return redirect(request.referrer or url_for('view_cars'))



@app.route('/Dashboard/car/approve', methods=["POST"])
@login_required
def approve():
    approve_id = request.form['id']
    approve = "approved"
    hash_approve = encrypt_data(approve)
    cur = mysql.connection.cursor()
    cur.execute("UPDATE cars SET status=%s WHERE id=%s", (hash_approve, approve_id))
    mysql.connection.commit()
    cur.close()
    flash("Product approved activated successful", 'success')
    return redirect(url_for('view_cars'))


@app.route('/Dashboard/car/un-approve', methods=["POST"])
@login_required
def un_approve():
    approve_id = request.form['id']
    un_approve = "not approved"
    hashed_un_approve = encrypt_data(un_approve)
    cur = mysql.connection.cursor()
    cur.execute("UPDATE cars SET status=%s WHERE id=%s", (hashed_un_approve, approve_id))
    mysql.connection.commit()
    cur.close()
    flash("Product un-approved activated successful", 'success')
    return redirect(url_for('view_cars'))


@app.route('/Dashboard/car-details/<string:car_id>')
@login_required
def car_details(car_id):
    item = {}
    images = []
    hashed_prod_id = encrypt_data(car_id)
    deleted = encrypt_data('deleted')
    cur = mysql.connection.cursor()
    cur.execute("""SELECT c.*, i.imgs, i.img_status, i.id, i.prod_ref_no FROM cars AS c LEFT JOIN cars_imgs 
    AS i ON c.prod_id=i.prod_id WHERE c.prod_id=%s AND i.img_status!=%s""", (hashed_prod_id,deleted))

    rows = cur.fetchall()
    mysql.connection.commit()
    cur.close()

    for row in rows:
        item = {
            'id': row[0],
            'prod_id': decrypt_data(row[1]),
            'car_condition': decrypt_data(row[2]),
            'mileage': decrypt_data(row[3]),
            'make': decrypt_data(row[4]),
            'model': decrypt_data(row[5]),
            'yrs_mnfctr': decrypt_data(row[6]),
            'cntry_mnfctr': decrypt_data(row[7]),
            'color': decrypt_data(row[8]),
            'body_type': decrypt_data(row[9]),
            'nmbr_seats': decrypt_data(row[10]),
            'nmbr_doors': decrypt_data(row[11]),
            'sun_roof': decrypt_data(row[12]),
            'transmission': decrypt_data(row[13]),
            'fuel_type': decrypt_data(row[14]),
            'drive_train': decrypt_data(row[15]),
            'num_cylndrs': decrypt_data(row[16]),
            'money': decrypt_data(row[17]),
            'currency': decrypt_data(row[18]),
            'insrd_till': decrypt_data(row[19]),
            'techn_insp_val_till': decrypt_data(row[20]),
            'client': decrypt_data(row[21]),
            'full_name': decrypt_data(row[22]),
            'ph_num': decrypt_data(row[23]),
            'status': decrypt_data(row[24]),
            'display': row[25]

        }
        product_id = decrypt_data(row[1])
        try:
            decrypted_image_name = decrypt_data(row[26])  # row[3] is the encrypted image name
            image_path = f"{decrypted_image_name}"  # Path to the local image file
            
            img_status = decrypt_data(row[27])
            images.append({'url': image_path, 'status': img_status, 'id': row[28],
                           'ref_no': decrypt_data(row[29])})  # row[4] is the image status
        except Exception as e:
            print(f"Error decrypting image name for product ID {product_id}: {e}")

    return render_template('dashboard/car_details.html',
                           item=item, images=images,
                           full_name=session.get('full_name'),
                           username=session.get('username'),
                           user_type=session.get('user_type')
                           )


# blog crud section

@app.route('/Dashboard/blog')
@login_required
def view_blog():
    cur = mysql.connection.cursor()
    cur.execute("SELECT id, title, description, images, status FROM blog")
    rows = cur.fetchall()
    cur.close()

    blogs = []
    images = []
    for row in rows:
        blogs.append({
            'id': row[0],
            'title': decrypt_data(row[1]),
            'description': decrypt_data(row[2]),
            'images': decrypt_data(row[3]),
            'status': decrypt_data(row[4])
        })

    return render_template('dashboard/blog.html',
                           blogs=blogs,
                           full_name=session.get('full_name'),
                           username=session.get('username'),
                           user_type=session.get('user_type')
                           )


@app.route('/Dashboard/blog', methods=["POST", "GET"])
@login_required
def add_blog():
    if request.method == 'POST':
        title = encrypt_data(request.form['title'])
        description = encrypt_data(request.form['description'])
        status = encrypt_data(request.form['status'])

        # Save the uploaded file
        file = request.files['image']
        if file:
            filename = file.filename
            file.save(os.path.join('static/sell_imgs/blog/', filename))
            hashed_filename = encrypt_data(filename)
        cur = mysql.connection.cursor()
        cur.execute("""
               INSERT INTO blog (title, description, images, status)
               VALUES (%s, %s, %s, %s)
           """, (title, description, hashed_filename, status))
        mysql.connection.commit()
        cur.close()
        flash("blog added successful, but you need to activate it", 'success')
        return redirect(url_for("view_blog"))

    return render_template('dashboard/blog.html',
                           full_name=session.get('full_name'),
                           username=session.get('username'),
                           user_type=session.get('user_type')
                           )


@app.route('/Dashboard/blog/del/<int:id_data>', methods=['GET'])
@login_required
def delete_blog(id_data):
    cur = mysql.connection.cursor()

    # First, retrieve the image filename from the database
    cur.execute("SELECT images FROM blog WHERE id = %s", (id_data,))
    result = cur.fetchone()

    if result:
        image_filename = result[0]  # This will be the encrypted filename
        # Assuming images are stored in a directory called 'uploads'
        local_file_path = os.path.join('static/sell_imgs/blog/',
                                       decrypt_data(image_filename))  # Decrypt the filename for local storage

        # Unlink (delete) the local file
        if os.path.exists(local_file_path):
            os.remove(local_file_path)  # Delete the file from local storage
        else:
            flash('File does not exist on the server.', 'error')

    # Now, delete the blog post from the database
    cur.execute("DELETE FROM blog WHERE id = %s", (id_data,))
    mysql.connection.commit()
    cur.close()

    flash('Blog post deleted successfully', 'success')
    return redirect(url_for('view_blog'))


@app.route('/Dashboard/blog/update/', methods=["POST", "GET"])
@login_required
def update_blog():
    if request.method == 'POST':
        blog_id = request.form['id']
        title = encrypt_data(request.form['title'])
        description = encrypt_data(request.form['description'])
        status = encrypt_data(request.form['status'])

        # Update the blog post in the database
        cur = mysql.connection.cursor()
        cur.execute("""
                UPDATE blog
                SET title = %s, description = %s, status = %s
                WHERE id = %s
            """, (title, description, status, blog_id))
        mysql.connection.commit()
        cur.close()

        flash('Blog post updated successfully', 'success')
        return redirect(url_for('view_blog'))


@app.route("/Dashboard/car-details/main-pic/<string:prod_ref_no>/<int:id>", methods=['POST'])
@login_required
def change_status(prod_ref_no, id):
    try:
        # Start database cursor
        cur = mysql.connection.cursor()
        deleted = encrypt_data('deleted')

        # Step 1: Set all rows with the given prod_ref_no to 'un main'
        cur.execute("UPDATE cars_imgs SET img_status = %s WHERE prod_ref_no = %s AND img_status != %s",
                    (encrypt_data("not main"), encrypt_data(prod_ref_no), deleted))

        # Step 2: Set only the specified row (by id) to 'main'
        cur.execute("UPDATE cars_imgs SET img_status = %s WHERE id = %s", (encrypt_data("main"), id))

        # Commit the transaction
        mysql.connection.commit()

        # Close the cursor
        cur.close()

        # Flash success message
        flash("Record updated successfully!", "success")
        return redirect(request.referrer or url_for('view_cars'))
    except Exception as e:
        flash(f"An error occurred: {e}", "error")

        return redirect(request.referrer or url_for('view_cars'))


@app.route('/Register/Agent')
def reg_agent():

    return render_template("reg_agent.html")

@app.route('/Register/Agent', methods=["POST", "GET"])
def add_agent():
    if request.method == "POST":

        fname = encrypt_data(request.form['fname'])
        tel = encrypt_data(request.form['tel'])
        nid = encrypt_data(request.form['nid'])
        addr = encrypt_data(request.form['addr'])
    

        cursor = mysql.connection.cursor()
        cursor.execute(
            "INSERT INTO agents (names, tel, id_no, address) VALUES (%s, %s, %s, %s)",
            (fname,tel,nid,addr))
        mysql.connection.commit()
        cursor.close()
        flash("Your request has been sent successfuly we'll get in touch soon", 'success')
        return redirect(url_for("reg_agent"))
    flash("Your request has been not yet sent try again", 'error')


@app.route('/Seek/Car')
def seek():

    return render_template("seek_car.html")

@app.route('/Seek/Car', methods=["POST", "GET"])
def add_seek():
    if request.method == "POST":

        make = encrypt_data(request.form['make'])
        model = encrypt_data(request.form['model'])
        yr_mnfct = encrypt_data(request.form['yr_mnfct'])
        transmission = encrypt_data(request.form['transmission'])
        fuel_type = encrypt_data(request.form['fuel_type'])
        engine = encrypt_data(request.form['engine'])
        seats = encrypt_data(request.form['seats'])
        doors = encrypt_data(request.form['doors'])
        sunroof = encrypt_data(request.form['sunroof'])
        mileage = encrypt_data(request.form['mileage'])
        budget = encrypt_data(request.form['budget'])
        names = encrypt_data(request.form['names'])
        pnum = encrypt_data(request.form['pnum'])
       

        cursor = mysql.connection.cursor()
        cursor.execute(
            "INSERT INTO seek_cars (make,model,yr_mnfct,transmission,fuel,engine,seats,doors,sunroof,avg_milage,budget,names,phone) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
            (make,model,yr_mnfct,transmission,fuel_type,engine,seats,doors,sunroof,mileage,budget,names,pnum))
        mysql.connection.commit()
        cursor.close()
        flash("Your request has been sent successfuly we'll get in touch as soon as possible", 'success')
        return redirect(url_for("seek"))
    flash("Your request has been not yet sent try again", 'error')


@app.route('/Make/Deal')
def deal():

    return render_template("make_deal.html")

@app.route('/Make/Deal', methods=["POST", "GET"])
def add_deal():
    if request.method == "POST":

        name = encrypt_data(request.form['name'])
        tel = encrypt_data(request.form['tel'])
        your_car = encrypt_data(request.form['your_car'])
        seek_car = encrypt_data(request.form['seek_car'])
        
       

        cursor = mysql.connection.cursor()
        cursor.execute(
            "INSERT INTO deals (names,tel,your_car,seek_car) VALUES (%s, %s, %s, %s)",
            (name,tel,your_car,seek_car))
        mysql.connection.commit()
        cursor.close()
        flash("Your request has been sent successfuly we'll get in touch as soon as possible", 'success')
        return redirect(url_for("deal"))
    flash("Your request has been not yet sent try again", 'error')



@app.route('/logout')
def logout():
    session.pop('username', None)
    session.pop('user_id', None)
    session.pop('full_name', None)
    session.pop('user_type', None)
    session.pop('ip_address', None)
    session.pop('session_id', None)

    return redirect(url_for('login'))


@app.context_processor
def inject_year():
    return {'current_year': datetime.now().year}


@app.route('/Dashboard/agents')
@login_required
def view_agents():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM agents")
    rows = cur.fetchall()

    decrypted_data = []
    for row in rows:
        decrypted_row = {
            'id': row[0],
            'names': decrypt_data(row[1]),
            'tel': decrypt_data(row[2]),
            'id_no': decrypt_data(row[3]),
            'address': decrypt_data(row[4])
            
        }
        decrypted_data.append(decrypted_row)

    return render_template('dashboard/agents.html', data=decrypted_data)


@app.route('/Dashboard/seek-cars')
@login_required
def view_seek():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM seek_cars")
    rows = cur.fetchall()

    decrypted_data = []
    for row in rows:
        decrypted_row = {
            'id': row[0],
            'make': decrypt_data(row[1]),
            'model': decrypt_data(row[2]),
            'yr_mnfct': decrypt_data(row[3]),
            'transmission': decrypt_data(row[4]),
            'fuel': decrypt_data(row[5]),
            'engine': decrypt_data(row[6]),
            'seats': decrypt_data(row[7]),
            'doors': decrypt_data(row[8]),
            'sunroof': decrypt_data(row[9]),
            'avg_milage': decrypt_data(row[10]),
            'budget': decrypt_data(row[11]),
            'names': decrypt_data(row[12]),
            'phone': decrypt_data(row[13])

        }
        decrypted_data.append(decrypted_row)

    return render_template('dashboard/seek_cars.html', data=decrypted_data)


@app.route('/Dashboard/deals')
@login_required
def view_deals():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM deals")
    rows = cur.fetchall()

    decrypted_data = []
    for row in rows:
        decrypted_row = {
            'id': row[0],
            'names': decrypt_data(row[1]),
            'tel': decrypt_data(row[2]),
            'your_car': decrypt_data(row[3]),
            'seek_car': decrypt_data(row[4])
            
        }
        decrypted_data.append(decrypted_row)

    return render_template('dashboard/deals.html', data=decrypted_data)

@app.route('/Dashboard/my-profile')
@login_required
def my_profile():
    
    cur = mysql.connection.cursor()
    

    username = session.get('username')
    
    if not username:
        
        return redirect(url_for('login'))
    
    cur.execute("SELECT * FROM users WHERE username=%s", (encrypt_data(username),))
    rows = cur.fetchall()

    decrypted_data = []
    for row in rows:
        decrypted_row = {
            'id': row[0],
            'names': decrypt_data(row[1]), 
            'nid': decrypt_data(row[2]),   
            'phone': decrypt_data(row[3]), 
            'username': decrypt_data(row[4]), 
            'password': decrypt_data(row[5]),
            'utype': decrypt_data(row[6])  
        }
        decrypted_data.append(decrypted_row)


    cur.close()

    return render_template('dashboard/profile.html', data=decrypted_data)

@app.route('/Dashboard/agent/del/<string:id_data>', methods=['GET'])
@login_required
def delete_agent(id_data):
    flash("One of Agent has been deleted", 'success')
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM agents WHERE id=%s", (id_data,))
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('view_agents'))


@app.route('/Dashboard/seek-car/del/<string:id_data>', methods=['GET'])
@login_required
def delete_seek(id_data):
    flash("One of seeking cars has been deleted", 'success')
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM seek_cars WHERE id=%s", (id_data,))
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('view_seek'))


@app.route('/Dashboard/deals/del/<string:id_data>', methods=['GET'])
@login_required
def delete_deel(id_data):
    flash("One of car deals has been deleted", 'success')
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM deals WHERE id=%s", (id_data,))
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('view_deals'))



@app.route('/terms_condition')
def terms_condition():
    return render_template('terms&conditions.html')

@app.route('/privacy')
def privacy():
    return render_template('privacy.html')


@app.route('/Search', methods=['GET'])
def search_cars():
    # Get the search term from the query parameters
    query = request.args.get('q')  # Search term from the user input
    cars = []
    images = []

    if query:
        # Convert query to lowercase for comparison
        lowercase_query = query.lower()

        # Initialize database cursor
        cur = mysql.connection.cursor()
        cur.execute("""
             SELECT c.*, i.imgs, i.img_status, i.id, i.prod_ref_no 
             FROM cars AS c 
             LEFT JOIN cars_imgs AS i 
             ON c.prod_id = i.prod_id 
             WHERE i.img_status = %s AND c.status = %s
         """, (
            encrypt_data('main'),  # Encrypted img_status
            encrypt_data('approved')  # Encrypted car status
        ))

        # Fetch all results
        car_rows = cur.fetchall()
        for row in car_rows:
            money_value = decrypt_data(row[17])  # Decrypt money value
            try:
                # Format money value with commas
                formatted_money = f"{int(money_value):,}"
            except ValueError:
                # Handle case where money_value is not a valid integer
                formatted_money = "Invalid Value"

            # Decrypt make and model for comparison
            decrypted_make = decrypt_data(row[4])
            decrypted_model = decrypt_data(row[5])

            # Print decrypted make and model for debugging
            print(f"Decrypted Make: {decrypted_make}, Decrypted Model: {decrypted_model}")

            # Compare user query with decrypted make and model
            if lowercase_query in decrypted_make.lower() or lowercase_query in decrypted_model.lower():
                # Decrypt remaining car details and append to the list
                car = {
                    'id': row[0],
                    'prod_id': decrypt_data(row[1]),
                    'car_condition': decrypt_data(row[2]),
                    'mileage': decrypt_data(row[3]),
                    'make': decrypted_make,
                    'model': decrypted_model,
                    'yrs_mnfctr': decrypt_data(row[6]),
                    'cntry_mnfctr': decrypt_data(row[7]),
                    'color': decrypt_data(row[8]),
                    'body_type': decrypt_data(row[9]),
                    'nmbr_seats': decrypt_data(row[10]),
                    'nmbr_doors': decrypt_data(row[11]),
                    'sun_roof': decrypt_data(row[12]),
                    'transmission': decrypt_data(row[13]),
                    'fuel_type': decrypt_data(row[14]),
                    'drive_train': decrypt_data(row[15]),
                    'num_cylndrs': decrypt_data(row[16]),
                    'money': formatted_money,
                    'currency': decrypt_data(row[18]),
                    'insrd_till': decrypt_data(row[19]),
                    'techn_insp_val_till': decrypt_data(row[20]),
                    'client': decrypt_data(row[21]),
                    'full_name': decrypt_data(row[22]),
                    'ph_num': decrypt_data(row[23]),
                    'status': decrypt_data(row[24]),
                    'display': row[25]
                }

                # Image handling
                try:
                    decrypted_image_name = decrypt_data(row[26])  # Decrypt image name
                    image_path = f"sell_imgs/{decrypted_image_name}"  # Construct image path
                    images.append({'url': image_path, 'ref_no': row[28]})  # Add image data
                except Exception as e:
                    print(f"Error decrypting image name for product ID {row[1]}: {e}")

                cars.append(car)

        cur.close()

    # Combine cars and images for rendering
    buy_image_pairs = [{'car': car, 'image': image} for car, image in zip(cars, images)]

    # Render the search results
    return render_template('search_car.html',
                           buy_image_pairs=buy_image_pairs, query=query)

@app.route("/Dashboard/car/display/yes/<int:id>")
def display_yes(id):
    dis = 1
    cur = mysql.connection.cursor()
    cur.execute("UPDATE cars SET display = %s WHERE id = %s", (dis, id))
    mysql.connection.commit()
    cur.close()
    flash("Car set to show on home successfully...", "success")
    return redirect(url_for('view_cars'))

@app.route("/Dashboard/car/display/not/<int:id>")
def display_not(id):
    dis = 0
    cur = mysql.connection.cursor()
    cur.execute("UPDATE cars SET display = %s WHERE id = %s", (dis, id))
    mysql.connection.commit()
    cur.close()
    flash("Car set ..not.. to show on home successfully...", "error")
    return redirect(url_for('view_cars'))

if __name__ == "__main__":
    app.run(debug=True)
