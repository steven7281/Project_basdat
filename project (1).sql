-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table db_decafe.tb_bayar
CREATE TABLE IF NOT EXISTS `tb_bayar` (
  `id_bayar` bigint NOT NULL,
  `nominal_uang` bigint DEFAULT NULL,
  `total_bayar` bigint DEFAULT NULL,
  `waktu_bayar` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_bayar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping structure for table db_decafe.tb_daftar_menu
CREATE TABLE IF NOT EXISTS `tb_daftar_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `foto` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_menu` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `stok` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kategori` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_tb_daftar_menu_tb_kategori_menu` (`kategori`),
  CONSTRAINT `FK_tb_daftar_menu_tb_kategori_menu` FOREIGN KEY (`kategori`) REFERENCES `tb_kategori_menu` (`id_kat_menu`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_decafe.tb_daftar_menu: ~7 rows (approximately)
INSERT INTO `tb_daftar_menu` (`id`, `foto`, `nama_menu`, `keterangan`, `harga`, `stok`, `kategori`) VALUES
	(63, '53859-5.jpg', 'apakek2', 'rrrr', '1000', '34', 9),
	(64, '22577-9.jpg', 'Kopi Pahit', 'Pahit kek bule', '2000', '20', 4),
	(65, '90109-11.jpg', 'Teh', 'anget', '3000', '13', 4),
	(66, '34680-13.jpg', 'kopi', 'manis', '4000', '1', 4),
	(67, '43327-14.jpg', 'Gass', 'erere', '1000', '6', 8),
	(68, '43154-12.jpg', 'apalah1', 'ttttt', '1000', '22', 11),
	(69, '67205-7.jpg', 'SUSU', 'Gacorrrr', '300000', '2', 10);

-- Dumping structure for table db_decafe.tb_kategori_menu
CREATE TABLE IF NOT EXISTS `tb_kategori_menu` (
  `id_kat_menu` int NOT NULL AUTO_INCREMENT,
  `jenis_menu` int DEFAULT NULL,
  `kategori_menu` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_kat_menu`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_decafe.tb_kategori_menu: ~5 rows (approximately)
INSERT INTO `tb_kategori_menu` (`id_kat_menu`, `jenis_menu`, `kategori_menu`) VALUES
	(4, 2, 'kopi'),
	(8, 1, 'Snack'),
	(9, 2, 'nasi dsdsaaaaaaa'),
	(10, 2, 'Jus'),
	(11, 1, 'lontong'),
	(15, 2, 'Alkohol');

-- Dumping structure for table db_decafe.tb_list_order
CREATE TABLE IF NOT EXISTS `tb_list_order` (
  `id_list_order` int NOT NULL AUTO_INCREMENT,
  `menu` int DEFAULT NULL,
  `kode_order` bigint DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `catatan` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_list_order`),
  KEY `menu` (`menu`),
  KEY `order` (`kode_order`) USING BTREE,
  CONSTRAINT `FK_tb_list_order_tb_daftar_menu` FOREIGN KEY (`menu`) REFERENCES `tb_daftar_menu` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_list_order_tb_order` FOREIGN KEY (`kode_order`) REFERENCES `tb_order` (`id_order`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_decafe.tb_list_order: ~13 rows (approximately)
INSERT INTO `tb_list_order` (`id_list_order`, `menu`, `kode_order`, `jumlah`, `catatan`, `status`) VALUES
	(1, 68, 2411071348370, 2, 'werdtt', 2),
	(2, 63, 2411071405990, 2, '', 2),
	(3, 67, 2411071424441, 1, '', 1),
	(4, 64, 2411071405990, 4, '4', 2),
	(5, 69, 2411071405990, 2, 'seger', NULL),
	(6, 69, 2411071348370, 2, 'enak bgt', 1),
	(7, 67, 2411071348370, 3, '3', NULL),
	(10, 65, 2411081507571, 4, 'rerere', NULL),
	(11, 69, 2411081507571, 2, 'BBBB', NULL),
	(12, 65, 2411081803268, 3, 'banyak', NULL),
	(13, 67, 2411081803268, 6, 'errrr', NULL),
	(14, 69, 2411082024256, 5, 'Langsung', NULL),
	(15, 65, 2411082142754, 5, 'pake es', NULL);

-- Dumping structure for table db_decafe.tb_order
CREATE TABLE IF NOT EXISTS `tb_order` (
  `id_order` bigint NOT NULL DEFAULT '0',
  `pelanggan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `meja` int DEFAULT NULL,
  `pelayan` int DEFAULT NULL,
  `waktu_order` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_order`) USING BTREE,
  KEY `pelayan` (`pelayan`),
  CONSTRAINT `FK_tb_order_tb_user` FOREIGN KEY (`pelayan`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;


-- Dumping structure for table db_decafe.tb_user
CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `nohp` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_decafe.tb_user: ~6 rows (approximately)
INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `level`, `nohp`, `alamat`) VALUES
	(1, 'pelayan', 'pelayan@pelayan.com', '5f4dcc3b5aa765d61d8327deb882cf99', 2, '123456789011', 'Jalan Cengkareng '),
	(3, 'kasir', 'kasir@kasir.com', '5f4dcc3b5aa765d61d8327deb882cf99', 3, '123456789011', NULL),
	(4, 'dapur', 'dapur@dapur.com', '5f4dcc3b5aa765d61d8327deb882cf99', 4, '123456789011', ''),
	(47, 'we', 'we@gmail.com', '$2y$10$73SsKAtGddUhLPRX9RPGOOFuU9fc0dLO.tUi717rId4//f/PI7Sqe', 1, '123456789', 'qawsedtfrygtu'),
	(48, 'dipta monyet', 'admin@admin', '827ccb0eea8a706c4c34a16891f84e7b', 1, '123456789011', 'wewewe'),
	(50, 'Jessica', 'jes@jes.com', '5f4dcc3b5aa765d61d8327deb882cf99', 5, '08888221', 'Esgul');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
