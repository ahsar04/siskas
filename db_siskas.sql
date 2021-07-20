-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2021 at 09:44 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_siskas`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` varchar(13) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `alamat` text NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `akses` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `nama`, `telp`, `alamat`, `username`, `password`, `akses`) VALUES
('adm1', 'Ahmad Saifur Rohman', '082267687322', 'jl. Merbabu Rt.2 Rw. 20. desa tanggul wetan, kec. Tanggul, Kab Jember', 'asr', '24434', 1),
('adm2', 'Candra Pramudya H', '082345678912', 'Probolinggo', 'cph', '11111', 0),
('adm3', 'Kelompok 1', '08123456789', 'coba	', 'admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id` int(11) NOT NULL,
  `kd_barang` varchar(13) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `satuan` varchar(25) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `stok` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id`, `kd_barang`, `nama_barang`, `satuan`, `harga_beli`, `harga_jual`, `stok`) VALUES
(1, 'brg1', 'Bolpoint Honaga', 'pcs', 1500, 2000, 72),
(2, 'brg2', 'Busur', 'pcs', 1000, 2000, 30),
(3, 'brg3', 'Spidol Warna', 'pack', 13000, 14000, 33),
(4, 'brg4', 'Kwitansi', 'pcs', 3000, 4000, 4),
(5, 'brg5', 'Buku Gambar A4', 'pcs', 2000, 3000, 0),
(6, 'brg6', 'Buku Gambar A3', 'pcs', 5000, 6000, 30),
(7, 'brg7', 'Kaos Kaki', 'pcs', 4000, 5000, 2),
(8, 'brg8', 'Maps Kertas', 'pcs', 500, 1000, 32),
(9, 'brg9', 'Maps Plastik', 'pcs', 2000, 3000, 9),
(10, 'brg10', 'Hasduk', 'pcs', 14000, 16000, 50),
(11, 'brg11', 'Spidol Warna', 'pack', 13000, 14000, 39),
(12, 'brg12', 'spidol', 'pcs', 1500, 2500, 48),
(13, 'brg13', 'Kertas Folio Bergaris', 'Lembar', 200, 250, 21),
(14, 'brg14', 'Kertas Karton', 'Lembar', 5000, 6000, 9),
(15, 'brg15', 'Kertas Manila', 'Lembar', 2000, 3000, 11),
(16, 'brg16', 'Nota', 'pcs', 2500, 3000, 4),
(17, 'brg17', 'Buku Isi 38', 'pack', 20000, 22000, 11),
(18, 'brg18', 'Buku Isi 58', 'pcs', 3000, 4500, 39),
(19, 'brg19', 'penggaris', 'pcs', 1500, 2500, 20),
(20, 'brg20', 'buku', 'pack', 11000, 15000, 43),
(21, 'brg21', 'Pencil', 'pcs', 500, 1000, 12),
(22, 'brg22', 'Penghapus', 'pcs', 1500, 2000, 20),
(23, 'brg23', 'Sendal', 'pcs', 18000, 20000, 30),
(25, 'brg24', 'Sampul', 'pcs', 250, 500, 20),
(26, 'brg25', 'tas', 'pcs', 3000, 4000, 10),
(27, 'brg26', 'Bolpoint Faber Castel', 'pcs', 2500, 3000, 80),
(28, 'brg27', 'softcase', 'pcs', 7500, 10000, 15),
(29, 'brg28', 'tupperware', 'pcs', 50000, 85000, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail`
--

CREATE TABLE `tb_detail` (
  `kd_transaksi` varchar(25) NOT NULL,
  `kd_barang` varchar(13) NOT NULL,
  `qty` int(4) NOT NULL,
  `sub_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail`
--

INSERT INTO `tb_detail` (`kd_transaksi`, `kd_barang`, `qty`, `sub_total`) VALUES
('T202107061', 'brg1', 2, 4000),
('T202107061', 'brg2', 5, 12500),
('T202107071', 'brg1', 1, 2000),
('T202107071', 'brg2', 6, 15000),
('T202107072', 'brg1', 1, 2000),
('T202107072', 'brg5', 1, 3000),
('T202107072', 'brg12', 1, 2500),
('T202107072', 'brg7', 5, 25000),
('T202107072', 'brg16', 16, 48000),
('T202107072', 'brg17', 2, 44000),
('T202107073', 'brg1', 1, 2000),
('T202107073', 'brg7', 3, 15000),
('T202107073', 'brg13', 15, 3750),
('T202107073', 'brg17', 6, 132000),
('T202107073', 'brg15', 1, 3000),
('T202107081', 'brg7', 10, 50000),
('T202107082', 'brg2', 1, 2000),
('T202107083', 'brg1', 1, 2000),
('T202107084', 'brg2', 1, 2000),
('T202107085', 'brg5', 6, 18000),
('T202107085', 'brg3', 2, 28000),
('T202107085', 'brg1', 10, 20000),
('T202107086', 'brg1', 10, 20000),
('T202107087', 'brg1', 1, 2000),
('T202107087', 'brg2', 1, 2000),
('T202107088', 'brg2', 1, 2000),
('T202107181', 'brg2', 1, 2000),
('T202107181', 'brg3', 1, 14000),
('T202107201', 'brg3', 1, 14000),
('T202107201', 'brg1', 2, 4000),
('T202107202', 'brg5', 1, 3000),
('T202107202', 'brg1', 1, 2000),
('T202107203', 'brg1', 1, 2000),
('T202107207', 'brg2', 1, 2000),
('T202107208', 'brg3', 1, 14000),
('T202107209', 'brg4', 1, 4000),
('T2021072010', 'brg4', 1, 4000),
('T2021072011', 'brg2', 1, 2000),
('T2021072011', 'brg4', 1, 4000),
('T2021072011', 'brg3', 1, 14000),
('T2021072011', 'brg8', 1, 1000),
('T2021072011', 'brg13', 3, 750),
('T2021072012', 'brg2', 1, 2000),
('T2021072013', 'brg2', 1, 2000),
('T2021072013', 'brg1', 3, 6000),
('T2021072013', 'brg20', 1, 15000),
('T2021072013', 'brg18', 1, 4500),
('T2021072013', 'brg17', 1, 22000),
('T2021072013', 'brg15', 5, 15000),
('T2021072014', 'brg4', 1, 4000),
('T2021072014', 'brg2', 1, 2000),
('T2021072014', 'brg5', 1, 3000),
('T2021072014', 'brg4', 1, 4000),
('T2021072014', 'brg13', 1, 250),
('T2021072016', 'brg1', 1, 2000),
('T2021072017', 'brg3', 1, 14000),
('T2021072017', 'brg8', 1, 1000),
('T2021072017', 'brg11', 1, 14000),
('T2021072018', 'brg4', 1, 4000),
('T2021072018', 'brg5', 1, 3000),
('T2021072019', 'brg9', 1, 3000),
('T2021072019', 'brg8', 1, 1000),
('T2021072019', 'brg14', 1, 6000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `no` int(11) NOT NULL,
  `kd_transaksi` varchar(25) NOT NULL,
  `tgl_transaksi` varchar(10) NOT NULL,
  `jml_barang` int(7) DEFAULT NULL,
  `total_tagihan` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `ket` text DEFAULT NULL,
  `admin_id` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`no`, `kd_transaksi`, `tgl_transaksi`, `jml_barang`, `total_tagihan`, `total_bayar`, `kembalian`, `ket`, `admin_id`) VALUES
(1, 'T202107061', '2021-07-06', 7, 16500, 50000, 33500, '', 'adm1'),
(2, 'T202107071', '2021-07-07', 7, 17000, 20000, 3000, '', 'adm1'),
(3, 'T202107072', '2021-07-07', 26, 124500, 150000, 25500, '', 'adm1'),
(4, 'T202107073', '2021-07-07', 26, 155750, 200000, 44250, '', 'adm1'),
(5, 'T202107081', '2021-07-08', 10, 50000, 100000, 50000, '', 'adm1'),
(6, 'T202107082', '2021-07-08', 1, 2000, 5000, 3000, '', 'adm1'),
(7, 'T202107083', '2021-07-08', 1, 2000, 5000, 3000, '', 'adm1'),
(8, 'T202107084', '2021-07-08', 1, 2000, 10000, 8000, '', 'adm1'),
(9, 'T202107085', '2021-07-08', 18, 66000, 100000, 34000, '', 'adm1'),
(10, 'T202107086', '2021-07-08', 10, 20000, 50000, 30000, '', 'adm1'),
(11, 'T202107087', '2021-07-08', 2, 4000, 5000, 1000, '', 'adm1'),
(12, 'T202107088', '2021-07-08', 1, 2000, 5000, 3000, '', 'adm1'),
(13, 'T202107181', '2021-07-18', 2, 16000, 20000, 4000, '', 'adm1'),
(14, 'T202107201', '2021-07-20', 3, 18000, 20000, 2000, '', 'adm3'),
(15, 'T202107202', '2021-07-20', 2, 5000, 5000, 0, '', 'adm3'),
(16, 'T202107203', '2021-07-20', 1, 2000, 5000, 3000, '', 'adm3'),
(17, 'T202107204', '2021-07-20', 0, 2000, 5000, 3000, '', 'adm3'),
(18, 'T202107205', '2021-07-20', 0, 2000, 5000, 3000, '', 'adm3'),
(19, 'T202107206', '2021-07-20', 0, 2000, 5000, 3000, '', 'adm3'),
(20, 'T202107207', '2021-07-20', 1, 2000, 5000, 3000, '', 'adm1'),
(21, 'T202107208', '2021-07-20', 1, 14000, 15000, 1000, '', 'adm3'),
(22, 'T202107209', '2021-07-20', 1, 4000, 5000, 1000, '', 'adm3'),
(23, 'T2021072010', '2021-07-20', 1, 4000, 10000, 6000, '', 'adm3'),
(24, 'T2021072011', '2021-07-20', 7, 21750, 25000, 3250, '', 'adm3'),
(25, 'T2021072012', '2021-07-20', 1, 2000, 20000, 18000, '', 'adm3'),
(26, 'T2021072013', '2021-07-20', 12, 64500, 70000, 5500, '', 'adm1'),
(27, 'T2021072014', '2021-07-20', 3, 7250, 10000, 2750, '', 'adm3'),
(28, 'T2021072015', '2021-07-20', 0, 7250, 10000, 2750, '', 'adm3'),
(29, 'T2021072016', '2021-07-20', 1, 2000, 5000, 3000, '', 'adm3'),
(30, 'T2021072017', '2021-07-20', 3, 29000, 30000, 1000, '', 'adm3'),
(31, 'T2021072018', '2021-07-20', 2, 7000, 10000, 3000, '', 'adm3'),
(32, 'T2021072019', '2021-07-20', 2, 7000, 10000, 3000, NULL, 'adm1'),
(33, 'T2021072020', '2021-07-20', 0, 7000, 10000, 3000, NULL, 'adm1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_detail`
--
ALTER TABLE `tb_detail`
  ADD KEY `detail` (`kd_transaksi`),
  ADD KEY `detail barang` (`kd_barang`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`no`),
  ADD KEY `melayani` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
