-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2025 at 07:04 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autospot`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(10) NOT NULL,
  `names` varchar(200) NOT NULL,
  `tel` varchar(200) NOT NULL,
  `id_no` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `names`, `tel`, `id_no`, `address`, `created_at`) VALUES
(3, '0XixHkgF4ErzrzrPcLLvQw==', '2ZQzjfgj/dFRDoL808LKlg==', 'pV6wEVuoSkrNhyZyFXgNV8up9HX4gnX1tRZzwIEFsSk=', '6Eppw20TY4SRDef0H4rcyQ==', '2025-01-11 11:29:32');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `images` varchar(300) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `description`, `images`, `status`) VALUES
(5, '+ykxfHexaA5mIG96bvB30qarEid5UH2cGYDRugfwbIivbH+4es7i5fG/+zgcfmCawY8CmRn2vfuwI2JKMX1L8tiNcsnsGp2Jt1krNTymTs/L24Tc4F7nf7V8v8+JBr02', '5v9rAzc6WRpeqiA7m4F9Wnv/c9wzWoemXBHXMmd4vzFZot8rgCGlvCEB/brcVOCsp//xaVJ8FxWK6WLoYfB+dAFXHWduIpMz2GjRenRMjtaAwA9ZyqtzJ2iim2cbIN3dq7pTUFpj5aDYINndq93HvXLwwGDNvrSObrUYDSF7jpAl30fRf5aTYWLND690mrnW08Rg/4cbi9NkaDP6m6VgwPooBGo6xI6kgrQHYW0DeHdEpZXqx0i/F+gW5Z2azGMjKXa48DDGqDmrXlawktxCoLRtmafSryvUD8uhPeK/ySm04ANYr6alMZH4ThtuxQ04dPAJLTdaSuuvBZu7V9KhiASFl9zPE+jK1zcL2GkqSvyyEdwrwtYFnkGLUle2MewWGMmaAdct9GFE7Ok2ZJwAerr56dlkziE1zySlPxasbdko1Y9Y+VCVph1QHWdgs1oSZe94itGlV3KBA0FaQlCMKQwoEjhT3g1Jr7XO3fJa1Pc44CuG96uym+I5Xu0CAyNQbGNaM2xxEJ+JRuJ/Y/ARqQimVa4bu+R9J792Ni6fZmoZJXmRCJoFqGsgz9UYoEVffyeuSKPnrbjSIndKC13dxwW1I+YwSCdzgROs9X/3h/orkwn9hUYgy4+R97klhovPxc5ZUZny22LFT3Yh7Xozn1ZcE/eSCjo29MRWZ3NFCoRwFfMsCkbS/BYrE7vy5EbFIzO51QQ5PUpg7aaT/QuSoDbh3d6bH1gfCVZw8sb31kskA4pwyWLL5aTZplolnuFR+UncZfSjbET3hngyDcSV784iXWOg8dbCT0h6Qz8L2bHKFPuxlrGLYTc1u8ivA79GgcTrpZRHH/ovqBZeqQ3yezLKOel/UbZFMR9I5LRWplJtGbzGfyktg6GXpao+pgtCJxXHMzzCiRupqlT6I8VgH+pg/Abj+ffHlxFob1v8X8KJHgkH+j/FFcIPgIKeovFp4pYB/P6IJwEP9aEfa5ZvuX9sCqXfo4HFEMJb3jOwnTkGU9UB2Dkxzix7t8kzNFdeBx27Wbbf9a4NUVOysgkRsL+Ca/BW69rocJxfzoEvVWmqOJih154843jjrtjh6+F7/Vobu+Q1Zs4cXHdCfsuU8vmk0tZA89RAOhqUt5q88WlL14hLY705J9s/+XZBysv8zC+dwtzB/QibzlOvFaHa8q9zNtxCgOsX3g3NbmRrEiwPlo3C6KhzB9nIfWjk7C7hr+Lh3PjmOs0A4VnmOMSuzYLahziobpxkrXQ1DYmlRPQOYMEwkBgYL1MDnxq99kXU5597p/P9PZu7NQIq2CBL3mQPaAzstNBdfbf3Ua2bQTA8YCOlNGMKjmr94BkXZAlII6QrUaSL4EcHYlXDh7y/cnO2mxp/e1lRMNeyYMjjh7zv8J2LCqQaLZyY/0Qu5lNpU6jwmxk33f0OjOoCbArIYh9HkAYuouJiOBCwzDgmqP84OcToEGF5eXFTH+/V72/OD7oSJyo2hp/q0ZjszbyyYlMtxd01EaEJLsvsXNnxTL6AW1j5FFQYyNTgl4OvxmtGdTknkCzuWX5wgo4Q31wRoenVI6uTwckNqGxpdZC9SytaZa783INV1QEtZeripRAGyDT//KQuRg4GSSD3L6jQKgaA5hOisavj+nFNGXzXZZv13IfQwBdqQogRwN6fQLmBYFUtm6LS+GJ5dmAC9yi4cbEYlKYFpyUlsbfAfNMGm5iGxlY3ZodHN8O547KOvmKQr4sSYDYJcamhXdA3Ee3fwoZEYGoAnpTUb6VNWvxTXpK/hIjfjFe3nmPJjn02LMvLY1bKuZbpg/7ET4fHQmnn09/GMLyg0hQrvxeRXdY2LIRpWPIcLQ/2Pt3Ib0Gvo1ij1cnnZ2++Q1Ot0v1Vew/j8DotCxV/x6J6bw8ijYYB1FU=', '+ve+W6Il7VYgwX9D5oy6dNtWXRkbzlOLzflwrVQSp5s=', 'KqRcb6GJisc0FZAbx0xF6g==');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(20) NOT NULL,
  `prod_id` varchar(200) NOT NULL,
  `car_condition` varchar(200) NOT NULL,
  `mileage` varchar(200) NOT NULL,
  `make` varchar(200) NOT NULL,
  `model` varchar(200) NOT NULL,
  `yrs_mnfctr` varchar(200) NOT NULL,
  `cntry_mnfctr` varchar(100) NOT NULL,
  `color` varchar(200) NOT NULL,
  `body_type` varchar(200) NOT NULL,
  `nmbr_seats` varchar(200) NOT NULL,
  `nmbr_doors` varchar(200) NOT NULL,
  `sun_roof` varchar(200) NOT NULL,
  `transmission` varchar(200) NOT NULL,
  `fuel_type` varchar(200) NOT NULL,
  `drive_train` varchar(200) NOT NULL,
  `num_cylndrs` varchar(200) NOT NULL,
  `money` varchar(200) NOT NULL,
  `currency` varchar(200) NOT NULL,
  `insrd_till` varchar(200) NOT NULL,
  `techn_insp_val_till` varchar(200) NOT NULL,
  `client` text NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `ph_num` varchar(200) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `display` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `prod_id`, `car_condition`, `mileage`, `make`, `model`, `yrs_mnfctr`, `cntry_mnfctr`, `color`, `body_type`, `nmbr_seats`, `nmbr_doors`, `sun_roof`, `transmission`, `fuel_type`, `drive_train`, `num_cylndrs`, `money`, `currency`, `insrd_till`, `techn_insp_val_till`, `client`, `full_name`, `ph_num`, `status`, `display`) VALUES
(61, '4q1/fufbIODGyqiZk/0zqw==', 'vUGUFcfbpRY39H5HwuKguQ==', 'sIOW76EBOSWT080jsUL+/A==', '5lEVB2Ti+AoA2kEyN2Mu7Q==', 'LP21ntkLOvl43tUAAduNqM3qDMLwp82EPKbY6gCiqLw=', 'pURtRYaPiV1UKhZGtiow6g==', 'dsVdoIbNOQaRBSMX5QRQgA==', '6uPSdWYOm1EW1Or3DEW0fw==', 'nKIt86BAmj7dhzLIbwa4ag==', 'BaYs0lrPYe1hbZ4buBEpJQ==', '27xqMSHSLT8x9m9CXUFPZQ==', 'sOZQDhLAhVfAyl14L7Wh9A==', '5oFF/gjmW/3mgN6dRlsvQQ==', 'RTXUzxjoqTaVjKyHsMIi+A==', 'PGXv+M6EpUZoBEv6dbHf6w==', '27xqMSHSLT8x9m9CXUFPZQ==', 'T/WbVDHZp1wfRZVrW411Dg==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'va0YVyJrxs4Leo0ppCr4aA==', 'va0YVyJrxs4Leo0ppCr4aA==', 'E1kbksh6lZmk9SPMIlKa4g==', '7H+/lIdstqcpa+usFGnfAA==', 'zYyMDiff2/YeWMttKaoNRg==', 'bFbirRaBnXkCJ9FoI72BPQ==', 1),
(62, 'OCClKt7u6s2sIVC8DzeR+w==', 'vUGUFcfbpRY39H5HwuKguQ==', 'lVmh8y+B7Ddr5MwiswMLBg==', 'KuXgHKvQR7R+WD36KAJJFg==', 'u0wBLi8r5twjczwnv1tooA==', 'Bw+1O8C1gL1Pvg/3SE7ZOQ==', 'YawdlnRt3ow+ZyAYqsftmg==', 'Eza6iiqVU3foQ+IReD4qBg==', '+hV+W1ga0IFm5vntvLsUXg==', 'tf38m2cEo4miaGpmSG8PCw==', 'tf38m2cEo4miaGpmSG8PCw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '5oFF/gjmW/3mgN6dRlsvQQ==', 'RTXUzxjoqTaVjKyHsMIi+A==', '8CfdC+JLyUALjIQ4B52uAg==', 'OA1hROVZynrYVvypOYOVgw==', '2t1COf0aKkVY0NEa/QC1nQ==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'va0YVyJrxs4Leo0ppCr4aA==', 'va0YVyJrxs4Leo0ppCr4aA==', 'E1kbksh6lZmk9SPMIlKa4g==', 'TZv6kbT8+HGs5z0UjYaqLQ==', 'bjeZ1KzlWhh0zHKjxD2aYg==', 'bFbirRaBnXkCJ9FoI72BPQ==', 1),
(63, 'dfvc/LKApQEoQhaTFIcNsA==', 'vUGUFcfbpRY39H5HwuKguQ==', 'TeKyB9haShJ4IHaSix9kow==', '6tP1ntMf1eTZNx4NjaBMXg==', '5hPqUgndcFfH6VnMmD2Jqw==', 'yxeHRJRC+vV2Zfqc56pckg==', 'dsVdoIbNOQaRBSMX5QRQgA==', 'Mi3q0hBviIvjxIsPNrFycw==', 'L0kbdiozPjsz86URkHwt1w==', 'tf38m2cEo4miaGpmSG8PCw==', 'tf38m2cEo4miaGpmSG8PCw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '5oFF/gjmW/3mgN6dRlsvQQ==', '0H8+ilRp6N3YacT8MNR0Bg==', 'V2gm6nnwWSCqBAPyhy+xHw==', 'OA1hROVZynrYVvypOYOVgw==', 'hq1C3E2TdXDyr5wUBmZE/g==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'E1kbksh6lZmk9SPMIlKa4g==', 'x2ssBylVNYaeAzUpuycMzU1FPVuovSu5SByEjWBeB4o=', 'l9aplgJlXZzoWhTHgIbHWA==', 'bFbirRaBnXkCJ9FoI72BPQ==', 0),
(64, '3grtoWpLZTjQJZ3pJ57sAQ==', 'vUGUFcfbpRY39H5HwuKguQ==', 'lbHCePor9HieVFXMc7ZgBg==', 'Fsouhb2IXnE5qw10G+TAig==', '4FSw1TLD5rg/8A9JgnGJxw==', '/X8lxfeTVykz7RxSSPzvdw==', 'dsVdoIbNOQaRBSMX5QRQgA==', '8uIvn7sDpX77V0KJMRv/gQ==', '+hV+W1ga0IFm5vntvLsUXg==', 'tf38m2cEo4miaGpmSG8PCw==', 'tf38m2cEo4miaGpmSG8PCw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '6jjaJHv9fB1KSHkLQ1ThJQ==', '0H8+ilRp6N3YacT8MNR0Bg==', 'PGXv+M6EpUZoBEv6dbHf6w==', 'OA1hROVZynrYVvypOYOVgw==', 'Yq+8uGCqv1JQKXt7EJnIyg==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'tv97j6eG7UyvjpuyOH4hAw==', 'lXkcWy7Fc7GOBpM/HnQbwQ==', 'yias+HTPaGXIeEVXy8Ej1A==', 'bFbirRaBnXkCJ9FoI72BPQ==', 1),
(65, 'YIxIOayvzaPWnwa+peKyyQ==', 'vUGUFcfbpRY39H5HwuKguQ==', 'Yas3GE3NCrABmSkP3Pl6iA==', '5lEVB2Ti+AoA2kEyN2Mu7Q==', '5hPqUgndcFfH6VnMmD2Jqw==', 'B2xHmd6tCagKKyzq9HG2mQ==', 'dsVdoIbNOQaRBSMX5QRQgA==', 'lMXmDN5aMu18qkMO63c3iA==', 'L0kbdiozPjsz86URkHwt1w==', 'tf38m2cEo4miaGpmSG8PCw==', 'tf38m2cEo4miaGpmSG8PCw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '5oFF/gjmW/3mgN6dRlsvQQ==', '0H8+ilRp6N3YacT8MNR0Bg==', '8CfdC+JLyUALjIQ4B52uAg==', 'OA1hROVZynrYVvypOYOVgw==', 'cLjBKhFZwvGHoOPdo71fPA==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'E1kbksh6lZmk9SPMIlKa4g==', '8Zzj8WirD1VfVNILW44c3w==', 'bgb0Xa4IRZw8NFId1TZ3Mr4GGSPEUfyCFpJSGuJknnA=', 'bFbirRaBnXkCJ9FoI72BPQ==', 1),
(66, 'vAxKdaz1WmMivRbbxwO1VA==', 'vUGUFcfbpRY39H5HwuKguQ==', 'OJ8XDvlGk37UMSDQVJ50NQ==', '5lEVB2Ti+AoA2kEyN2Mu7Q==', '9mDAnCRT8/6IW9x4DO7i6Q==', '3/m3lWzPieJOztQQ4KFbhg==', '15iQJOsZHa61BYl2crYbfA==', 'lMXmDN5aMu18qkMO63c3iA==', 'z2u+DxlesH1jz7wj7z4ULg==', 'BaYs0lrPYe1hbZ4buBEpJQ==', 'tf38m2cEo4miaGpmSG8PCw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '6jjaJHv9fB1KSHkLQ1ThJQ==', '0H8+ilRp6N3YacT8MNR0Bg==', '8CfdC+JLyUALjIQ4B52uAg==', 'OA1hROVZynrYVvypOYOVgw==', 'Hy/PGllxVg1iLXqBT7/Dew==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'E1kbksh6lZmk9SPMIlKa4g==', '2ma59EVNlwhymLN1QfbW1Q==', 'f+ssxr7o8lV3WJVSqPyJXQ==', 'bFbirRaBnXkCJ9FoI72BPQ==', 1),
(67, 'HrtIMPjyv/ZhzDi/3vvZuQ==', 'vUGUFcfbpRY39H5HwuKguQ==', 'ud3zVk63KK3X2ynTknO7TA==', '4jErSCUMmIrKmzEMdyn74Q==', '+SHt6a5PNqlLvk9cYDCe+w==', 'yxeHRJRC+vV2Zfqc56pckg==', 'dsVdoIbNOQaRBSMX5QRQgA==', 'c5O1Q8kgD0d5x7f4UmWnXA==', 'nKIt86BAmj7dhzLIbwa4ag==', 'BaYs0lrPYe1hbZ4buBEpJQ==', 'tf38m2cEo4miaGpmSG8PCw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '6jjaJHv9fB1KSHkLQ1ThJQ==', 'RTXUzxjoqTaVjKyHsMIi+A==', 'PGXv+M6EpUZoBEv6dbHf6w==', '27xqMSHSLT8x9m9CXUFPZQ==', 'T/WbVDHZp1wfRZVrW411Dg==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'E1kbksh6lZmk9SPMIlKa4g==', 'IgST2y66TfxO6s99onFPbyemgqect+c4icFuCdOIUUM=', 'TDZnqaqwc+aWMx1f641GxQ==', 'bFbirRaBnXkCJ9FoI72BPQ==', 1),
(68, 'U2uK83R/hYHYoPLcb9L5ng==', 'vUGUFcfbpRY39H5HwuKguQ==', '/97JIPN7dxOHmPc80MTKGQ==', '5lEVB2Ti+AoA2kEyN2Mu7Q==', 'LgggnvMZ9ivUvL8kezija46DTwiGxn+rDR8NfVXBkYc=', 'xw4WdVu04FKObxkMWdZXdw==', 'dsVdoIbNOQaRBSMX5QRQgA==', 'IpUFSng8fkj8ZleIaIR+pQ==', 'nKIt86BAmj7dhzLIbwa4ag==', 'BaYs0lrPYe1hbZ4buBEpJQ==', 'tf38m2cEo4miaGpmSG8PCw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '5oFF/gjmW/3mgN6dRlsvQQ==', 'RTXUzxjoqTaVjKyHsMIi+A==', 'PGXv+M6EpUZoBEv6dbHf6w==', '27xqMSHSLT8x9m9CXUFPZQ==', 'lcgyPaTlcCuaNt3wKUoghg==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'E1kbksh6lZmk9SPMIlKa4g==', '0mH7WmzOO2rSQRBrh9+MqQ==', '12rc5Ak8aFHFHZfl6RDHOA==', 'bFbirRaBnXkCJ9FoI72BPQ==', 1),
(69, '3ybGCC7PxtHzoJBUzGZFag==', 'vUGUFcfbpRY39H5HwuKguQ==', 'qeX4kDTsQcinVM79hJEFdg==', 'ojqc02EychyD4xgRXassdA==', 'u0wBLi8r5twjczwnv1tooA==', 'hU64ncLBVpUkaq/68VhUOQ==', 'YawdlnRt3ow+ZyAYqsftmg==', '/1ZdVajevcdQRPs6V9fJEg==', '+hV+W1ga0IFm5vntvLsUXg==', 'tf38m2cEo4miaGpmSG8PCw==', 'tf38m2cEo4miaGpmSG8PCw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '5oFF/gjmW/3mgN6dRlsvQQ==', 'RTXUzxjoqTaVjKyHsMIi+A==', 'PGXv+M6EpUZoBEv6dbHf6w==', 'OA1hROVZynrYVvypOYOVgw==', 'kD3dw5geJXcT9HgopPLcYQ==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'tv97j6eG7UyvjpuyOH4hAw==', 'XybCo0Itu5OLb4frG+SVWMpDozNhX+DUe0lq8IXgBE4=', 'Fl+rSTHfFh/6iZtPz23uiA==', 'bFbirRaBnXkCJ9FoI72BPQ==', 0),
(70, 'EJZwBfjZWPyDkAQ3wqO0Fg==', 'vUGUFcfbpRY39H5HwuKguQ==', 'BqxF+hIHsO+vgTzl60DiXA==', '5lEVB2Ti+AoA2kEyN2Mu7Q==', 'wBQKRncWf5OpEOtMp14GTg==', '/X8lxfeTVykz7RxSSPzvdw==', 'dsVdoIbNOQaRBSMX5QRQgA==', 'IpUFSng8fkj8ZleIaIR+pQ==', '+hV+W1ga0IFm5vntvLsUXg==', 'tf38m2cEo4miaGpmSG8PCw==', 'tf38m2cEo4miaGpmSG8PCw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '6jjaJHv9fB1KSHkLQ1ThJQ==', '0H8+ilRp6N3YacT8MNR0Bg==', 'PGXv+M6EpUZoBEv6dbHf6w==', 'iNIG08CzF9YyozxmAO/M3Df0doQczg4l2hRVBSnrNJg=', 'CXhl/bxQlV2MMSCZ52q2zw==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'Ij3HfcwUsRRYkA6U6uhPEw==', 'va0YVyJrxs4Leo0ppCr4aA==', 'tv97j6eG7UyvjpuyOH4hAw==', 'mKh6uZVUhc2qnADL1WqskQ==', 'bWB/lZxecvPxOlAan3rvJg==', 'bFbirRaBnXkCJ9FoI72BPQ==', 1),
(71, 'PKJ/P15glgZuk574ZsnbRw==', 'vUGUFcfbpRY39H5HwuKguQ==', 'm0St8jPuX894ldvqc05aHQ==', '5lEVB2Ti+AoA2kEyN2Mu7Q==', '5XpmUwSJsbRovY3zNHW2yQ==', 'xw4WdVu04FKObxkMWdZXdw==', 'dsVdoIbNOQaRBSMX5QRQgA==', 'IpUFSng8fkj8ZleIaIR+pQ==', '/X+oyvmzX/b789j9kx4omA==', 'tf38m2cEo4miaGpmSG8PCw==', 'OA1hROVZynrYVvypOYOVgw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '6jjaJHv9fB1KSHkLQ1ThJQ==', 'RTXUzxjoqTaVjKyHsMIi+A==', 'PGXv+M6EpUZoBEv6dbHf6w==', 'OA1hROVZynrYVvypOYOVgw==', 'MDhpqlFbuXkv5TS6C4ozoA==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'E1kbksh6lZmk9SPMIlKa4g==', 'nT8eYvyzYTP0fxa46e9bQhHnG+5om+aGJo42sMrj1Fc=', 'jAB/7z6ot/t7Hw+N6/jndg==', 'bFbirRaBnXkCJ9FoI72BPQ==', 1),
(72, 'JwtKVLK9l1U49A8Mgzibiw==', 'vUGUFcfbpRY39H5HwuKguQ==', '1BOfeLlS7nLloL+mVz5KYg==', '5lEVB2Ti+AoA2kEyN2Mu7Q==', 'zaheA88m8PqOWV9huc/Lzki1ZRxiD64rz/jeQqRT1EE=', 'Bw+1O8C1gL1Pvg/3SE7ZOQ==', 'dsVdoIbNOQaRBSMX5QRQgA==', 'IpUFSng8fkj8ZleIaIR+pQ==', 'nKIt86BAmj7dhzLIbwa4ag==', 'BaYs0lrPYe1hbZ4buBEpJQ==', '27xqMSHSLT8x9m9CXUFPZQ==', 'sOZQDhLAhVfAyl14L7Wh9A==', '5oFF/gjmW/3mgN6dRlsvQQ==', 'RTXUzxjoqTaVjKyHsMIi+A==', 'PGXv+M6EpUZoBEv6dbHf6w==', 'OA1hROVZynrYVvypOYOVgw==', '7CbXOWTUGwLM7KNVjpJ2pA==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'E1kbksh6lZmk9SPMIlKa4g==', 'h+SAiB3bUKTz0srR/A8ZLg==', 'kRHMExQa7AVabDl4PxTrYA==', 'bFbirRaBnXkCJ9FoI72BPQ==', 1),
(73, 'gpQJXBU6qHzCN+UQ/jG3Sg==', 'vUGUFcfbpRY39H5HwuKguQ==', 'Meb2VhiCieJiO3XQBz37Ig==', '4jErSCUMmIrKmzEMdyn74Q==', '+I6sXD8UYgAS7L/oOkJHMQ==', 'XcEMNjg04q2MSMTrVfDTVA==', 'dsVdoIbNOQaRBSMX5QRQgA==', '4SsOqKDs/qTkYjyZ9Q3DEQ==', 'nKIt86BAmj7dhzLIbwa4ag==', 'BaYs0lrPYe1hbZ4buBEpJQ==', 'tf38m2cEo4miaGpmSG8PCw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '5oFF/gjmW/3mgN6dRlsvQQ==', 'RTXUzxjoqTaVjKyHsMIi+A==', 'PGXv+M6EpUZoBEv6dbHf6w==', '27xqMSHSLT8x9m9CXUFPZQ==', 'iwJyiHxC/7yvIEFHJecoOA==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'E1kbksh6lZmk9SPMIlKa4g==', '0IqGAs43LFg8uhPqDVfgSQ==', 'bSnNLSjYC61FEUDXW3QJsw==', 'bFbirRaBnXkCJ9FoI72BPQ==', 1),
(74, 'WLaIx4tWO1/ob7L2LSEOZw==', 'vUGUFcfbpRY39H5HwuKguQ==', 'WV2c04kc9u0tAOHV+VOfqA==', 'nzhC/4hOjKLuyYb9rTpQTQ==', 'Vy3fQ/00snz8wuSpisqvmg==', '+INFNmOlpdaW5GL8kZzt3g==', 'vlssVZkIFRBw/QIpZXsgbtoSXTxmHFHDsMUWutFmKNM=', 'IpUFSng8fkj8ZleIaIR+pQ==', 'nKIt86BAmj7dhzLIbwa4ag==', 'BaYs0lrPYe1hbZ4buBEpJQ==', '27xqMSHSLT8x9m9CXUFPZQ==', 'sOZQDhLAhVfAyl14L7Wh9A==', '5oFF/gjmW/3mgN6dRlsvQQ==', '0H8+ilRp6N3YacT8MNR0Bg==', 'PGXv+M6EpUZoBEv6dbHf6w==', '27xqMSHSLT8x9m9CXUFPZQ==', 'FXRHbAh0kieBL7wyzruEMg==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'E1kbksh6lZmk9SPMIlKa4g==', 'bnmjRScNZDb0G+sbgmOathhPc7WHWJ0VAZ1o6KF1XNk=', '3NDBfg4ux7Mf9oJ/9Xh+Qg==', 'bFbirRaBnXkCJ9FoI72BPQ==', 1),
(75, 'O/ybYD3T9/KQoKy+0hr+lA==', 'vUGUFcfbpRY39H5HwuKguQ==', 'PDbBysjdeOhtanGxr6ROvA==', '5lEVB2Ti+AoA2kEyN2Mu7Q==', 'A7ItTwga9TM2+F4CUEKE4w==', 'XcEMNjg04q2MSMTrVfDTVA==', '9Y8F0o44UeC8wVBaiFwcuLoO1kq/i0MPVGgHVfPhh8g=', 'BKs6oYaLqgRWcvXwWWqKgQ==', '+hV+W1ga0IFm5vntvLsUXg==', 'tf38m2cEo4miaGpmSG8PCw==', 'tf38m2cEo4miaGpmSG8PCw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '5oFF/gjmW/3mgN6dRlsvQQ==', '0H8+ilRp6N3YacT8MNR0Bg==', 'PGXv+M6EpUZoBEv6dbHf6w==', 'OA1hROVZynrYVvypOYOVgw==', 'nD8H3byH1n1Z4o80aOicgw==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'u8dyL65A58aNmdRb6UnJXQ==', 'E1kbksh6lZmk9SPMIlKa4g==', 'tH0j2agwz6Z2Lvwk0wreKg==', 'LNqTWKTVIWtnZO5anBTm6w==', 'bFbirRaBnXkCJ9FoI72BPQ==', 0),
(76, 'y41SF4MlOR55W1ws13nzXw==', 'vUGUFcfbpRY39H5HwuKguQ==', 'uLR44pV2O+0PElrQUe1RVQ==', '6tP1ntMf1eTZNx4NjaBMXg==', 'QnluhNqQlgdPUX6OCXfzyQ==', 'RdepGoO+9acrqu0WjHUEqw==', 'dsVdoIbNOQaRBSMX5QRQgA==', 'IpUFSng8fkj8ZleIaIR+pQ==', 'nKIt86BAmj7dhzLIbwa4ag==', 'BaYs0lrPYe1hbZ4buBEpJQ==', 'tf38m2cEo4miaGpmSG8PCw==', 'sOZQDhLAhVfAyl14L7Wh9A==', '5oFF/gjmW/3mgN6dRlsvQQ==', '0H8+ilRp6N3YacT8MNR0Bg==', 'PGXv+M6EpUZoBEv6dbHf6w==', 'OA1hROVZynrYVvypOYOVgw==', 'MDhpqlFbuXkv5TS6C4ozoA==', 'w1TGidZI0ZWlT0JopbPfFQ==', 'Pt3FOHFzdXhDkcL6KFbV8A==', 'OvHDi5b/3TC/P6ItjB+Lyg==', 'E1kbksh6lZmk9SPMIlKa4g==', '0yO6q7MvmnkNg9otyhtiZw==', 'wdQzMxrNMZz7l/s6MXWROQ==', 'bFbirRaBnXkCJ9FoI72BPQ==', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cars_imgs`
--

