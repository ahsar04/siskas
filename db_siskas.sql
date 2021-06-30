-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2021 at 04:38 AM
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
  `nama` varchar(100) NOT NULL,
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
('adm4', 'saya', '5678', 'vklln', 'asww', 'asw', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kd_barang` varchar(13) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kd_barang`, `nama_barang`, `satuan`, `harga_beli`, `harga_jual`, `stok`) VALUES
('brg1', 'Kertas HVS', 'Lembar', 250, 500, 100),
('brg10', 'kjhkhj', 'jkhkjh', 89787, 8787, 787),
('brg11', 'kjhkhj', 'jkhkjh', 89787, 8787, 787),
('brg13', 'kjhkhj', 'jkhkjh', 89787, 8787, 787),
('brg14', 'kjhkhj', 'jkhkjh', 89787, 8787, 787),
('brg16', 'kjhkhj', 'jkhkjh', 89787, 8787, 787),
('brg17', 'kjhkhj', 'jkhkjh', 89787, 8787, 787),
('brg18', 'kjhkhj', 'jkhkjh', 89787, 8787, 787),
('brg19', 'kjhkhj', 'jkhkjh', 89787, 8787, 787),
('brg2', 'Bolpoint Pilot', 'biji', 1000, 1500, 800),
('brg20', 'kjhkhj', 'jkhkjh', 89787, 8787, 787),
('brg21', 'kjhkhj', 'jkhkjh', 89787, 8787, 787),
('brg22', 'kjhkhj', 'jkhkjh', 89787, 8787, 787),
('brg3', 'Bolpoint Soper', 'biji', 1000, 1500, 800),
('brg4', 'tep X', 'biji', 1000, 1500, 750),
('brg5', 'yyy', 'jgkjgj', 76, 7676, 767),
('brg6', 'bkjbkj', 'kjkjkhk', 8686, 887878, 7878),
('brg7', 'kjhkhj', 'jkhkjh', 89787, 8787, 787),
('brg8', 'bkjbkj', 'kjkjkhk', 8686, 887878, 7878),
('brg9', 'kjhkhj', 'jkhkjh', 89787, 8787, 787);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail`
--

CREATE TABLE `tb_detail` (
  `kd_transaksi` varchar(13) NOT NULL,
  `kd_barang` varchar(13) NOT NULL,
  `qty` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail`
--

INSERT INTO `tb_detail` (`kd_transaksi`, `kd_barang`, `qty`, `sub_total`) VALUES
('T202006281', 'brg1', 10, 5000),
('T202006281', 'brg2', 2, 3000),
('T202006282', 'brg2', 1, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `kd_transaksi` varchar(13) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `total_tagihan` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `ket` varchar(100) NOT NULL,
  `admin_id` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`kd_transaksi`, `tgl_transaksi`, `total_tagihan`, `total_bayar`, `kembalian`, `ket`, `admin_id`) VALUES
('T202006281', '2021-06-12', 8000, 10000, 2000, '-', 'adm1'),
('T202006282', '2021-06-13', 1500, 2000, 500, '-', 'adm1'),
('T202106283', '2021-06-29', 8000, 20000, 12000, '-', 'adm1');

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
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `tb_detail`
--
ALTER TABLE `tb_detail`
  ADD KEY `memiliki` (`kd_barang`),
  ADD KEY `mempunyai` (`kd_transaksi`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`kd_transaksi`),
  ADD KEY `melayani` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
