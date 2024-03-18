-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2024 at 03:16 PM
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
(37, 58, '340011713', 'Mega Wulansari, SE', 'Kasubbag Umum', '1'),
(38, 59, '340013515', 'Ahmad Nur, SE', 'Statistisi Ahli Muda ', '1');

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
  `flag_id` tinyint(4) DEFAULT NULL,
  `tipe_pemilihan` enum('satu_kandidat','beberapa_kandidat') NOT NULL DEFAULT 'satu_kandidat'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_daftarvote`
--

INSERT INTO `tb_daftarvote` (`daftarvote_id`, `nama`, `keterangan`, `tanggal_mulai`, `tanggal_selesai`, `status_id`, `flag_id`, `tipe_pemilihan`) VALUES
(5, 'Pemilihan Karyawan Teladan', 'Ini adalah voting pemilihan karyawan terbaik', '2024-03-01 23:00:00', '2024-03-04 23:00:00', '1', 1, 'beberapa_kandidat'),
(6, 'Pemilihan Ambasador', 'Ini adalah voting pemilihan ambasador', '2024-03-03 19:50:00', '2024-03-04 19:50:00', '1', 1, 'satu_kandidat'),
(7, 'Pemilihan', 'Pemilihan', '2024-03-03 20:07:00', '2024-03-04 20:07:00', '1', 1, 'satu_kandidat');

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
  `date` datetime DEFAULT NULL,
  `bobot_suara` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_vote`
--

INSERT INTO `tb_vote` (`id_vote`, `daftarvote_id`, `id_calon`, `id_pemilih`, `date`, `bobot_suara`) VALUES
(1, 5, '1', 65, '2024-03-03 23:57:32', 0),
(2, 5, '3', 66, '2024-03-03 23:59:37', 0),
(3, 5, '4', 67, '2024-03-04 00:02:49', 0),
(4, 5, '2', 68, '2024-03-04 00:05:02', 0),
(5, 5, '1', 58, '2024-03-04 01:49:21', 0),
(6, 6, '1', 58, '2024-03-04 01:52:15', 0),
(7, 6, '1', 62, '2024-03-04 01:55:58', 0),
(8, 5, '1', 59, '2024-03-04 01:57:46', 0),
(9, 5, '1', 61, '2024-03-04 10:01:26', 0),
(10, 6, '1', 61, '2024-03-04 13:35:14', 0);

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
(2, 5, 3, 2, 1),
(3, 5, 4, 3, 1),
(4, 5, 2, 4, 1),
(5, 6, 1, NULL, 1),
(6, 6, 3, NULL, 1);

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
(1, 5, 65, 1, '2'),
(2, 5, 66, 1, '2'),
(3, 5, 67, 1, '2'),
(4, 5, 68, 1, '2'),
(5, 5, 58, 1, '2'),
(6, 5, 59, 1, '2'),
(7, 5, 60, 1, '1'),
(8, 5, 61, 1, '2'),
(9, 6, 58, 1, '2'),
(10, 6, 59, 1, '1'),
(11, 6, 60, 1, '1'),
(12, 6, 61, 1, '2'),
(13, 6, 62, 1, '2');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_vote`
-- (See below for the actual view)
--
CREATE TABLE `v_vote` (
);

-- --------------------------------------------------------

--
-- Structure for view `v_vote`
--
DROP TABLE IF EXISTS `v_vote`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ipay`@`%` SQL SECURITY DEFINER VIEW `v_vote`  AS SELECT `a`.`id_vote` AS `id_vote`, `a`.`daftarvote_id` AS `daftarvote_id`, `a`.`id_calon` AS `id_calon`, `a`.`id_pemilih` AS `id_pemilih`, `a`.`date` AS `date`, `b`.`nama_calon` AS `nama_calon`, `b`.`foto_calon` AS `foto_calon`, `b`.`keterangan` AS `keterangan`, `c`.`nama_pengguna` AS `nama_pemilih` FROM ((`tb_vote` `a` join `tb_calon` `b` on(`a`.`id_calon` = `b`.`id_calon`)) join `tb_pengguna` `c` on(`a`.`id_pemilih` = `c`.`id_pengguna`))  ;

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
  MODIFY `id_calon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tb_daftarvote`
--
ALTER TABLE `tb_daftarvote`
  MODIFY `daftarvote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `tb_vote`
--
ALTER TABLE `tb_vote`
  MODIFY `id_vote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_votekandidat`
--
ALTER TABLE `tb_votekandidat`
  MODIFY `votekandidat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_votepemilih`
--
ALTER TABLE `tb_votepemilih`
  MODIFY `votepemilih_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