CREATE TABLE `cars_imgs` (
  `id` int(100) NOT NULL,
  `prod_id` varchar(200) NOT NULL,
  `prod_ref_no` varchar(200) NOT NULL,
  `imgs` text NOT NULL,
  `img_status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars_imgs`
--

INSERT INTO `cars_imgs` (`id`, `prod_id`, `prod_ref_no`, `imgs`, `img_status`) VALUES
(155, '4q1/fufbIODGyqiZk/0zqw==', 'HGOBfgJ3Cy+BMEqM2F/XcQ==', 'xrKXFMuK9mDj2zflLvjeUF3dWGrzjS8swpXytsPwQ1Y=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(156, '4q1/fufbIODGyqiZk/0zqw==', 'HGOBfgJ3Cy+BMEqM2F/XcQ==', 'xrKXFMuK9mDj2zflLvjeUBfGgiBtQVgPR+HKn3xEfhA=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(157, '4q1/fufbIODGyqiZk/0zqw==', 'HGOBfgJ3Cy+BMEqM2F/XcQ==', 'xrKXFMuK9mDj2zflLvjeUDGeNhMAwtBXUvZGeiHWEG4=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(158, '4q1/fufbIODGyqiZk/0zqw==', 'HGOBfgJ3Cy+BMEqM2F/XcQ==', 'xrKXFMuK9mDj2zflLvjeUD47j2tQ/NoTUe4oCs6NgyE=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(159, '4q1/fufbIODGyqiZk/0zqw==', 'HGOBfgJ3Cy+BMEqM2F/XcQ==', 'xrKXFMuK9mDj2zflLvjeUF23Ijel/rCR0KVSyiiLD/U=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(160, 'OCClKt7u6s2sIVC8DzeR+w==', '2fijzS6Rq+4crksiDvpieA==', 'SFiYY7OF5ou5WPuz2h3xhVwF9vmydy0dOkebiTpGXnU=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(161, 'OCClKt7u6s2sIVC8DzeR+w==', '2fijzS6Rq+4crksiDvpieA==', 's+IFIfVJU4vOBtNivaL/t8o2sn9AdE2LkvZ8tuW4nJQ=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(162, 'dfvc/LKApQEoQhaTFIcNsA==', 'r4kfpNpc8LLW6BLKhiKtBA==', 'HWYYQ3VHOTppCl4TpmxkzV1ZyV4aAdtP8GUeaT6lVkU=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(163, 'dfvc/LKApQEoQhaTFIcNsA==', 'r4kfpNpc8LLW6BLKhiKtBA==', 'HWYYQ3VHOTppCl4Tpmxkzd5Usnu34Hdh2BGliDtisBk=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(164, 'dfvc/LKApQEoQhaTFIcNsA==', 'r4kfpNpc8LLW6BLKhiKtBA==', 'HWYYQ3VHOTppCl4TpmxkzauvhjIekez3pM7MZrIW0xw=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(165, 'dfvc/LKApQEoQhaTFIcNsA==', 'r4kfpNpc8LLW6BLKhiKtBA==', 'HWYYQ3VHOTppCl4TpmxkzbrPOUqznpAYtgew3VaNNdU=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(166, 'dfvc/LKApQEoQhaTFIcNsA==', 'r4kfpNpc8LLW6BLKhiKtBA==', 'HWYYQ3VHOTppCl4TpmxkzURU8mYd8ijJ2mHeAZJTDE0=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(167, 'dfvc/LKApQEoQhaTFIcNsA==', 'r4kfpNpc8LLW6BLKhiKtBA==', 'HWYYQ3VHOTppCl4TpmxkzWK3ZxVHk3kxNzr1UgrNTqw=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(168, 'dfvc/LKApQEoQhaTFIcNsA==', 'r4kfpNpc8LLW6BLKhiKtBA==', 'HWYYQ3VHOTppCl4TpmxkzYzv8CiUrl8dWxhkirdk9VA=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(169, 'dfvc/LKApQEoQhaTFIcNsA==', 'r4kfpNpc8LLW6BLKhiKtBA==', 'HWYYQ3VHOTppCl4TpmxkzXrbs287EC2o1C8rpI4GiVI=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(170, '3grtoWpLZTjQJZ3pJ57sAQ==', 'jcfPDIxBgLDcRUE0DqxKfg==', '4ByY3gGZDdT6EdK0lAiRlLuYEiVFB1FSBIWsAAsAqJI=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(171, '3grtoWpLZTjQJZ3pJ57sAQ==', 'jcfPDIxBgLDcRUE0DqxKfg==', '4ByY3gGZDdT6EdK0lAiRlHJlBQ+gy+dlckn5DbfB8lE=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(172, '3grtoWpLZTjQJZ3pJ57sAQ==', 'jcfPDIxBgLDcRUE0DqxKfg==', '4ByY3gGZDdT6EdK0lAiRlGHBP7gIIEYH7mFe1i/Hqxs=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(173, '3grtoWpLZTjQJZ3pJ57sAQ==', 'jcfPDIxBgLDcRUE0DqxKfg==', '4ByY3gGZDdT6EdK0lAiRlDezbGmS8Zxxqh2NRyiCLmI=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(174, '3grtoWpLZTjQJZ3pJ57sAQ==', 'jcfPDIxBgLDcRUE0DqxKfg==', '4ByY3gGZDdT6EdK0lAiRlKhgrq4zmQ0s8MbeEQgHwP4=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(175, '3grtoWpLZTjQJZ3pJ57sAQ==', 'jcfPDIxBgLDcRUE0DqxKfg==', '4ByY3gGZDdT6EdK0lAiRlJF+pS4g8rdNG7hXe+s55H4=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(176, '3grtoWpLZTjQJZ3pJ57sAQ==', 'jcfPDIxBgLDcRUE0DqxKfg==', '4ByY3gGZDdT6EdK0lAiRlCQxFZzS9oJvIQ0wx7OXNfA=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(177, 'YIxIOayvzaPWnwa+peKyyQ==', '0oX2/mdT6jaXe9qZVaYv9Q==', 'on5N7IIb2uWBCCgZ74uDVrlIqB86XR3/2h4pdXckP2w=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(178, 'YIxIOayvzaPWnwa+peKyyQ==', '0oX2/mdT6jaXe9qZVaYv9Q==', 'MqlNsLxiehFfqJCDKr5pCliq6jbAfcD4A6Ys/X/gMMI=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(179, 'YIxIOayvzaPWnwa+peKyyQ==', '0oX2/mdT6jaXe9qZVaYv9Q==', 'rg3tKebKs96qqCqRGUBRnpI7cejZKFkvT7h23fmxq1Y=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(180, 'YIxIOayvzaPWnwa+peKyyQ==', '0oX2/mdT6jaXe9qZVaYv9Q==', 'UJY2tONWsmQ6s6y0D5lpmajaQGYKMsiY/V6AWdW+Tm4=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(181, 'YIxIOayvzaPWnwa+peKyyQ==', '0oX2/mdT6jaXe9qZVaYv9Q==', '6mV5hNGQq44u7viUx7Jn1vq//Mhkq212/CFaLrET7MA=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(182, 'YIxIOayvzaPWnwa+peKyyQ==', '0oX2/mdT6jaXe9qZVaYv9Q==', 'jDEanFDGG8mDd3dYRpj2hXYOwrFvdzMKnHogQtz0bTI=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(183, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'jpic6FMC5x0OZVhikuchiMSWJRhKcw2MJkfLxo7hNVI=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(184, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'J25kSfid0X25eNJrxr5l94YU0bVGQIZJ+hQStMSKeVg=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(185, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'EB/vcQ6PzWMlwaXpuDMbtM7yLzUcraqFDe3ae1X54KU=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(186, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', '52WjUnsBYj8IKHT/RbhsWQipFkTYjWgZWWbYNB2XpNU=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(187, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', '7VfbpXg44nUMpPdZ/db/W5V+/4ZQqssMi81owsuhZIE=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(188, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'xwZbUfa8d3LokeQUSBlO2Yc2Pbbb3KXfa4sWU/5xk6I=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(189, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'xXzIAekgc16WXAxjON6e+WBp0ZIcqv+OIjWY1HIpqrs=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(190, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'eLUvO5Nn1uE2iRQwW16lvZXJNYCXvkUsVpkSJ0T3L9w=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(191, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'Ivwucdt1sE3R+bQUtfJ3UltRl3cSKySn96OqROGDaCw=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(192, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'k2B2rn4BO/EkJSHNuy1LGrG9uIxXgoUtMYaYvy23BOs=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(193, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', '9PpDpr4RQlsUIpy7/odGuLlqkbojMGUXe9nXfOb1e04=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(194, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'QP3/uWGhH1vjk9hOB3Xm+wbQKISrts9XmNDh9zQgDxs=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(195, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'JzQSuK6X57MUHJWr6NJuetUJShHuPNlbWjvgfBNbKCU=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(196, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'IqkFLtQQ4s8+Xc49AHoM3iRpxqhxSJiz9hQnC0x/vIg=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(197, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'fFWZqhnAhDjMtHXwhfbBLsO6E2HYDbaO3aOJFD4kGk0=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(198, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'Jf7GWwXfHWIE0WhIAFeXBJCYSSZK8pgooZkkETGAJ8k=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(199, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', '32OWiZqSmmQzURO/2mW5xeQ/EKR8hhrAhjkCwx/EvA8=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(200, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'hxDTHaz1OzndmjZb9l8snyKYOs9HwJ+yBYY3Qt1r6Jg=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(201, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'sCG8LoesxvAsAaybNQSIrfcxBqHO9W93+YiR5E1XtVs=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(202, 'vAxKdaz1WmMivRbbxwO1VA==', 'Q6+YYup2PHxjTGXx6nzVCw==', 'xY0oWU9UOiZFlmgsCNfW696pwlpq2Y8Dnr8+i50DNXQ=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(203, 'HrtIMPjyv/ZhzDi/3vvZuQ==', 'QVVmpGJYf+bJwdTR0qTP/Q==', 'jkbVunfS9a2rN5g8/NjelznxHwFpHhj8OVThTR+qeCM=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(204, 'HrtIMPjyv/ZhzDi/3vvZuQ==', 'QVVmpGJYf+bJwdTR0qTP/Q==', 'jkbVunfS9a2rN5g8/Njel0R1XKdrVeKnRZZ79X16rsE=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(205, 'HrtIMPjyv/ZhzDi/3vvZuQ==', 'QVVmpGJYf+bJwdTR0qTP/Q==', 'jkbVunfS9a2rN5g8/Njel658MpKyTkMVv+3eYW9D4aI=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(206, 'HrtIMPjyv/ZhzDi/3vvZuQ==', 'QVVmpGJYf+bJwdTR0qTP/Q==', 'jkbVunfS9a2rN5g8/NjelxsQAOt5wioBUv2iVCvwuV8=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(207, 'U2uK83R/hYHYoPLcb9L5ng==', '6FEoNffh8Mb18AUGcACngg==', 'xrKXFMuK9mDj2zflLvjeUE7G1vWa3kWOJ0uy1z3dqlU=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(208, 'U2uK83R/hYHYoPLcb9L5ng==', '6FEoNffh8Mb18AUGcACngg==', 'xrKXFMuK9mDj2zflLvjeUDv574hiwFkDSERHbkUqXfI=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(209, 'U2uK83R/hYHYoPLcb9L5ng==', '6FEoNffh8Mb18AUGcACngg==', 'xrKXFMuK9mDj2zflLvjeUNCauxQmQLSFh0dul9Kcez8=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(210, 'U2uK83R/hYHYoPLcb9L5ng==', '6FEoNffh8Mb18AUGcACngg==', 'xrKXFMuK9mDj2zflLvjeUBoGWIbCm3OHhDmvgNY9M/o=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(211, '3ybGCC7PxtHzoJBUzGZFag==', 'mwBJXwxBJvIqQs/Hc7Sqzg==', 'xrKXFMuK9mDj2zflLvjeUEVdKwKyF1LDHFPLxXkYvsg=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(212, '3ybGCC7PxtHzoJBUzGZFag==', 'mwBJXwxBJvIqQs/Hc7Sqzg==', 'xrKXFMuK9mDj2zflLvjeULD7azkq85GZa9D5gQMtUjk=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(213, '3ybGCC7PxtHzoJBUzGZFag==', 'mwBJXwxBJvIqQs/Hc7Sqzg==', 'xrKXFMuK9mDj2zflLvjeUMO125mE606FZ4M755vIK8Q=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(214, '3ybGCC7PxtHzoJBUzGZFag==', 'mwBJXwxBJvIqQs/Hc7Sqzg==', 'xrKXFMuK9mDj2zflLvjeUGiH9dxNgXRK0CfV0DuTRNg=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(215, '3ybGCC7PxtHzoJBUzGZFag==', 'mwBJXwxBJvIqQs/Hc7Sqzg==', 'xrKXFMuK9mDj2zflLvjeUJQ6qQ0OTq3uEvjVCMoL8yE=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(216, 'EJZwBfjZWPyDkAQ3wqO0Fg==', 'j/H1vTH7qWa+y6h6ahHcuA==', 'i/nFP9jeV6PmeCQTW470nKHqvushjQJL32+CkOLCpCg=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(217, 'EJZwBfjZWPyDkAQ3wqO0Fg==', 'j/H1vTH7qWa+y6h6ahHcuA==', 'i/nFP9jeV6PmeCQTW470nEXzR6vrq8KBre1B0rbn0nU=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(218, 'EJZwBfjZWPyDkAQ3wqO0Fg==', 'j/H1vTH7qWa+y6h6ahHcuA==', 'i/nFP9jeV6PmeCQTW470nLpXZEg9FMI3z5dntRZTPSo=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(219, 'EJZwBfjZWPyDkAQ3wqO0Fg==', 'j/H1vTH7qWa+y6h6ahHcuA==', 'i/nFP9jeV6PmeCQTW470nIUKPwPTcxnOMauksPzLNLE=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(220, 'EJZwBfjZWPyDkAQ3wqO0Fg==', 'j/H1vTH7qWa+y6h6ahHcuA==', 'i/nFP9jeV6PmeCQTW470nGi8VleoKFvfRaa05sBZwok=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(221, 'EJZwBfjZWPyDkAQ3wqO0Fg==', 'j/H1vTH7qWa+y6h6ahHcuA==', 'i/nFP9jeV6PmeCQTW470nLfPDjklc6uNszd+KkbWQR4=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(222, 'EJZwBfjZWPyDkAQ3wqO0Fg==', 'j/H1vTH7qWa+y6h6ahHcuA==', 'i/nFP9jeV6PmeCQTW470nE7pZhNGupAurPKaWOGfxzU=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(223, 'PKJ/P15glgZuk574ZsnbRw==', 'MOUI4W6S47ug0nGH1qx8tQ==', 'k1bnxo0Xg/ozGkTwV6qxK/IfSm/IFAVM7/1gqusP8To=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(224, 'PKJ/P15glgZuk574ZsnbRw==', 'MOUI4W6S47ug0nGH1qx8tQ==', '5L/HEtbzBaf2FK1PoQV1MmvQYLqh3pfRiZlC2Dqgmc0=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(225, 'PKJ/P15glgZuk574ZsnbRw==', 'MOUI4W6S47ug0nGH1qx8tQ==', 'G1UMbhw3JXtnsNS9cN3RpumDhiRNzyIewOZgt7xtAZE=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(226, 'PKJ/P15glgZuk574ZsnbRw==', 'MOUI4W6S47ug0nGH1qx8tQ==', 'h2wtt1er4FdDyxaYwz/d7vO4jwTFCBTbR7TUHns2nJE=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(227, 'JwtKVLK9l1U49A8Mgzibiw==', 'EpRNM9PT3GkuPxwgve3Jpw==', 'HWYYQ3VHOTppCl4TpmxkzUP8226mChvVnerqLtLjbig=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(228, 'JwtKVLK9l1U49A8Mgzibiw==', 'EpRNM9PT3GkuPxwgve3Jpw==', 'HWYYQ3VHOTppCl4TpmxkzTMMYNnYKxtxQzCffzxkX+A=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(229, 'JwtKVLK9l1U49A8Mgzibiw==', 'EpRNM9PT3GkuPxwgve3Jpw==', 'HWYYQ3VHOTppCl4Tpmxkzb8IUej3bV6+n+GLwcEvZhY=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(230, 'JwtKVLK9l1U49A8Mgzibiw==', 'EpRNM9PT3GkuPxwgve3Jpw==', 'HWYYQ3VHOTppCl4TpmxkzUEfJNPf6XhSSlcCAzbI2P8=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(231, 'JwtKVLK9l1U49A8Mgzibiw==', 'EpRNM9PT3GkuPxwgve3Jpw==', 'HWYYQ3VHOTppCl4TpmxkzQ+ys1S1gvLFIPKcNd0ft8s=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(232, 'JwtKVLK9l1U49A8Mgzibiw==', 'EpRNM9PT3GkuPxwgve3Jpw==', 'HWYYQ3VHOTppCl4TpmxkzRUv0dpmz7K4cHf3jGzTR0E=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(233, 'JwtKVLK9l1U49A8Mgzibiw==', 'EpRNM9PT3GkuPxwgve3Jpw==', 'HWYYQ3VHOTppCl4TpmxkzR/PU2SdGa497POtRg3bqhs=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(234, 'gpQJXBU6qHzCN+UQ/jG3Sg==', '7JDsxOgu/HyZNTJ54Sl+LQ==', 'jkbVunfS9a2rN5g8/NjelxAMG0pJa1S3DPw7t/A3fBI=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(235, 'gpQJXBU6qHzCN+UQ/jG3Sg==', '7JDsxOgu/HyZNTJ54Sl+LQ==', 'jkbVunfS9a2rN5g8/Njel5IIlAFzpqmCWNKCs2uyfyw=', '++JXBV6j03zz0kkX518UMQ=='),
(236, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsTB7HnzRmCkdtX2TpdrVd0U=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(237, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsQpzjPWnuYfaLPLtBnBrNVE=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(238, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsedn0Sr8RjGbV0y/yjszEiA=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(239, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsW80Q681q8Yq14h7UnVSEno=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(240, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsdu5ntiSJREVxYiOk7rnDQI=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(241, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsbM0Ci5U+eNLwHwOctykDv0=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(242, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsXGpjn5YOh2xdijZ7p6GDKM=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(243, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsa+XZ+qIzmnhO1RUceb/544=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(244, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIseHXsLmO5If5g90QwhhV174=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(245, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsQZQrbcmYoc9jkSn8/Y4BvU=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(246, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsT4QGAlu3QFqGz5a2Kao+aI=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(247, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsemfReTNARbwQol9iZuNJl4=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(248, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsaXGZG72pwPXXuctHGrma9Y=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(249, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIseHWrq71yvphykyieb97YW4=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(250, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsZ71Xi/9e8HHxjY0+0ESdE4=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(251, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsdlm8vpfrX/ddaREQFgn4wM=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(252, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsWlWCrQpDTWThtaYuR0bd+s=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(253, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsRjeuWLQyStFS5M/5YHqLqc=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(254, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsb/fbJn/DCNOfKGk1da2CD0=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(255, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsbmathr2BnVSNwFvXgKuBQI=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(256, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsVMkBUnTtaLB8kb167NV3D0=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(257, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIse15Bp5KHD3Gf7X07b5ungI=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(258, 'WLaIx4tWO1/ob7L2LSEOZw==', 'tqmybwdxP7KTaEwqPQ6XGA==', '9yG0RWsorSdzpIQCDnaIsSRjuCIpBcEhg+d2gE32LfI=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(259, 'O/ybYD3T9/KQoKy+0hr+lA==', 'xIcFahpdEWqSmozBuu7b8g==', 'xP9y6wHT3r6wY8ZWrCVFFFpFcJGhohDmPx9nna0DsPw=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(260, 'O/ybYD3T9/KQoKy+0hr+lA==', 'xIcFahpdEWqSmozBuu7b8g==', 'eLiJYu1SuDkpkCLqXiWZ16B5v4L7HKPS5ZJuGAOq5uA=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(261, 'O/ybYD3T9/KQoKy+0hr+lA==', 'xIcFahpdEWqSmozBuu7b8g==', '/YJH0GmBbVVQC2BFckyyPdC9V+eR7XUWc6X0XTaKjb4=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(262, 'O/ybYD3T9/KQoKy+0hr+lA==', 'xIcFahpdEWqSmozBuu7b8g==', 'uJ2kIgUesSZ507zaOs9mkwbAB6u14Whs+R9d4lWlpOs=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(263, 'O/ybYD3T9/KQoKy+0hr+lA==', 'xIcFahpdEWqSmozBuu7b8g==', 'MdtjsCijt/ovrjPH6k69PjMcLaew7tqSI72+QOUixyQ=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(264, 'O/ybYD3T9/KQoKy+0hr+lA==', 'xIcFahpdEWqSmozBuu7b8g==', 'shSf8TvBmKpWer9iNDxHzKfEskPJ+HUgDZtSQpOSRek=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(265, 'O/ybYD3T9/KQoKy+0hr+lA==', 'xIcFahpdEWqSmozBuu7b8g==', 'OdIPCe0fYq55CvVw4bJQLz6VHkYgBfd1Y0/XklBaF8g=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(266, 'gpQJXBU6qHzCN+UQ/jG3Sg==', '7JDsxOgu/HyZNTJ54Sl+LQ==', 'jkbVunfS9a2rN5g8/Njel5IIlAFzpqmCWNKCs2uyfyw=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(267, 'y41SF4MlOR55W1ws13nzXw==', 'eLjNO0iYTN+q46Y2bWuRow==', 'yFXxbO+j+WmLxzi0KNKKgqNzm7Ixxs1WR3QoFqh/6/A=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(268, 'y41SF4MlOR55W1ws13nzXw==', 'eLjNO0iYTN+q46Y2bWuRow==', 'yFXxbO+j+WmLxzi0KNKKgkxm4Kmxraxqr6oHtWzd8DQ=', 'uhJ7ypx78lBHE+un/4xqRw=='),
(269, 'y41SF4MlOR55W1ws13nzXw==', 'eLjNO0iYTN+q46Y2bWuRow==', 'yFXxbO+j+WmLxzi0KNKKgstZnk9lmu5824VRzi4sqA8=', '0hrfTgYX6Ig9E9XYkW1OHg=='),
(270, 'y41SF4MlOR55W1ws13nzXw==', 'eLjNO0iYTN+q46Y2bWuRow==', 'yFXxbO+j+WmLxzi0KNKKgtbA9vQOW/gireM0zpflESg=', '0hrfTgYX6Ig9E9XYkW1OHg==');

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` int(10) NOT NULL,
  `names` varchar(200) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `your_car` text NOT NULL,
  `seek_car` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`id`, `names`, `tel`, `your_car`, `seek_car`, `created_at`) VALUES
(2, 'vIiVlj0Vadkd2YBSah3HGhlQ37mrjvEPMA8DmeDGwHw=', '2ZQzjfgj/dFRDoL808LKlg==', '0NMWM0ui/MASalVx03tKVJQFwT3qfw5JNPZ+b/Q2OGQ=', 'YRw+pyxL5wmA0vhn25OBZ2L/WC0Bdu9KMohudpdKYrs=', '2025-01-11 11:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `failed_logs`
--

CREATE TABLE `failed_logs` (
  `id` int(100) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `ip_addr` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `failed_logs`
--

INSERT INTO `failed_logs` (`id`, `username`, `password`, `ip_addr`, `status`, `created_at`) VALUES
(1, 'nnKtP8H1ivJFeiDGBaC6EQ==', 'oBUKHB7gFXJ402eOTGqmBQ==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-10-28 15:39:44'),
(2, 'cp/OSHfA7QlbFmvpyDMjX3JDeBo9Se+WOwrcQ4YTqC8=', 'uv7ItIqNh4+MTNl9F2uoYg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-10-28 15:40:36'),
(3, 'nnKtP8H1ivJFeiDGBaC6EQ==', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-02 08:45:34'),
(4, 'nnKtP8H1ivJFeiDGBaC6EQ==', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-02 08:47:12'),
(5, 'nnKtP8H1ivJFeiDGBaC6EQ==', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-02 08:49:34'),
(6, 'nnKtP8H1ivJFeiDGBaC6EQ==', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-02 08:51:44'),
(7, 'nnKtP8H1ivJFeiDGBaC6EQ==', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-02 08:58:48'),
(8, 'nnKtP8H1ivJFeiDGBaC6EQ==', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-02 09:00:14'),
(9, 'nnKtP8H1ivJFeiDGBaC6EQ==', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-02 09:00:25'),
(10, 'nnKtP8H1ivJFeiDGBaC6EQ==', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-02 09:00:56'),
(11, 'sPzZa8Rfv01XUR7UG7JqEdFuBQwsM56WflZA9s2qlAI=', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-03 10:25:39'),
(12, '8s1XhFdJIKcUGpJeNeVDYH6vKjReJnja75CTEYfMyD0=', 'Bx99eb93jUn/3t1X74KE7Q==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-06 12:30:46'),
(13, 'nnKtP8H1ivJFeiDGBaC6EQ==', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-13 09:43:50'),
(14, 'cp/OSHfA7QlbFmvpyDMjX3JDeBo9Se+WOwrcQ4YTqC8=', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-14 09:12:29'),
(15, 'cp/OSHfA7QlbFmvpyDMjX3JDeBo9Se+WOwrcQ4YTqC8=', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-14 09:30:41'),
(16, 'OKxayd0J1ybpsMwQFE1cdQ==', 'V/Wy0c5WpTwmpp1j1meTDQ==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-22 19:21:57'),
(17, 'cp/OSHfA7QlbFmvpyDMjX3JDeBo9Se+WOwrcQ4YTqC8=', '75D2Z/Huk2vcCIE6fTkq/g==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2024-11-26 07:12:03'),
(18, 'zY8GB3BS+BpHb6B7ztH2Gg==', 'Bx99eb93jUn/3t1X74KE7Q==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-10 14:39:42'),
(19, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 10:49:31'),
(20, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 10:51:01'),
(21, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 11:00:40'),
(22, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 11:00:50'),
(23, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 11:01:14'),
(24, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 11:02:18'),
(25, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 11:03:25'),
(26, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 11:04:00'),
(27, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 11:04:31'),
(28, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 11:20:36'),
(29, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 11:31:42'),
(30, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 11:50:08'),
(31, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 12:23:19'),
(32, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-13 13:45:32'),
(33, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-14 08:41:22'),
(34, 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-14 10:54:49'),
(35, 'SQHzglXrV5eC/mtfYEpvog==', 'OWV9z97Y4djJWDMhLX8NfA==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-21 13:39:52'),
(36, 'SQHzglXrV5eC/mtfYEpvog==', 'Bx99eb93jUn/3t1X74KE7Q==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-21 13:40:13'),
(37, 'SQHzglXrV5eC/mtfYEpvog==', 'OWV9z97Y4djJWDMhLX8NfA==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-24 10:38:10'),
(38, 'SQHzglXrV5eC/mtfYEpvog==', 'Bx99eb93jUn/3t1X74KE7Q==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-24 10:38:23'),
(39, 'HIaMvhWlmidnjkDS5APD/yLfOGL3VIay8+vzYRns7Eo=', 'IGrOyBfA0DYF2EslDMLa6Q==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-25 08:00:00'),
(40, 'FhC9ar6cd5zaQEe4UfD9dA==', 'NVsIlgAFCPDjT9y4gnB6ww==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-25 08:04:18'),
(41, 'FhC9ar6cd5zaQEe4UfD9dA==', 'NVsIlgAFCPDjT9y4gnB6ww==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-25 08:04:18'),
(42, 'HIaMvhWlmidnjkDS5APD/yLfOGL3VIay8+vzYRns7Eo=', 'IGrOyBfA0DYF2EslDMLa6Q==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-25 08:16:51'),
(43, 'FhC9ar6cd5zaQEe4UfD9dA==', 'NVsIlgAFCPDjT9y4gnB6ww==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-28 08:30:06'),
(44, 'FhC9ar6cd5zaQEe4UfD9dA==', 'NVsIlgAFCPDjT9y4gnB6ww==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-28 08:30:07'),
(45, 'FhC9ar6cd5zaQEe4UfD9dA==', 'NVsIlgAFCPDjT9y4gnB6ww==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-28 10:31:54'),
(46, 'FhC9ar6cd5zaQEe4UfD9dA==', 'NVsIlgAFCPDjT9y4gnB6ww==', '2xstLUI4Ytch750eMWqU1g==', 'uM5KKwoImBrGUTbSsV8S+w==', '2025-01-28 10:31:54');

-- --------------------------------------------------------

--
-- Table structure for table `seek_cars`
--

CREATE TABLE `seek_cars` (
  `id` int(10) NOT NULL,
  `make` varchar(200) NOT NULL,
  `model` varchar(200) NOT NULL,
  `yr_mnfct` varchar(100) NOT NULL,
  `transmission` varchar(100) NOT NULL,
  `fuel` varchar(100) NOT NULL,
  `engine` varchar(100) NOT NULL,
  `seats` varchar(100) NOT NULL,
  `doors` varchar(100) NOT NULL,
  `sunroof` varchar(100) NOT NULL,
  `avg_milage` varchar(200) NOT NULL,
  `budget` varchar(200) NOT NULL,
  `names` varchar(300) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seek_cars`
--

INSERT INTO `seek_cars` (`id`, `make`, `model`, `yr_mnfct`, `transmission`, `fuel`, `engine`, `seats`, `doors`, `sunroof`, `avg_milage`, `budget`, `names`, `phone`, `created_at`) VALUES
(2, 'lsUf8RJKEPZnaJIMc6DkVg==', 'A7ItTwga9TM2+F4CUEKE4w==', 'U0jvlvdec8C7bro78QuYmA==', '6jjaJHv9fB1KSHkLQ1ThJQ==', '0H8+ilRp6N3YacT8MNR0Bg==', 'k4kevnhMXHQ86wRm5T1fbg==', 'tf38m2cEo4miaGpmSG8PCw==', 'OA1hROVZynrYVvypOYOVgw==', 'sOZQDhLAhVfAyl14L7Wh9A==', 'cd1JnSn6cMLhgY9vssGIRg==', '+CVAN1XaorSX6Vhk7SsjlA==', 'hRWa+HX5FTRAUf2k8HborvyaKwDPLW80LggMADzUIJw=', 'G/R9oaEESpJGvxqiRchbFQ==', '2025-01-20 08:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `session_id` varchar(300) NOT NULL,
  `lang` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session_logs`
--

CREATE TABLE `session_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_logs`
--

INSERT INTO `session_logs` (`log_id`, `user_id`, `session_id`, `ip_address`, `login_time`) VALUES
(38, 15, 'Kp1/kteoXEnuvd99ZRaGAalDee3774vC9URu7yTmnz7+5kGnC31dRjgpgr4aRAhL', '2xstLUI4Ytch750eMWqU1g==', '2025-01-13 10:49:32'),
(40, 15, 'hqVbMNSnw/NtP9pgl5YkGJnVKd7e3k7zaIrBuw9ZJ9/JDySYu8vthvo4UZhBLjDG', '2xstLUI4Ytch750eMWqU1g==', '2025-01-13 10:51:01'),
(41, 15, 'XIwFDA5chVe8L8k6Z80DzKwPrC2PVdKwXWnNRDn/TcBQ4VPrU/+GrAZu/2cktj6P', '2xstLUI4Ytch750eMWqU1g==', '2025-01-13 11:04:31'),
(42, 15, 'QKu6e06HRCQlyln2KswC4KhqZba2MDpVk0tm9lyYmQL1r9XD5BqvxRoB02qZ62vy', '2xstLUI4Ytch750eMWqU1g==', '2025-01-13 11:20:36'),
(43, 15, 'wlUvp5+PQTEswgGHzCXL1ra0dBw7v+/oUMW4XH+gi+RO1qywUvhH5lvcE/0JuXOs', '2xstLUI4Ytch750eMWqU1g==', '2025-01-13 11:31:42'),
(44, 15, 'nNFnaQUvp8f9ocaqKVAFZlZ4Tug+eQumX7LBVUpudcbnPlYXIgWmMN+5eh3AftVj', '2xstLUI4Ytch750eMWqU1g==', '2025-01-13 11:50:08'),
(45, 15, '9ajdEm/1StYsCkSSvh4UuyjfmGTlQl2nUcA8cSGw4BYQnSxz1Nem3esEmZBbRcbY', '2xstLUI4Ytch750eMWqU1g==', '2025-01-13 12:23:20'),
(46, 15, 'HuCGKfxVdsGVb5fN6KPXSE1zbzSj1eZZrjzYJXNZ8uLwoFgMxH189kx6OsAEhiOg', '2xstLUI4Ytch750eMWqU1g==', '2025-01-13 13:45:32'),
(47, 15, 'AR1O/3NKXwhLgpYZ2STTyIOCxnsLbXy2QfQr2ViONHoHY6hLLEYA/f5xc7hHv9C4', '2xstLUI4Ytch750eMWqU1g==', '2025-01-14 08:41:22'),
(48, 15, 'HuACjsINU0ElIyOS6KA96PVebcvsd7Lx/+4eSH/DX1s1WmCCnU34HbGVIUtxfEFY', '2xstLUI4Ytch750eMWqU1g==', '2025-01-14 10:54:49'),
(49, 15, 'Wm4cBxZiLPCWOjbhruibrClkfqKlNeCereJaiOE3t/tIQKa4cVzYdC3O7HBBLTwj', '2xstLUI4Ytch750eMWqU1g==', '2025-01-20 08:48:18'),
(50, 15, 'me/djLLvSL3HwdWzqguIzXLv1iOQOF8USVx5M1olGSVjuEUho8RGQFJik1WFkXrS', '2xstLUI4Ytch750eMWqU1g==', '2025-01-20 08:49:54'),
(51, 15, '0CeCYnVb1cLdX9bZ0kUxdZc8WizJvQN6ULzPCOwQ8EG6XWea6bwBYyeR4pk8PzNN', '2xstLUI4Ytch750eMWqU1g==', '2025-01-20 09:25:22'),
(52, 15, 'ihI+6rC6s+b71jNEyucChCs4zVrAiI8uXxr6U5rswfK9Se7ItcrGmtTv8NhBI4eW', '2xstLUI4Ytch750eMWqU1g==', '2025-01-20 09:36:32'),
(53, 15, 'iGDyumGujnJDI3fSQXfrGqIz3IJwWSz0CMzgrdoohnYIDfiEGziG17YBsQwevVBC', '2xstLUI4Ytch750eMWqU1g==', '2025-01-20 10:21:56'),
(54, 15, '3/LmrFf9KOKrU/NDjN0U2kLV5ifyfR3mNZ2delDUwP1v4hshXGJ2OaMb9QrRUmk5', '2xstLUI4Ytch750eMWqU1g==', '2025-01-20 10:43:03'),
(55, 15, 'kDEmYTa8mxS14b5MwyuVya+11QNb21Eu8YwaBzxBcv8RtLjdjXppCAqCaRVKp8Si', '2xstLUI4Ytch750eMWqU1g==', '2025-01-21 09:33:58'),
(56, 15, 'kVuQbkCjEvN2+CtrKUR/KaWBu0vj51DATReExsBwXDL9K43CuvrHVZVx1hqCy9Wn', '2xstLUI4Ytch750eMWqU1g==', '2025-01-21 09:59:24'),
(57, 15, 'UQkuQolwRuRR/DWp0CkHtH2+eagOA0cUg+XuTq1dV5+9/ryJ8r8OOKcMUJX6lJZ0', '2xstLUI4Ytch750eMWqU1g==', '2025-01-21 10:15:32'),
(58, 15, 'XAZmvVb0s81cdxNVtuZ6U5qWuecNu5E77YvNMeeZFaEXbIaYMc6+26opfeLPXb5v', '2xstLUI4Ytch750eMWqU1g==', '2025-01-21 13:13:18'),
(59, 15, '27I3rbRS3AjAhbZJCYiKgb9w3fUzuL1AA7KUwBhjkh0svJfqK7+M1DGYcH04fINf', '2xstLUI4Ytch750eMWqU1g==', '2025-01-22 09:08:23'),
(60, 15, '9riKU5u1LMAi6QZvkSQaIfLlbhEyTh9noRrqq+dJH1WsG9151CbRNRWYRp1fRvLA', '2xstLUI4Ytch750eMWqU1g==', '2025-01-22 10:30:28'),
(61, 15, 'Fsy6XX4VTEpBMFQW4sb3VbNzz/FEMAIhxWpFFnHK9Xb5iNG/qiFOiQbfrpkhCspW', '2xstLUI4Ytch750eMWqU1g==', '2025-01-22 14:32:04'),
(62, 15, 'oCZAejHS/n5tHWnSqcRd98slJa1gixqFdpp5VDN4im9JeZm4nDNU0QJtDwEBCGIn', '2xstLUI4Ytch750eMWqU1g==', '2025-01-22 16:05:51'),
(63, 15, 'R4Max4vbUo9zDxyjdkXL9z5MoqDGbrThcJDVF5A0MzmjnDrdYITwXmgypxd7kOFH', '2xstLUI4Ytch750eMWqU1g==', '2025-01-22 17:34:41'),
(64, 15, 'VnxreRi9jHsjTXzba99GBkNmxFNIz8zTw/vqGyOsLCv94faS4kXOLsLzHfk+bM1s', '2xstLUI4Ytch750eMWqU1g==', '2025-01-22 17:39:19'),
(65, 15, 'qBIpgiwzvjGkYd/MZnk5bUrX7IecxXTP/fU23GLi7lFPfiHs2NzugT8aPbGw5kNY', '2xstLUI4Ytch750eMWqU1g==', '2025-01-22 17:45:04'),
(66, 15, 'ZRzkWYslnuH5pNNZ3e+pHPcaIESIn168sXOnvTa/y9T9BfhfrILNd3AOEYMtb3az', '2xstLUI4Ytch750eMWqU1g==', '2025-01-22 18:22:45'),
(67, 15, 'KXO2JuT4emK1mGw9W+C91WsRCf1wjDRHr9CJ9CFTL3SB/VK43yl/tI7A6NgibOUi', '2xstLUI4Ytch750eMWqU1g==', '2025-01-22 19:04:44'),
(68, 15, 'qn+rKtOy42yUK415iEA7tiU8B3etH5gWf3so6HQcztSG4wQ7ljh2meh0jayP5gXW', '2xstLUI4Ytch750eMWqU1g==', '2025-01-24 10:37:00'),
(69, 15, 'sRlvVQ/bQgK1uADzXDQiBxJxR644ysu3RVSlIH5l9w3jDciHokGsF8qR/S2sl24f', '2xstLUI4Ytch750eMWqU1g==', '2025-01-24 10:38:38'),
(70, 15, 'WlE2XvPICANomj7OiK9c6/8JrAj/uDIFbqyETMJJVWOZCY9AYvASmn83xp1T3z/3', '2xstLUI4Ytch750eMWqU1g==', '2025-01-24 10:39:34'),
(71, 15, 'UW+xxc+rrJhDOPoBOtOWYR0ULY+dxstt0E8NQANib5/eB0uAY38QrqfTzDIXu0hw', '2xstLUI4Ytch750eMWqU1g==', '2025-01-24 11:14:20'),
(72, 15, 'EDB0wg9SjHJXA6DpAx+ae4iVMBD8NgREVpKgSqLE5oBx7vV3k4T94P/qRYduzatM', '2xstLUI4Ytch750eMWqU1g==', '2025-01-24 12:12:25'),
(73, 15, 'vsk37ZnQ61jrIvnrc6NxYGsh0Y8XYWA2NHJka02Vh1EoYIWJWgq4ljVYlUz91I7r', '2xstLUI4Ytch750eMWqU1g==', '2025-01-24 13:17:09'),
(74, 15, 'QKJrL4jujpDT++VWvhWM7pu06jEJh8rrfrJaquHNfecNGactbXHW+WEKwlW/+dxE', '2xstLUI4Ytch750eMWqU1g==', '2025-01-24 13:33:47'),
(75, 15, 'YGW4OfJZdlgR9g40J+cK4CC0awd1zZPpjQdxz5A8QqkJ1v59gRcZ75pM82DSjpUC', '2xstLUI4Ytch750eMWqU1g==', '2025-01-24 13:51:49'),
(76, 15, 'IentG0eQ7anIac/QnUYdgLM782XQUojigMoDeem1nbaNpfVb2/ShKVwPHmTGTwVC', '2xstLUI4Ytch750eMWqU1g==', '2025-01-24 14:02:48'),
(77, 15, 'hdVwLfTq1+OIXSTmozHvDyfLGAYo8nvbAAv6nGjwhqbBaKvD1dQ0zb1P+BrmLRFe', '2xstLUI4Ytch750eMWqU1g==', '2025-01-24 14:54:55'),
(78, 15, '2WL451sHwETl81hBfGi9k7AYHjGsIT7WuWL+ueMXHoT1M8zEFTjHZEtsZAWgZF8M', '2xstLUI4Ytch750eMWqU1g==', '2025-01-24 15:11:40'),
(79, 15, '7NLXxv1XGvLpq4dhnYvjQmZBivo6Q5jhPePvHoDU2kVjF6usPFZmgz5ydaN+qCkR', '2xstLUI4Ytch750eMWqU1g==', '2025-01-25 07:43:43'),
(80, 16, 'si2DCc5hxYubUUts3pdX3IeyoCesqifBpJB+D8/saJCdy2qnq6LpzlYmcIkXEb23', '2xstLUI4Ytch750eMWqU1g==', '2025-01-25 08:00:01'),
(81, 15, 'NTMZLsYzqge+lA9+18+fxOH+VNLZ4uYqkdA8qFBl0yoVtCUqfB+SbHd2JkJhjLud', '2xstLUI4Ytch750eMWqU1g==', '2025-01-25 08:02:57'),
(82, 17, 'LPFXkzOcAbsMy82mSpclTbwe6Hbb8gGDAXAfhpjXub9RKlnl6aC8CwBJGVIudtfk', '2xstLUI4Ytch750eMWqU1g==', '2025-01-25 08:04:19'),
(83, 16, 'rhaXw7nCfJYENM8mGMnEcFYEGt89J+SMc0Vc8QrGWNGJvJ3w3bG9xnMT+Z5+AvUu', '2xstLUI4Ytch750eMWqU1g==', '2025-01-25 08:16:51'),
(84, 15, 'Y4MINe4DKhtBQryK+p6wQ9SEErr0zdf5kUPNntKUdF+nmzEkhiCOJsPBUHalQX4b', '2xstLUI4Ytch750eMWqU1g==', '2025-01-28 08:29:38'),
(85, 17, 'AxuSgt96lQB8ARWnezcH5AbhwJA6wbTKEy/0HBXrrLyV/NT20TD5L+IVhAoI066J', '2xstLUI4Ytch750eMWqU1g==', '2025-01-28 08:30:07'),
(86, 15, 'Y/uElnLI6aPaIliyBPLj1IJVNDPrvaDrpWpdXrfxwuDeUimlvwKGF3SD+xG0U844', '2xstLUI4Ytch750eMWqU1g==', '2025-01-28 09:22:33'),
(87, 15, 'EQAKXzN5o4RDHGbRWfO6kKbMHXh4GLfHnfBTgiwWm8pi4oYpXbXiG3D6Bp1f7SJb', '2xstLUI4Ytch750eMWqU1g==', '2025-01-28 10:22:03'),
(88, 17, 'mC6fL+G0+KOrSqeJK/+vtKkJamuo+Ox/tkO1xH4dDp+/riPz4W0SYbdxi7ktMX4P', '2xstLUI4Ytch750eMWqU1g==', '2025-01-28 10:31:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `names` varchar(300) NOT NULL,
  `nid` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `utype` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `names`, `nid`, `phone`, `username`, `password`, `utype`, `status`) VALUES
(15, 'JJMM59wJ7tarlMYeouxNaw==', '8a4btJodeUdAFyRc7Qq2jQ==', 'szD4XOLhdjGTSJNXvPNMEg==', 'SQHzglXrV5eC/mtfYEpvog==', '711a05GAHzvFhSKZEbTYMg==', 'zgYw1X+fGL7KeHzytRfKeg==', 'KqRcb6GJisc0FZAbx0xF6g=='),
(16, 'GBhXMI19bnvLoGN0I2Ej6EoJm2e9Q+uSAZKL8+zW4Ho=', 'Zs0dbQkUS1z6RAgmOUs4QCUxPS4NUZZTRj940OuIb5I=', 'snsXtH7xx1hpRWpoXwlu+g==', 'HIaMvhWlmidnjkDS5APD/yLfOGL3VIay8+vzYRns7Eo=', 'IGrOyBfA0DYF2EslDMLa6Q==', '6I8iGGXrHEV/9aJJHcAnEw==', 'KqRcb6GJisc0FZAbx0xF6g=='),
(17, 'V/Wy0c5WpTwmpp1j1meTDQ==', 'CspbqdSRrQq9JKkPUiOUDA==', '1cftf95dUYRN5gWeEBxKfQ==', 'FhC9ar6cd5zaQEe4UfD9dA==', 'NVsIlgAFCPDjT9y4gnB6ww==', '6I8iGGXrHEV/9aJJHcAnEw==', 'KqRcb6GJisc0FZAbx0xF6g==');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prod_num` (`prod_id`),
  ADD KEY `prod_id` (`prod_id`),
  ADD KEY `prod_id_2` (`prod_id`);

--
-- Indexes for table `cars_imgs`
--
ALTER TABLE `cars_imgs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_logs`
--
ALTER TABLE `failed_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seek_cars`
--
ALTER TABLE `seek_cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session_logs`
--
ALTER TABLE `session_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `cars_imgs`
--
ALTER TABLE `cars_imgs`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_logs`
--
ALTER TABLE `failed_logs`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `seek_cars`
--
ALTER TABLE `seek_cars`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session_logs`
--
ALTER TABLE `session_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars_imgs`
--
ALTER TABLE `cars_imgs`
  ADD CONSTRAINT `cars_imgs_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `cars` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session_logs`
--
ALTER TABLE `session_logs`
  ADD CONSTRAINT `session_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
