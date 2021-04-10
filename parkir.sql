-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Apr 2021 pada 18.43
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parkir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kendaraan`
--

CREATE TABLE `jenis_kendaraan` (
  `id_jeniskendaraan` int(11) NOT NULL,
  `jenis_kendaraan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_kendaraan`
--

INSERT INTO `jenis_kendaraan` (`id_jeniskendaraan`, `jenis_kendaraan`) VALUES
(1, 'Roda 4'),
(2, 'Roda 2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keluar`
--

CREATE TABLE `keluar` (
  `id_keluar` varchar(11) NOT NULL,
  `no_parkir` varchar(11) NOT NULL,
  `no_polisi` varchar(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `id_pelaratan` varchar(11) NOT NULL,
  `id_lokasi` varchar(11) NOT NULL,
  `retribusi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `keluar`
--

INSERT INTO `keluar` (`id_keluar`, `no_parkir`, `no_polisi`, `tanggal`, `id_pelaratan`, `id_lokasi`, `retribusi`) VALUES
('1', 'PRK000030', 'AS 1349 SD', '2021-03-31 11:21:36', '1', 'A1', 3000),
('2', 'PRK000031', 'CO 1234 GG', '2021-04-03 11:50:27', '1', 'A1', 4000),
('3', 'PRK000032', 'JJ 4214 EL', '2021-04-03 12:02:55', '2', 'B2', 3000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` varchar(11) NOT NULL,
  `id_target` int(11) NOT NULL,
  `id_pelaratan` varchar(11) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `kondisi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `id_target`, `id_pelaratan`, `lokasi`, `kondisi`) VALUES
('A1', 1, '1', 'A1', 'kosong'),
('A2', 1, '1', 'A2', 'kosong'),
('A3', 1, '1', 'A3', 'kosong'),
('A4', 1, '1', 'A4', 'kosong'),
('B1', 1, '2', 'B1', 'kosong'),
('B2', 1, '2', 'B2', 'kosong'),
('B3', 1, '2', 'B3', 'kosong'),
('B4', 1, '2', 'B4', 'kosong');

-- --------------------------------------------------------

--
-- Struktur dari tabel `parkir`
--

CREATE TABLE `parkir` (
  `no_parkir` varchar(11) NOT NULL,
  `no_polisi` varchar(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `tanggal_keluar` datetime NOT NULL,
  `id_pelaratan` varchar(11) NOT NULL,
  `id_lokasi` varchar(11) NOT NULL,
  `retribusi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `parkir`
--

INSERT INTO `parkir` (`no_parkir`, `no_polisi`, `tanggal`, `tanggal_keluar`, `id_pelaratan`, `id_lokasi`, `retribusi`) VALUES
('PRK000030', 'AS 1349 SD', '2021-03-31 11:21:36', '0000-00-00 00:00:00', '1', 'A1', 3000),
('PRK000031', 'CO 1234 GG', '2021-04-03 11:50:27', '0000-00-00 00:00:00', '1', 'A1', 4000),
('PRK000032', 'JJ 4214 EL', '2021-04-03 12:02:55', '0000-00-00 00:00:00', '2', 'B2', 3000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelaratan`
--

CREATE TABLE `pelaratan` (
  `id_pelaratan` varchar(11) NOT NULL,
  `id_target` int(11) NOT NULL,
  `pelaratan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelaratan`
--

INSERT INTO `pelaratan` (`id_pelaratan`, `id_target`, `pelaratan`) VALUES
('1', 1, 'Lantai1'),
('2', 2, 'Lantai2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `target`
--

CREATE TABLE `target` (
  `id_target` int(11) NOT NULL,
  `target` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `target`
--

INSERT INTO `target` (`id_target`, `target`) VALUES
(1, 'Khusus'),
(2, 'Umum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `level`) VALUES
(1, 'Admin', 'admin', 'admin', '4'),
(2, 'Petugas Keluar', 'pkeluar', 'pkeluar', '2'),
(3, 'Petugas Masuk', 'pmasuk', 'pmasuk', '1'),
(4, 'Petugas Ruang', 'pruang', 'pruang', '3');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis_kendaraan`
--
ALTER TABLE `jenis_kendaraan`
  ADD PRIMARY KEY (`id_jeniskendaraan`);

--
-- Indeks untuk tabel `keluar`
--
ALTER TABLE `keluar`
  ADD PRIMARY KEY (`id_keluar`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indeks untuk tabel `parkir`
--
ALTER TABLE `parkir`
  ADD PRIMARY KEY (`no_parkir`);

--
-- Indeks untuk tabel `pelaratan`
--
ALTER TABLE `pelaratan`
  ADD PRIMARY KEY (`id_pelaratan`);

--
-- Indeks untuk tabel `target`
--
ALTER TABLE `target`
  ADD PRIMARY KEY (`id_target`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_kendaraan`
--
ALTER TABLE `jenis_kendaraan`
  MODIFY `id_jeniskendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `target`
--
ALTER TABLE `target`
  MODIFY `id_target` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
