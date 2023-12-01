-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2023 at 07:23 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokokita`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `KodeBarang` varchar(30) NOT NULL,
  `NamaBarang` varchar(50) NOT NULL,
  `Jumlah` double(9,2) DEFAULT NULL,
  `Satuan` varchar(30) DEFAULT NULL,
  `HargaSatuan` double(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`KodeBarang`, `NamaBarang`, `Jumlah`, `Satuan`, `HargaSatuan`) VALUES
('4970129727514', 'Spidol Boardmarker SNOWMAN Warna Hitam', 25.00, 'pcs', 5000.00),
('8901057510028', 'Staples Kangoro No.10-1M', 10.00, 'pcs', 5000.00),
('8992779139406', 'Glade Air Freshner Wild Lavender', 10.00, 'botol', 15000.00),
('KZ20230601242', 'SSD KYO Kaizen Series 1 TB', 10.00, 'pcs', 900000.00);

-- --------------------------------------------------------

--
-- Table structure for table `isitransaksi`
--

CREATE TABLE `isitransaksi` (
  `IdIsiTransaksi` int(11) NOT NULL,
  `KodeBarang` varchar(30) NOT NULL,
  `JumlahJual` double(9,2) DEFAULT NULL,
  `IdTransaksi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `IdKasir` int(2) NOT NULL,
  `NamaKasir` varchar(50) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `TglDaftar` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`IdKasir`, `NamaKasir`, `Password`, `TglDaftar`) VALUES
(1, 'Admin', 'Admin', '2023-11-10 06:22:44'),
(2, 'Admin Toko', 'Admin Toko', '2023-11-10 13:45:54');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `IdTransaksi` int(11) NOT NULL,
  `TglTransaksi` datetime NOT NULL DEFAULT current_timestamp(),
  `Pembeli` text NOT NULL,
  `IdKasir` int(4) NOT NULL,
  `TotalNilaiTransaksi` double(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`KodeBarang`);

--
-- Indexes for table `isitransaksi`
--
ALTER TABLE `isitransaksi`
  ADD PRIMARY KEY (`IdIsiTransaksi`),
  ADD KEY `IndexKodeBarang` (`KodeBarang`),
  ADD KEY `IndexIdTransaksi` (`IdTransaksi`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`IdKasir`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`IdTransaksi`),
  ADD KEY `IdKasir` (`IdKasir`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `isitransaksi`
--
ALTER TABLE `isitransaksi`
  MODIFY `IdIsiTransaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kasir`
--
ALTER TABLE `kasir`
  MODIFY `IdKasir` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `IdTransaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `isitransaksi`
--
ALTER TABLE `isitransaksi`
  ADD CONSTRAINT `isitransaksi_ibfk_1` FOREIGN KEY (`KodeBarang`) REFERENCES `barang` (`KodeBarang`),
  ADD CONSTRAINT `isitransaksi_ibfk_2` FOREIGN KEY (`IdTransaksi`) REFERENCES `transaksi` (`IdTransaksi`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`IdKasir`) REFERENCES `kasir` (`IdKasir`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
