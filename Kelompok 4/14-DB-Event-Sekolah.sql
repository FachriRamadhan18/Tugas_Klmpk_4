-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2025 at 05:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `event_sekolah`
--

CREATE TABLE `event_sekolah` (
  `ID_Event` int(11) NOT NULL,
  `Nama_Event` varchar(100) NOT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Lokasi` varchar(100) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `Penyelenggara` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_sekolah`
--

INSERT INTO `event_sekolah` (`ID_Event`, `Nama_Event`, `Deskripsi`, `Lokasi`, `Tanggal`, `Penyelenggara`) VALUES
(1, 'KARAENG', 'KARAENG \"Kreatifitas Aksi Remaja Kepalang Merahan\" adalah sebuah lomba palang merah tingkat Wira & Madya sekota Makassar yang di selenggarakan di SMKN 7 Makassar.', NULL, '2024-11-15', NULL),
(2, 'Pemilihan Ketos', 'Pemilihan ketua osis periode 2025/2026 yang wajib di ikuti oleh seluruh siswa/i sekolah SMKN 7 Makassar.\r\n', NULL, '2025-03-12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `panitia`
--

CREATE TABLE `panitia` (
  `ID_Panitia` int(11) NOT NULL,
  `Nama_Panitia` varchar(100) NOT NULL,
  `Jabatan` varchar(50) DEFAULT NULL,
  `Kontak` varchar(15) DEFAULT NULL,
  `Role` enum('Siswa','Guru') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panitia_event`
--

CREATE TABLE `panitia_event` (
  `ID_Panitia_Event` int(11) NOT NULL,
  `ID_Panitia` int(11) DEFAULT NULL,
  `ID_Event` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran_peserta`
--

CREATE TABLE `pendaftaran_peserta` (
  `ID_Peserta_Event` int(11) NOT NULL,
  `ID_Peserta` int(11) DEFAULT NULL,
  `ID_Event` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pendaftaran_peserta`
--

INSERT INTO `pendaftaran_peserta` (`ID_Peserta_Event`, `ID_Peserta`, `ID_Event`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 1, 1),
(4, 1, 2),
(5, 2, 2),
(8, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `ID_Peserta` int(11) NOT NULL,
  `Nama_Peserta` varchar(100) NOT NULL,
  `Kelas` varchar(50) DEFAULT NULL,
  `Kontak` varchar(15) DEFAULT NULL,
  `Role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`ID_Peserta`, `Nama_Peserta`, `Kelas`, `Kontak`, `Role`) VALUES
(1, 'Fachri', 'XII', '089712345678', ''),
(2, 'Fadhil', 'XII', '081912345678', ''),
(3, 'Nafan', 'XII', '081234567890', '');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `ID_Sponsor` int(11) NOT NULL,
  `ID_Event` int(11) NOT NULL,
  `Nama_Sponsor` varchar(100) NOT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`ID_Sponsor`, `ID_Event`, `Nama_Sponsor`, `no_hp`) VALUES
(1, 2, 'kulkas', '083135219069'),
(2, 2, 'kulkas', '0831352190');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_event`
--

CREATE TABLE `sponsor_event` (
  `ID_Sponsor_Event` int(11) NOT NULL,
  `ID_Sponsor` int(11) DEFAULT NULL,
  `ID_Event` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','peserta') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `role`) VALUES
(1, 'Fachri', 'admin', 'admin123', 'admin'),
(2, 'Raihan', 'peserta', 'peserta123', 'peserta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event_sekolah`
--
ALTER TABLE `event_sekolah`
  ADD PRIMARY KEY (`ID_Event`);

--
-- Indexes for table `panitia`
--
ALTER TABLE `panitia`
  ADD PRIMARY KEY (`ID_Panitia`);

--
-- Indexes for table `panitia_event`
--
ALTER TABLE `panitia_event`
  ADD PRIMARY KEY (`ID_Panitia_Event`),
  ADD KEY `ID_Panitia` (`ID_Panitia`),
  ADD KEY `ID_Event` (`ID_Event`);

--
-- Indexes for table `pendaftaran_peserta`
--
ALTER TABLE `pendaftaran_peserta`
  ADD PRIMARY KEY (`ID_Peserta_Event`),
  ADD KEY `ID_Peserta` (`ID_Peserta`),
  ADD KEY `ID_Event` (`ID_Event`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`ID_Peserta`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`ID_Sponsor`);

--
-- Indexes for table `sponsor_event`
--
ALTER TABLE `sponsor_event`
  ADD PRIMARY KEY (`ID_Sponsor_Event`),
  ADD KEY `ID_Sponsor` (`ID_Sponsor`),
  ADD KEY `ID_Event` (`ID_Event`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event_sekolah`
--
ALTER TABLE `event_sekolah`
  MODIFY `ID_Event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `panitia`
--
ALTER TABLE `panitia`
  MODIFY `ID_Panitia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panitia_event`
--
ALTER TABLE `panitia_event`
  MODIFY `ID_Panitia_Event` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pendaftaran_peserta`
--
ALTER TABLE `pendaftaran_peserta`
  MODIFY `ID_Peserta_Event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `ID_Peserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `ID_Sponsor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sponsor_event`
--
ALTER TABLE `sponsor_event`
  MODIFY `ID_Sponsor_Event` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `panitia_event`
--
ALTER TABLE `panitia_event`
  ADD CONSTRAINT `panitia_event_ibfk_1` FOREIGN KEY (`ID_Panitia`) REFERENCES `panitia` (`ID_Panitia`),
  ADD CONSTRAINT `panitia_event_ibfk_2` FOREIGN KEY (`ID_Event`) REFERENCES `event_sekolah` (`ID_Event`);

--
-- Constraints for table `pendaftaran_peserta`
--
ALTER TABLE `pendaftaran_peserta`
  ADD CONSTRAINT `pendaftaran_peserta_ibfk_1` FOREIGN KEY (`ID_Peserta`) REFERENCES `peserta` (`ID_Peserta`),
  ADD CONSTRAINT `pendaftaran_peserta_ibfk_2` FOREIGN KEY (`ID_Event`) REFERENCES `event_sekolah` (`ID_Event`);

--
-- Constraints for table `sponsor_event`
--
ALTER TABLE `sponsor_event`
  ADD CONSTRAINT `sponsor_event_ibfk_1` FOREIGN KEY (`ID_Sponsor`) REFERENCES `sponsor` (`ID_Sponsor`),
  ADD CONSTRAINT `sponsor_event_ibfk_2` FOREIGN KEY (`ID_Event`) REFERENCES `event_sekolah` (`ID_Event`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
