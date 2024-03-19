-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2024 at 05:58 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbevoting`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_calon`
--

CREATE TABLE `tb_calon` (
  `id_calon` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `nip_bps` varchar(10) NOT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `jabatan` varchar(50) NOT NULL,
  `status` enum('1','0') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_calon`
--

INSERT INTO `tb_calon` (`id_calon`, `id_pengguna`, `nip_bps`, `nama_pegawai`, `jabatan`, `status`) VALUES
(1, 59, '340013515', 'Ahmad Nur, SE', 'Statistisi Ahli Muda ', '1'),
(2, 64, '340015809', 'Raflis, S.Kom', 'Statistisi Ahli Muda', '1'),
(3, 67, '340017808', 'Lisa Putri Khairani, SST, MM', 'Statistisi Ahli Muda ', '1'),
(4, 68, '340017906', 'Chairil Fadli, S.ST', 'Statistisi Ahli Madya (1-04-2023)', '1'),
(5, 74, '340054590', 'Firlan, S.Si, M.Si', 'Pranata Komputer Ahli Muda ', '1'),
(6, 91, '340062282', 'Kuci Purnomo, A.Md', 'Pustakawan Terampil (Fungsional Umum)', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_daftarvote`
--

CREATE TABLE `tb_daftarvote` (
  `daftarvote_id` int(11) NOT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tanggal_mulai` datetime DEFAULT NULL,
  `tanggal_selesai` datetime DEFAULT NULL,
  `status_id` enum('0','1','2') DEFAULT NULL,
  `flag_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_daftarvote`
--

INSERT INTO `tb_daftarvote` (`daftarvote_id`, `nama`, `keterangan`, `tanggal_mulai`, `tanggal_selesai`, `status_id`, `flag_id`) VALUES
(5, 'Pemilihan Karyawan Teladan', 'Ini adalah voting pemilihan karyawan terbaik', '2024-03-13 11:00:00', '2024-03-18 23:00:00', '1', 1),
(6, 'Pemilihan Ambasador', 'Ini adalah voting pemilihan ambasador', '2024-03-03 19:50:00', '2024-03-18 23:00:00', '1', 1),
(9, 'Pemilihan Change Ambasador', 'Ini pemilihan change ambasador', '2024-03-18 08:00:00', '2024-03-20 16:00:00', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nip_bps` varchar(10) NOT NULL,
  `nip_pegawai` varchar(22) NOT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `kode_org` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `pangkat` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `level` enum('Administrator','Pemilih') DEFAULT NULL,
  `status` enum('1','0') DEFAULT NULL,
  `jenis` enum('PAN','PST') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nip_bps`, `nip_pegawai`, `nama_pegawai`, `kode_org`, `jabatan`, `pangkat`, `username`, `password`, `level`, `status`, `jenis`) VALUES
(1, '', '', 'Admin', '', '', '', 'admin', '1234', 'Administrator', '1', 'PAN'),
(58, '340011713', '196702221987032002', 'Mega Wulansari, SE', '92810', 'Kasubbag Umum', 'Penata Tk.I (III/d)', 'mega', 'mega_bps12345', 'Pemilih', '1', 'PST'),
(59, '340013515', '196902271993011001', 'Ahmad Nur, SE', '92800', 'Statistisi Ahli Muda ', 'Penata Tk.I (III/d)', 'ahmad', 'ahmad_bps12345', 'Pemilih', '1', 'PST'),
(60, '340014375', '197111061994011001', 'Yatria Nova', '92800', 'Pelaksana (fungsional Umum)', 'Penata Muda Tk.I (III/b)', 'yatria', 'yatria_bps12345', 'Pemilih', '1', 'PST'),
(61, '340015616', '197306071998031005', 'Edy, SE', '92800', 'Statistisi Ahli Muda ', 'Penata (III/c)', 'edy', 'edy_bps12345', 'Pemilih', '1', 'PST'),
(62, '340015808', '197212061999031001', 'Alfianto, S.Kom, M.Kom', '92800', 'Kepala ', 'Pembina Tk,I (IV/b)', 'alfianto', 'alfianto_bps12345', 'Pemilih', '1', 'PST'),
(64, '340015809', '196706241999031002', 'Raflis, S.Kom', '92800', 'Statistisi Ahli Muda', 'Penata Tk.I (III/d)', 'raflis', 'raflis_bps12345', 'Pemilih', '1', 'PST'),
(65, '340017452', '198304292005022001', 'Eka Nurul Fitri, S.Kom, M.CIO.', '92800', 'Statistisi Ahli Muda ', 'Pembina (IV/a)', 'eka', 'eka_bps12345', 'Pemilih', '1', 'PST'),
(66, '340017455', '198609182005022001', 'Yossi Windria, SE, ME', '92800', 'Statistisi Ahli Pertama (23-06-2023)', 'Penata (III/c)', 'yossi', 'yossi_bps12345', 'Pemilih', '1', 'PST'),
(67, '340017808', '198310272006022001', 'Lisa Putri Khairani, SST, MM', '92800', 'Statistisi Ahli Muda ', 'Penata Tk.I (III/d)', 'lisa', 'lisa_bps12345', 'Pemilih', '1', 'PST'),
(68, '340017906', '198102182006021001', 'Chairil Fadli, S.ST', '92800', 'Statistisi Ahli Madya (1-04-2023)', 'Penata Tk.I (III/d)', 'chairil', 'chairil_bps12345', 'Pemilih', '1', 'PST'),
(69, '340020515', '198106012007101001', 'Iswady Idris', '92800', 'Pelaksana (fungsional Umum)', 'Pengatur  TkI (II/d)', 'iswady', 'iswady_bps12345', 'Pemilih', '1', 'PST'),
(70, '340050226', '198602112009022008', 'Riska Febrina, SST, M.E.K.K', '92800', 'Statistisi Ahli Muda', 'Pembina (IV/a)', 'riska', 'riska_bps12345', 'Pemilih', '1', 'PST'),
(71, '340054580', '198606292011011009', 'Alfid Junaidy, S.E.', '92800', 'Statistisi Ahli Muda', 'Penata Tk.I (III/d)', 'alfid', 'alfid_bps12345', 'Pemilih', '1', 'PST'),
(72, '340054582', '198604192011011013', 'Bilal Alsyiddiq, S.Si, M.Pd', '92800', 'Analis Pengelola Keuangan APBN Ahli Muda', 'Penata Tk.I (III/d)', 'bilal', 'bilal_bps12345', 'Pemilih', '1', 'PST'),
(73, '340054588', '197606082011012004', 'Elfi Khaira, SE.,M.Si', '92800', 'Statistisi Ahli Muda ', 'Penata (III/c)', 'elfi', 'elfi_bps12345', 'Pemilih', '1', 'PST'),
(74, '340054590', '198808032011011006', 'Firlan, S.Si, M.Si', '92800', 'Pranata Komputer Ahli Muda ', 'Penata Tk.I (III/d)', 'firlan', 'firlan_bps12345', 'Pemilih', '1', 'PST'),
(75, '340054592', '198606112011011015', 'Gesti Sapardi, A.Md', '92800', 'Statistisi Mahir', 'Penata Muda (III/a)', 'gesti', 'gesti_bps12345', 'Pemilih', '1', 'PST'),
(76, '340054621', '198312252011011015', 'Yori Akmal, SP', '92800', 'Statistisi Ahli Muda', 'Penata (III/c)', 'yori', 'yori_bps12345', 'Pemilih', '1', 'PST'),
(77, '340055919', '199007252012112001', 'Sherly Aktivani, SST, M.Sc', '92800', 'Statistisi Ahli Muda', 'Penata (III/c)', 'sherly', 'sherly_bps12345', 'Pemilih', '1', 'PST'),
(78, '340055984', '199002242012121001', 'Fikri Abdullah, A.Md', '92800', 'Statistisi Mahir', 'Penata Muda (III/a)', 'fikri', 'fikri_bps12345', 'Pemilih', '1', 'PST'),
(79, '340056019', '198912062012122002', 'Rhades Fikar, A.Md', '92810', 'Penugasan Pranata Keuangan APBN Terampil  (Fungsio', 'Penata Muda (III/a)', 'rhades', 'rhades_bps12345', 'Pemilih', '1', 'PST'),
(80, '340056794', '199012102014102001', 'Armalia Desiyanti, SST, M.Stat', '92800', 'Statistisi Ahli Pertama ', 'Penata (III/c)', 'armalia', 'armalia_bps12345', 'Pemilih', '1', 'PST'),
(81, '340056908', '199101022014102001', 'Winda Dwi Putri, SST', '92800', 'Statistisi Ahli Muda', 'Penata  (III/c)', 'winda', 'winda_bps12345', 'Pemilih', '1', 'PST'),
(82, '340057112', '199303162014122001', 'Kurnia Prima Ramadhana, S.ST', '92800', 'Penata (III/c)', 'Statistisi Ahli Muda', 'kurnia', 'kurnia_bps12345', 'Pemilih', '1', 'PST'),
(83, '340057226', '199205052014122001', 'Vantri Eka Syuryani, SST', '92800', 'Statistisi Ahli Pertama', 'Penata Muda Tk.I (III/b)', 'vantri', 'vantri_bps12345', 'Pemilih', '1', 'PST'),
(84, '340058097', '199307072017012002', 'Wiranita Partiwi, SST', '92800', 'Statistisi Ahli Pertama', 'Penata Muda Tk.I (III/b)', 'wiranita', 'wiranita_bps12345', 'Pemilih', '1', 'PST'),
(85, '340058555', '199507102019011001', 'Adenil Zakaria, S.Tr.Stat', '92800', 'Statistisi Ahli Pertama ', 'Penata Muda (III/a)', 'adenil', 'adenil_bps12345', 'Pemilih', '1', 'PST'),
(86, '340059135', '199202042019032002', 'Silvia Netsyah, S.Si', '92800', 'Statistisi Ahli Pertama', 'Penata Muda (III/a)', 'silvia', 'silvia_bps12345', 'Pemilih', '1', 'PST'),
(87, '340060750', '199812032022012001', 'Masyitah Ayuning Setyo, S.Tr.Stat', '92800', 'Pranata Komputer Ahli Pertama ', 'Penata Muda (III/a)', 'masyitah', 'masyitah_bps12345', 'Pemilih', '1', 'PST'),
(88, '340061052', '199905282022011004', 'Adolf Jaya Sebastian Lubis, A.Md.Kb.N', '92810', 'Pranata Keuangan APBN Terampil', 'Pengatur (II/c) ', 'adolf', 'adolf_bps12345', 'Pemilih', '1', 'PST'),
(89, '340061204', '199603282022031007', 'Aulia Rahman Harahap A, Md', '92800', 'Statistisi Terampil', 'Pengatur (II/c) ', 'aulia', 'aulia_bps12345', 'Pemilih', '1', 'PST'),
(90, '340061495', '199206052022032009', 'Rahmila Zola, A.Md', '92800', 'Statistisi Terampil', 'Pengatur (II/c) ', 'rahmila', 'rahmila_bps12345', 'Pemilih', '1', 'PST'),
(91, '340062282', '198602262023211009', 'Kuci Purnomo, A.Md', '92810', 'Pustakawan Terampil (Fungsional Umum)', 'VII', 'kuci', 'kuci_bps12345', 'Pemilih', '1', 'PST'),
(92, '50061116', '197005081991031004', 'Yusuf, SH.', '92800', 'Pelaksana (fungsional Umum)', 'Penata Tk.I (III/d)', 'yusuf', 'yusuf_bps12345', 'Pemilih', '1', 'PST');

-- --------------------------------------------------------

--
-- Table structure for table `tb_vote`
--

CREATE TABLE `tb_vote` (
  `id_vote` int(11) NOT NULL,
  `daftarvote_id` int(11) DEFAULT NULL,
  `id_calon` varchar(2) DEFAULT NULL,
  `id_pemilih` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_vote`
--

INSERT INTO `tb_vote` (`id_vote`, `daftarvote_id`, `id_calon`, `id_pemilih`, `date`) VALUES
(1, 5, '4', 58, '2024-03-18 08:32:47'),
(2, 6, '3', 84, '2024-03-18 08:33:48'),
(3, 5, '1', 59, '2024-03-18 08:34:17'),
(4, 6, '5', 88, '2024-03-18 08:34:37'),
(5, 5, '5', 64, '2024-03-18 08:35:07'),
(6, 6, '4', 86, '2024-03-18 08:35:32'),
(7, 9, '2', 61, '2024-03-18 10:25:42');

-- --------------------------------------------------------

--
-- Table structure for table `tb_votekandidat`
--

CREATE TABLE `tb_votekandidat` (
  `votekandidat_id` int(11) NOT NULL,
  `daftarvote_id` int(11) DEFAULT NULL,
  `id_calon` int(11) DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `flag_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_votekandidat`
--

INSERT INTO `tb_votekandidat` (`votekandidat_id`, `daftarvote_id`, `id_calon`, `no_urut`, `flag_id`) VALUES
(1, 5, 1, 1, 1),
(2, 5, 4, 2, 1),
(3, 5, 5, 3, 1),
(4, 5, 3, 4, 1),
(5, 5, 2, 5, 1),
(8, 6, 1, 1, 1),
(9, 6, 4, 2, 1),
(10, 6, 5, 3, 1),
(11, 6, 3, 4, 1),
(12, 6, 2, 5, 1),
(13, 9, 1, NULL, 1),
(14, 9, 2, NULL, 1),
(15, 9, 3, NULL, 1),
(16, 9, 4, NULL, 1),
(17, 9, 5, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_votepemilih`
--

CREATE TABLE `tb_votepemilih` (
  `votepemilih_id` int(11) NOT NULL,
  `daftarvote_id` int(11) DEFAULT NULL,
  `id_pemilih` int(11) DEFAULT NULL,
  `flag_id` tinyint(4) DEFAULT NULL,
  `status_id` enum('1','2') DEFAULT NULL COMMENT '1 = BELUM MEMILIH / 2 = SUDAH MEMILIH'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_votepemilih`
--

INSERT INTO `tb_votepemilih` (`votepemilih_id`, `daftarvote_id`, `id_pemilih`, `flag_id`, `status_id`) VALUES
(1, 5, 58, 1, '2'),
(2, 5, 59, 1, '2'),
(3, 5, 60, 1, '1'),
(4, 5, 61, 1, '1'),
(5, 5, 62, 1, '1'),
(6, 5, 64, 1, '2'),
(7, 6, 82, 1, '1'),
(8, 6, 83, 1, '1'),
(9, 6, 84, 1, '2'),
(10, 6, 85, 1, '1'),
(11, 6, 86, 1, '2'),
(12, 6, 87, 1, '1'),
(13, 6, 88, 1, '2'),
(14, 5, 82, 1, '1'),
(15, 5, 83, 1, '1'),
(16, 9, 58, 1, '1'),
(17, 9, 59, 1, '1'),
(18, 9, 60, 1, '1'),
(19, 9, 61, 1, '2'),
(20, 9, 62, 1, '1'),
(21, 9, 64, 1, '1'),
(22, 9, 65, 1, '1'),
(23, 9, 66, 1, '1'),
(24, 9, 67, 1, '1'),
(25, 9, 68, 1, '1'),
(26, 9, 69, 1, '1'),
(27, 9, 70, 1, '1'),
(28, 9, 71, 1, '1'),
(29, 9, 72, 1, '1'),
(30, 9, 73, 1, '1'),
(31, 9, 74, 1, '1'),
(32, 9, 75, 1, '1'),
(33, 9, 76, 1, '1'),
(34, 9, 77, 1, '1'),
(35, 9, 78, 1, '1'),
(36, 9, 79, 1, '1'),
(37, 9, 80, 1, '1'),
(38, 9, 81, 1, '1'),
(39, 9, 82, 1, '1'),
(40, 9, 83, 1, '1'),
(41, 9, 84, 1, '1'),
(42, 9, 85, 1, '1'),
(43, 9, 86, 1, '1'),
(44, 9, 87, 1, '1'),
(45, 9, 88, 1, '1'),
(46, 9, 89, 1, '1'),
(47, 9, 90, 1, '1'),
(48, 9, 91, 1, '1'),
(49, 9, 92, 1, '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_calon`
--
ALTER TABLE `tb_calon`
  ADD PRIMARY KEY (`id_calon`) USING BTREE,
  ADD UNIQUE KEY `unique_nama_pegawai` (`nama_pegawai`);

--
-- Indexes for table `tb_daftarvote`
--
ALTER TABLE `tb_daftarvote`
  ADD PRIMARY KEY (`daftarvote_id`) USING BTREE;

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tb_vote`
--
ALTER TABLE `tb_vote`
  ADD PRIMARY KEY (`id_vote`) USING BTREE,
  ADD UNIQUE KEY `daftarvote` (`daftarvote_id`,`id_pemilih`) USING BTREE;

--
-- Indexes for table `tb_votekandidat`
--
ALTER TABLE `tb_votekandidat`
  ADD PRIMARY KEY (`votekandidat_id`) USING BTREE;

--
-- Indexes for table `tb_votepemilih`
--
ALTER TABLE `tb_votepemilih`
  ADD PRIMARY KEY (`votepemilih_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_calon`
--
ALTER TABLE `tb_calon`
  MODIFY `id_calon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_daftarvote`
--
ALTER TABLE `tb_daftarvote`
  MODIFY `daftarvote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `tb_vote`
--
ALTER TABLE `tb_vote`
  MODIFY `id_vote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_votekandidat`
--
ALTER TABLE `tb_votekandidat`
  MODIFY `votekandidat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_votepemilih`
--
ALTER TABLE `tb_votepemilih`
  MODIFY `votepemilih_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
