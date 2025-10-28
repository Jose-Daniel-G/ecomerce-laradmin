-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2025 a las 16:22:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laraecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `receiver` int(11) NOT NULL,
  `receiver_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`receiver_info`)),
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `family_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `family_id`, `created_at`, `updated_at`) VALUES
(1, 'Televisores', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(2, 'Celulares', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(3, 'Computación', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(4, 'Videojuegos', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(5, 'Gaming', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(6, 'Audio', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(7, 'Smart Home y domótica', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(8, 'Fotografía y video', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(9, 'Insumos para impresión', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(10, 'Refrigeración', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(11, 'Cocina', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(12, 'Lavado', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(13, 'Climatización', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(14, 'Limpieza', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(15, 'Electrodomestico', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(16, 'Tendencias y colecciones', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(17, 'Ropa de home por tipo', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(18, 'Accesorios', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(19, 'Ropa interior y pijamas', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(20, 'Calzado hombre', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(21, 'Tendencias y colecciones', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(22, 'Ropa de mujer por tipo', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(23, 'Accesorios', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(24, 'Ropa interior y pijamas', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(25, 'Calzado mujer', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(26, 'Cuidado capilar', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(27, 'Cuidado corporal', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(28, 'Dermocosmética', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(29, 'Electro belleza', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(30, 'Maquillaje', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(31, 'Masaje y spa', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(32, 'Perfumes', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(33, 'Tratamientos faciales', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(34, 'pack regalo', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(35, 'Cuidado y protección adulta', 6, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(36, 'Cuidado y protección femenina', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(37, 'Packs de salud y bienestar', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(38, 'Desayuno', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(39, 'Embutidos y fiambres', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(40, 'Cuidado personal', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(41, 'Abarrotes', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(42, 'Congelados', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(43, 'Cuidado del Bebé', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(44, 'Frutas y verduras', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(45, 'Lácteos', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(46, 'Licores', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(47, 'Limpieza', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(48, 'Panetones', 6, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(49, 'Suplementos', 7, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(50, 'Bicicletas', 7, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(51, 'Maquinas y Fitness', 7, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(52, 'Accesorios', 7, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(53, 'Deporte y aire libre', 7, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(54, 'Mundo deporte', 7, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(55, 'Automotriz', 8, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(56, 'Ferretería', 8, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(57, 'Herramientas eléctricas', 8, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(58, 'Herramientas manuales', 8, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(59, 'Pinturas', 8, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(60, 'Medición y trazado', 8, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(61, 'Baño', 9, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(62, 'Menaje de Cocina', 9, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(63, 'Decohogar', 9, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(64, 'Grill', 9, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(65, 'Menaje de comedor', 9, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(66, 'Organización', 9, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(67, 'Tendencias y colecciones', 10, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(68, 'Ropa de niño por tipo', 10, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(69, 'Accesorios', 10, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(70, 'Ropa interior y pijamas', 10, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(71, 'Calzado niño', 10, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(72, 'Ropa de niña por tipo', 10, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(73, 'Calzado niña', 10, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(74, 'Alimento para mascotas', 11, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(75, 'Accesorios para mascotas', 11, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(76, 'Juguetes para mascotas', 11, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(77, 'Cuidado de mascotas', 11, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(78, 'Higiene de mascotas', 11, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(79, 'Transporte de mascotas', 11, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(80, 'Colchones', 12, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(81, 'Ropa de cama', 12, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(82, 'Muebles', 12, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(83, 'Juguetes', 13, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(84, 'Bebés', 13, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(85, 'Cuidado de la salud', 14, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(86, 'Cuidado personal', 14, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(87, 'Cuidado sexual', 14, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(88, 'Equipos médicos', 14, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(89, 'Medicamentos', 14, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(90, 'Suplementos', 14, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(91, 'Accesorios', 15, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(92, 'Llantas', 15, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(93, 'Repuestos', 15, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(94, 'Cocina', 16, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(95, 'Comedor', 16, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(96, 'Dormitorio', 16, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(97, 'Oficina', 16, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(98, 'Sala', 16, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(99, 'Terraza y jardín', 16, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(100, 'Libros', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(101, 'Libros digitales', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(102, 'Libros infantiles', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(103, 'Libros juveniles', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(104, 'Libros de texto', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(105, 'Libros de cocina', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(106, 'Libros de autoayuda', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(107, 'Libros de ficción', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(108, 'Libros de no ficción', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(109, 'Libros de historia', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(110, 'Libros de arte', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(111, 'Libros de ciencia', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(112, 'Libros de medicina', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(113, 'Libros de psicología', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(114, 'Libros de economía', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(115, 'Libros de negocios', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(116, 'Libros de marketing', 17, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(117, 'Libros de finanzas', 17, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(118, 'Libros de derecho', 17, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(119, 'Cuidado de la salud', 18, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(120, 'Cuidado personal', 18, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(121, 'Cuidado sexual', 18, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(122, 'Equipos médicos', 18, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(123, 'Medicamentos', 18, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(124, 'Suplementos', 18, '2025-10-19 21:27:40', '2025-10-19 21:27:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `covers`
--

CREATE TABLE `covers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `covers`
--

INSERT INTO `covers` (`id`, `image_path`, `title`, `start_at`, `end_at`, `is_active`, `order`, `created_at`, `updated_at`) VALUES
(1, 'covers/TrqzYg7RovbifClKWIDN9mMFFSa14jlxFxR82kWu.png', 'Appliance', '2025-10-14 00:00:00', NULL, 1, 1, '2025-10-14 23:15:04', '2025-10-21 02:18:29'),
(2, 'covers/PfEYLYJaeXmcjZNIaWAtChG5avk6wtaBOkSQ5RwR.png', 'Tv', '2025-10-14 00:00:00', NULL, 1, 2, '2025-10-14 23:16:28', '2025-10-14 23:16:28'),
(3, 'covers/ndFvhGHWHxBFW6RXQkqVyIltQGIX8K28dDJosY60.png', 'Laptops', '2025-10-14 00:00:00', NULL, 1, 3, '2025-10-14 23:17:16', '2025-10-14 23:17:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `families`
--

CREATE TABLE `families` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `families`
--

INSERT INTO `families` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tecnologia', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(2, 'Electrohogar', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(3, 'Moda Hombre', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(4, 'Moda Mujer', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(5, 'Belleza', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(6, 'Supermercado', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(7, 'Deportes', '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(8, 'Mejoramiento del Hogar', '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(9, 'Hogar', '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(10, 'Moda Infantil', '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(11, 'Mascotas', '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(12, 'Dormitorio', '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(13, 'Juguetería y Bebés', '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(14, 'Salud y Bienestar', '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(15, 'Automotriz', '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(16, 'Muebles', '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(17, 'Librería', '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(18, 'Farmacia', '2025-10-19 21:27:40', '2025-10-19 21:27:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `features`
--

INSERT INTO `features` (`id`, `value`, `description`, `option_id`, `created_at`, `updated_at`) VALUES
(1, 's', 'small', 1, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(2, 'm', 'medium', 1, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(3, 'l', 'large', 1, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(4, 'xl', 'extra large', 1, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(5, '#000000', 'black', 2, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(6, '#ffffff', 'white', 2, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(7, '#ff0000', 'red', 2, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(8, '#00ff00', 'green', 2, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(9, '#0000ff', 'blue', 2, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(10, 'f', 'femenino', 3, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(11, 'm', 'masculino', 3, '2025-10-19 21:27:40', '2025-10-19 21:27:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `feature_variant`
--

CREATE TABLE `feature_variant` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `feature_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_10_04_194845_add_two_factor_columns_to_users_table', 1),
(6, '2025_10_04_201023_create_families_table', 1),
(7, '2025_10_04_201059_create_categories_table', 1),
(8, '2025_10_04_201113_create_subcategories_table', 1),
(9, '2025_10_04_201140_create_products_table', 1),
(10, '2025_10_04_201200_create_variants_table', 1),
(11, '2025_10_04_201217_create_options_table', 1),
(12, '2025_10_04_201235_create_features_table', 1),
(13, '2025_10_04_201319_create_option_product_table', 1),
(14, '2025_10_04_201338_create_feature_variant_table', 1),
(15, '2025_10_04_221206_create_permission_tables', 1),
(16, '2025_10_07_025803_create_covers_table', 1),
(17, '2025_10_07_202224_create_drivers_table', 1),
(18, '2025_10_10_203657_create_orders_table', 1),
(19, '2025_10_10_231842_create_addresses_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `options`
--

INSERT INTO `options` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Talla', 1, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(2, 'Color', 2, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(3, 'Sexo', 3, '2025-10-19 21:27:40', '2025-10-19 21:27:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `option_product`
--

CREATE TABLE `option_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`features`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pdf_path` varchar(255) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`content`)),
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`address`)),
  `payment_method` int(11) NOT NULL DEFAULT 1,
  `payment_id` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `status` double(8,2) NOT NULL DEFAULT 1.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'access dashboard', 'web', '2025-10-19 21:27:37', '2025-10-19 21:27:37'),
(2, 'manage options', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(3, 'manage families', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(4, 'manage categories', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(5, 'manage subcategories', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(6, 'manage products', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(7, 'manage covers', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(8, 'manage drivers', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(9, 'manage orders', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(10, 'manage shipments', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `description`, `image_path`, `price`, `stock`, `subcategory_id`, `created_at`, `updated_at`) VALUES
(1, '299309', 'sunt non officiis', 'Magni quis excepturi nam voluptas accusantium. Quibusdam quas unde voluptatem ducimus rerum. Sed facere explicabo ab exercitationem ex dolore quia.', 'https://picsum.photos/seed/b8c7bcce-74ba-36f5-97c1-29f6da164954/640/480', 115.42, 0, 486, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(2, '709996', 'vitae minima aut', 'Necessitatibus blanditiis illum nesciunt. Molestiae vel ea est ea ut. Voluptatem voluptates voluptas et facere. Corrupti dolore esse repellendus vel sapiente.', 'https://picsum.photos/seed/bdcc0718-1ae5-302d-a7e7-4bbf7e120ef5/640/480', 607.10, 0, 393, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(3, '875313', 'placeat expedita provident', 'Rerum aperiam sunt officia accusantium praesentium ut. Culpa porro quod eum. Voluptatibus reprehenderit eaque id debitis laborum.', 'https://picsum.photos/seed/8502504e-a8dc-376d-b5f5-09b2238c9c2b/640/480', 111.11, 0, 153, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(4, '740282', 'earum molestiae tenetur', 'Et ratione consequuntur quis dolorem tempora et. Corporis dicta eaque laudantium at sit.', 'https://picsum.photos/seed/5b3f15ef-b5a5-33b5-abc0-37a39657f202/640/480', 508.99, 0, 280, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(5, '319804', 'accusamus et cum', 'Laboriosam est consequatur suscipit non ex omnis suscipit labore. Et culpa corrupti quia consequatur. Modi voluptatem ad sequi dolorum. Molestiae blanditiis quam aut ab iusto.', 'https://picsum.photos/seed/1569fc04-b7d3-38f7-a406-69e933eab6fc/640/480', 259.39, 0, 168, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(6, '447316', 'magnam doloremque iste', 'Ab labore vel ipsam cum. Enim itaque explicabo nisi odio architecto. Quo repellendus qui accusantium sint id culpa. Omnis facilis nihil qui ut.', 'https://picsum.photos/seed/57a59854-c4d1-388e-9225-4932b3ac1916/640/480', 508.05, 0, 363, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(7, '558790', 'qui ad delectus', 'Culpa eos ex eveniet odit est blanditiis. In ratione amet est. Quis voluptas voluptatem voluptatem doloremque ex non necessitatibus et.', 'https://picsum.photos/seed/70fa5032-da3e-3434-9c09-8518c22f466f/640/480', 372.69, 0, 605, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(8, '949261', 'consequatur aut et', 'Perspiciatis quis impedit blanditiis aut. Qui a voluptas est corrupti sed. Molestiae voluptatum voluptas nihil quia eveniet nostrum aut.', 'https://picsum.photos/seed/4e941717-4c86-350c-b767-7f1607379486/640/480', 156.10, 0, 241, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(9, '727658', 'deserunt aut quo', 'Eum placeat quidem non enim impedit blanditiis architecto. Sed amet id nihil est. Est ea quisquam rem est ut nemo et.', 'https://picsum.photos/seed/2bd4db05-d408-3893-8189-ae40d5998bc0/640/480', 617.83, 0, 159, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(10, '920094', 'aut dolor dolor', 'Aut sunt maiores officiis numquam voluptatem quo et. Et est aliquid quod nobis vero quia. Dicta laudantium sit fuga qui dolor.', 'https://picsum.photos/seed/cbd09ef7-6522-3299-9814-ac33241bac48/640/480', 429.04, 0, 110, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(11, '840134', 'dolorem saepe ut', 'Repellat sunt voluptatibus quidem dolorem vitae. Enim libero tempora ea a.', 'https://picsum.photos/seed/1c36416b-fb72-34ef-8111-12b162beb3c7/640/480', 590.81, 0, 189, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(12, '195296', 'sapiente id voluptate', 'Ut voluptas pariatur hic atque quo eos. Tempore optio maiores delectus tempore dolor blanditiis et id. Blanditiis amet harum non similique magni eum omnis.', 'https://picsum.photos/seed/5bcca820-0fa4-3a8d-a60f-58d22dbc4453/640/480', 558.11, 0, 334, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(13, '128355', 'qui incidunt recusandae', 'Vel assumenda sit deleniti. Ex sint omnis nulla nobis et. Fugiat eligendi deleniti numquam et esse nihil omnis. Quas et et non laboriosam quaerat quasi. Aspernatur amet dolores est.', 'https://picsum.photos/seed/effe4a38-83bd-3e5e-86f6-bd59d6cf966e/640/480', 560.78, 0, 338, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(14, '282771', 'illo debitis voluptas', 'Aliquam cum vero sapiente cum nam illum debitis aperiam. Eaque soluta architecto quisquam nostrum nesciunt quia quia. Recusandae maiores provident ea doloribus qui accusamus maiores.', 'https://picsum.photos/seed/b71224b9-1432-350e-84f7-2dd794c38e67/640/480', 779.02, 0, 246, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(15, '481821', 'non aperiam voluptatem', 'Accusamus qui non sint sunt sed. Suscipit libero repellat exercitationem quia expedita. Non tempora aut tempora in corrupti nihil.', 'https://picsum.photos/seed/78d4076d-3af5-3796-a48a-3bdeb7bb5d7d/640/480', 81.96, 0, 5, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(16, '633258', 'ullam qui expedita', 'Aut et eligendi non id. Recusandae ducimus aperiam nemo tempore adipisci nulla. Ducimus debitis dignissimos nulla provident est doloribus.', 'https://picsum.photos/seed/3124feb6-85cd-3685-882f-88a657939485/640/480', 362.77, 0, 52, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(17, '358409', 'officia rerum adipisci', 'In voluptas saepe impedit perferendis quod tenetur. Eos placeat ad dolor ad magni cupiditate libero. Voluptatem voluptas aspernatur architecto odio dolores incidunt molestias.', 'https://picsum.photos/seed/0e24a4ea-2824-3a07-888f-52594e6d4ba7/640/480', 644.56, 0, 604, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(18, '811768', 'inventore necessitatibus cupiditate', 'Illo id pariatur optio et mollitia perferendis rem officiis. Est quis omnis eos et. Non et harum recusandae beatae est.', 'https://picsum.photos/seed/eedebe86-68fe-3845-8ed0-fde6706de01b/640/480', 158.12, 0, 242, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(19, '349652', 'qui vitae distinctio', 'Veritatis voluptatem sint ipsa consequatur sint voluptatem. Aperiam impedit sequi eum repellat aut quisquam. Quasi et provident sunt perferendis et. Est harum voluptate atque ut eum sunt laudantium.', 'https://picsum.photos/seed/a0008f6e-ea47-315f-98af-60d1544ee042/640/480', 115.12, 0, 241, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(20, '318314', 'natus cupiditate velit', 'Enim veniam commodi non dolorem. Fugiat culpa ipsam perspiciatis rerum commodi. Debitis sunt ipsam omnis unde. Earum quo recusandae quasi porro excepturi et vel.', 'https://picsum.photos/seed/8dbdc4b4-2be2-3a78-8309-3bea77de8fd1/640/480', 960.33, 0, 605, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(21, '873790', 'ea explicabo quod', 'Voluptatum veritatis corporis quia eum aut esse cupiditate est. Sunt eius earum ut voluptas. Ut odit et quibusdam quis adipisci. Soluta beatae nulla quia accusantium repellat. Est quia ad fugiat.', 'https://picsum.photos/seed/837400ce-8a5c-3597-9374-74dd48d3b1d4/640/480', 495.03, 0, 435, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(22, '391321', 'non dolor nihil', 'Tempore et repudiandae quia. Repudiandae neque consectetur iusto temporibus. Distinctio rerum deserunt pariatur quam velit aut aut.', 'https://picsum.photos/seed/79f8c623-8294-3a2d-8f1a-e05a9141975d/640/480', 623.69, 0, 228, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(23, '795055', 'praesentium in ut', 'Sit id placeat pariatur explicabo officia. Sunt neque in nisi fugiat voluptatem. Ad atque perspiciatis accusamus est omnis.', 'https://picsum.photos/seed/189b9d18-9a86-314a-8acc-025b4d1f4230/640/480', 168.54, 0, 198, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(24, '264700', 'cumque temporibus explicabo', 'Laborum ducimus exercitationem velit corrupti. Tempora qui aspernatur dolorem. Accusamus inventore aliquam optio unde aut id. Dolorem ex sunt libero dolorem.', 'https://picsum.photos/seed/7f893b9c-a4da-305d-9b8c-def1eb16d2ad/640/480', 435.06, 0, 185, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(25, '872350', 'eos provident aut', 'Culpa quis explicabo fugit aut. Sit ut ea placeat est et enim. Eveniet quod quia id et. Doloribus aspernatur blanditiis laboriosam doloribus.', 'https://picsum.photos/seed/b60f0164-f8c4-3413-87bf-26997b72f16d/640/480', 955.36, 0, 370, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(26, '693095', 'fugit autem quisquam', 'Deleniti quo libero id totam maiores accusantium alias blanditiis. Laboriosam quod expedita dolore cupiditate. Nostrum iste dignissimos quis omnis voluptatem. Hic totam quod debitis facilis.', 'https://picsum.photos/seed/d46293ac-ae98-3103-b643-04db785fbc4c/640/480', 584.13, 0, 460, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(27, '517361', 'molestiae ex commodi', 'Repellat necessitatibus sed placeat sit inventore quasi cupiditate. Quisquam rerum exercitationem magnam quod pariatur incidunt tempore et. Eveniet beatae sed ducimus.', 'https://picsum.photos/seed/90cc2686-6346-3d4b-ad70-7bce2455178d/640/480', 451.94, 0, 44, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(28, '349845', 'ut est sunt', 'Illum reiciendis minus omnis. Eligendi voluptatibus architecto assumenda nihil. Quo quos quis quae dolorum impedit delectus eius.', 'https://picsum.photos/seed/ce385734-4356-3011-92a2-c9126835ea1d/640/480', 717.90, 0, 620, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(29, '665236', 'vitae mollitia commodi', 'Et ipsum eum voluptates dolor. Quibusdam iste quia sequi exercitationem et asperiores. Officiis voluptates repudiandae inventore qui.', 'https://picsum.photos/seed/750ab15c-1255-352d-ac39-d0f8acd54e90/640/480', 319.66, 0, 123, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(30, '272319', 'in autem sit', 'Sint dolorem aliquam excepturi dolore blanditiis sequi dolorem voluptatem. Sed magnam libero tenetur ut debitis tempore laudantium. Delectus quaerat voluptatum a maiores numquam ut omnis.', 'https://picsum.photos/seed/b54aa402-31a2-3b40-9e0e-3d786ed650cb/640/480', 790.67, 0, 31, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(31, '972893', 'autem molestias voluptate', 'Consequatur nihil sed eius dolores est autem sint in. Non eos unde officia facere. Voluptate et eaque qui sit et nobis ut provident. Nesciunt qui expedita odit explicabo consequatur laborum quam.', 'https://picsum.photos/seed/1d04f05f-929d-302d-a4c7-812c6aa54282/640/480', 850.43, 0, 3, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(32, '762981', 'expedita asperiores id', 'Sit totam nesciunt excepturi vitae architecto officiis autem. Iusto enim et fuga voluptas inventore qui ipsum.', 'https://picsum.photos/seed/ca3eaebf-1b96-3749-bfe8-9d9a481fbe5a/640/480', 221.55, 0, 576, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(33, '346961', 'rem harum fugiat', 'Dolor et ipsa quibusdam labore ullam voluptas. Animi qui non qui itaque atque rerum. Doloribus et sapiente omnis.', 'https://picsum.photos/seed/e7dcb389-fab7-32ae-9f57-6e219eb75d59/640/480', 337.36, 0, 428, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(34, '444519', 'nam porro cumque', 'Ad voluptatum ad tenetur amet consequatur. Sed molestias et inventore harum possimus temporibus. Veritatis ab a vero.', 'https://picsum.photos/seed/66eba988-b174-37f1-bbc2-d9534bb1baee/640/480', 782.11, 0, 415, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(35, '691739', 'non voluptas a', 'Repudiandae enim adipisci laboriosam aut velit. Distinctio dolores veritatis vitae rerum dolores illo. Eos consequatur aut vero natus aliquam molestiae.', 'https://picsum.photos/seed/56972b2c-b47b-37e2-ab28-39f1b219e5d5/640/480', 549.68, 0, 211, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(36, '268294', 'dignissimos earum quo', 'Est quis voluptatem quo nihil ducimus nisi corrupti. Et animi nemo soluta dolorem error. Quia est architecto quo.', 'https://picsum.photos/seed/91883ce8-1a96-35f9-b2f9-71a0b387d90e/640/480', 373.69, 0, 230, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(37, '552275', 'et quia mollitia', 'Laudantium aut similique enim. Qui sapiente quis vel possimus ipsam non aut. Corporis ratione id omnis ex tenetur nostrum.', 'https://picsum.photos/seed/6bd4c4c1-4283-36d4-a4d0-79365301c7ca/640/480', 96.95, 0, 381, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(38, '334133', 'sit quae enim', 'Assumenda natus asperiores doloribus fugit ipsa aperiam. In iusto error voluptatibus eius quod dolor animi. Illo voluptas iste qui enim.', 'https://picsum.photos/seed/3bf40542-05c4-31e9-889c-639445b0699e/640/480', 319.20, 0, 459, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(39, '315315', 'velit ea reiciendis', 'Nesciunt ut ut ducimus eius sit deserunt. Voluptatem illum rerum doloremque vero pariatur voluptate.', 'https://picsum.photos/seed/03ab629a-e21c-3c51-9d08-d6b4003cfe41/640/480', 352.24, 0, 245, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(40, '117812', 'aut in perspiciatis', 'Asperiores nihil doloribus doloribus quam ab autem. Et deleniti doloribus iure sequi minus. Deleniti perferendis necessitatibus inventore ut iusto et.', 'https://picsum.photos/seed/63c9cd67-bf8f-3ef7-abed-1c67c19dacdc/640/480', 205.50, 0, 472, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(41, '663430', 'sit suscipit cupiditate', 'Quo qui quae fugit ea facilis aut ratione facere. Dolorem rerum repudiandae illum autem accusantium quia quidem. Omnis aut incidunt et maiores assumenda eos est.', 'https://picsum.photos/seed/e6e1cdb1-ba43-32ec-b788-992185877dd2/640/480', 900.55, 0, 118, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(42, '805120', 'repellat dolores soluta', 'Sit ut sint harum quaerat harum reiciendis delectus quaerat. Quia a quia aspernatur. Qui nulla cumque maiores aperiam incidunt mollitia eos. Perspiciatis laborum et est qui fugit cum.', 'https://picsum.photos/seed/8bab781d-9deb-32f0-a6cd-47742d7ee83f/640/480', 537.03, 0, 280, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(43, '610355', 'error et tenetur', 'Odit earum culpa quos rerum necessitatibus. Corporis tenetur aut odio dolorem enim fugit expedita. Nisi error quia quae voluptatum nisi. Magnam at corporis sed accusamus fuga sit.', 'https://picsum.photos/seed/16d52cfb-264c-3c16-a000-36b5c4e8e3c7/640/480', 116.49, 0, 623, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(44, '320809', 'aut repellat esse', 'Esse facilis possimus eum quis sunt reprehenderit minus omnis. Libero qui exercitationem fugit omnis eos. Iste nostrum hic est voluptatibus et. Cum ullam et officia eos itaque alias consequuntur.', 'https://picsum.photos/seed/dc3236b9-ff66-3e0d-a79d-d22ce22d9461/640/480', 633.68, 0, 562, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(45, '817339', 'cum consequatur qui', 'Architecto laudantium est ab dignissimos. Ipsam nam nisi nesciunt nulla. Et ut illum quasi mollitia voluptates voluptates iusto minima.', 'https://picsum.photos/seed/245a0223-3960-3e52-b4b5-d02413c03c97/640/480', 878.62, 0, 142, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(46, '235801', 'labore dolore quia', 'Laudantium voluptatem eligendi molestias aliquid eveniet asperiores. Porro quia dolor explicabo aut fugiat incidunt. Distinctio qui similique dolorem doloribus eius delectus est iusto.', 'https://picsum.photos/seed/1012c59c-29a8-3fdf-9d5d-df741c88e149/640/480', 476.88, 0, 174, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(47, '520781', 'non provident aperiam', 'Ullam voluptatem nihil sit commodi. Quibusdam libero tempora inventore quos et non fuga. Aut vel aperiam et sint occaecati inventore nihil ipsam.', 'https://picsum.photos/seed/1416d622-dee8-3fbc-af45-3c7632c802fc/640/480', 252.10, 0, 352, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(48, '903433', 'illo porro necessitatibus', 'Autem voluptatum dicta tempora voluptas. Repellat excepturi iusto quasi inventore architecto. Quaerat aspernatur sunt architecto in dolorem eum autem iusto.', 'https://picsum.photos/seed/438701f3-7de2-3761-a522-1b1e493f3681/640/480', 849.47, 0, 122, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(49, '557358', 'ut sapiente sint', 'Quo ut eum doloremque quia vitae explicabo sit voluptate. Et itaque rerum accusantium laborum nobis. Ut id est in est alias numquam pariatur minus.', 'https://picsum.photos/seed/ba31e96a-2cd7-3777-86b8-aeba3ce3877c/640/480', 886.36, 0, 107, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(50, '583044', 'quisquam corporis consequatur', 'Dolor repudiandae placeat inventore sapiente enim rerum perferendis. Magnam et sed similique qui facere quo dolor repellat.', 'https://picsum.photos/seed/646c844d-fb78-3f55-b8f1-3439a1b1bd2f/640/480', 766.94, 0, 122, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(51, '829090', 'sunt culpa qui', 'Est modi iure suscipit doloribus. Delectus et pariatur in. Est asperiores qui deserunt soluta.', 'https://picsum.photos/seed/f888327a-8f30-386a-b762-93eccd02f852/640/480', 678.04, 0, 154, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(52, '998378', 'et minus ut', 'Qui doloribus sed autem et id. Praesentium provident dolores facilis. Qui quidem distinctio qui officia amet enim eos. Ratione nihil accusamus ea aut.', 'https://picsum.photos/seed/09e75ad1-3d03-3dd2-8d8e-e0c3b673afc5/640/480', 237.62, 0, 180, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(53, '298462', 'dolor nisi ullam', 'Quia ipsum provident quae similique id illo reiciendis. Eius ea odit libero reiciendis. Quibusdam voluptatem magnam omnis possimus ea cumque. Autem quia dolorem cupiditate nihil est dolore.', 'https://picsum.photos/seed/2950757c-b855-3326-880a-c67419fabc99/640/480', 152.27, 0, 427, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(54, '194264', 'quae similique aliquam', 'Doloribus incidunt laborum aut. Voluptates voluptas vero aperiam veritatis vitae vero. In aliquid ex quis sed exercitationem id totam quo. Maiores consequatur eaque quos non reprehenderit expedita.', 'https://picsum.photos/seed/c55a6e93-b14c-370b-bf5d-b53d9b89984b/640/480', 893.38, 0, 628, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(55, '874933', 'quidem dolor fuga', 'Eligendi quod consequatur quidem et. Aut laborum temporibus iste. Accusamus consequatur cupiditate nulla maxime sit.', 'https://picsum.photos/seed/4cd0c819-84a8-397e-ac94-f23fc91a960b/640/480', 520.55, 0, 382, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(56, '362878', 'praesentium a soluta', 'Aut enim repellendus ut modi facere adipisci ut. Suscipit sunt qui sint illum cupiditate quos. Dolores est minima officia aut. Ducimus nihil minus magni nulla molestiae ea eum.', 'https://picsum.photos/seed/64e3f7da-6116-38b8-8b27-798f034aaf46/640/480', 106.92, 0, 506, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(57, '419748', 'iste et qui', 'Id totam unde quam optio omnis. Reiciendis quam voluptatem quia unde voluptas magnam. Eveniet at eum deserunt. Ad molestias ut ipsa iusto aut.', 'https://picsum.photos/seed/f9fc98bb-9164-35fe-b143-b57040bc7216/640/480', 524.57, 0, 12, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(58, '350204', 'adipisci numquam totam', 'Qui dolorem et sed facere vero. Sapiente accusamus minima ad odit. Eius consequatur rerum a omnis omnis nemo culpa. Nihil atque omnis aut velit aspernatur deleniti.', 'https://picsum.photos/seed/6328e5ee-d229-3217-b275-1103ee6df9cc/640/480', 204.16, 0, 519, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(59, '407638', 'amet sed autem', 'Rerum sit corrupti ut neque assumenda voluptates accusantium. Eos iure autem iure adipisci sunt praesentium voluptatem sit.', 'https://picsum.photos/seed/9ec3a26a-8f11-3d92-b85d-a6913b3fd41e/640/480', 102.34, 0, 102, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(60, '315965', 'pariatur autem quibusdam', 'Numquam consequatur adipisci voluptatem exercitationem ducimus voluptatum quaerat quia. Eos aut praesentium assumenda facere modi molestias perspiciatis. Unde architecto odit rerum quaerat quo.', 'https://picsum.photos/seed/74f8334a-5250-3b36-b7cb-149d2bb53c3d/640/480', 453.29, 0, 120, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(61, '852087', 'et molestiae rem', 'In deleniti ut dolore cupiditate dolor sapiente sunt. Inventore deserunt est beatae soluta et sed consequatur. Cumque laudantium praesentium veniam saepe. Quasi voluptatibus quaerat quasi autem aut.', 'https://picsum.photos/seed/b66f37f1-bf86-3042-87f8-373324187f37/640/480', 849.86, 0, 29, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(62, '455728', 'provident hic a', 'Dolor id sit delectus cumque quisquam reprehenderit beatae. Atque nihil placeat itaque aspernatur omnis dolorem. Quis quia aliquid ut harum omnis ab ratione sit.', 'https://picsum.photos/seed/e5a4a0dd-9437-3064-b850-fc0cfa8e3737/640/480', 468.01, 0, 41, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(63, '441108', 'architecto voluptates accusamus', 'Repudiandae quis quae culpa doloribus. In accusantium error deserunt excepturi sit minus illo itaque. Sed aut nihil est dignissimos. Ipsum perferendis ipsa vero laboriosam quia.', 'https://picsum.photos/seed/c84cb958-067b-3a1f-8ad3-e6cc73176507/640/480', 719.12, 0, 159, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(64, '798007', 'aliquid aspernatur reprehenderit', 'Illum et aut illo quo veritatis accusamus et. Dolor autem et repellat iste et. Repellendus possimus cumque aut sit quod et et. Quia sunt ut libero vel harum.', 'https://picsum.photos/seed/31013780-8233-37c9-b18d-13ebe5597769/640/480', 245.68, 0, 155, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(65, '965000', 'dolorem est nam', 'In neque officiis ut velit accusantium dolorem. Enim quas adipisci culpa earum consequatur dolor iure. Facilis a voluptatem dolor voluptas. Inventore expedita sed maxime.', 'https://picsum.photos/seed/ddc6bc39-b848-383b-ab01-170ff751b822/640/480', 554.94, 0, 307, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(66, '547713', 'mollitia aperiam sunt', 'Et sunt aut voluptatem. Et repudiandae qui sint aut voluptatem facilis et sit. Possimus porro eos temporibus. Maxime omnis dignissimos nobis rem fugit quam.', 'https://picsum.photos/seed/c1ada428-1880-3e5d-bfa0-ee039961db73/640/480', 388.62, 0, 49, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(67, '625224', 'mollitia qui ut', 'Qui qui tempore iusto. Dolore fugiat asperiores voluptates blanditiis et commodi. Odio voluptas quo iste. Est reprehenderit in deserunt eius.', 'https://picsum.photos/seed/713c4682-57c3-39d7-b007-c4a788aacb23/640/480', 337.78, 0, 66, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(68, '511872', 'cum sunt aut', 'Iste vitae sit consequuntur ab repudiandae facilis. Id sed quia eveniet quis eveniet. Occaecati earum a ipsum ut corrupti odio quia maxime. Ea labore fugit aliquid rerum in accusantium eius ut.', 'https://picsum.photos/seed/eaef3ce9-dd46-3b68-84b6-bb3f3b366db4/640/480', 327.86, 0, 211, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(69, '636094', 'quo ab harum', 'Quasi error sed sint ut. Eum repudiandae architecto voluptatem sapiente incidunt eum veniam. Necessitatibus et eum ab ut esse sit. Sit et suscipit ut ad.', 'https://picsum.photos/seed/22cc0815-2b8d-33fa-a865-699a2cc0b16d/640/480', 908.28, 0, 435, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(70, '741809', 'repellendus error sed', 'Nesciunt aut neque optio et libero sit et. Nam consequatur dolorem numquam et ad labore. Sit ut est voluptas exercitationem tempore commodi magni sunt.', 'https://picsum.photos/seed/27d76609-aca4-3658-a272-4fba4afc27cc/640/480', 520.40, 0, 73, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(71, '765528', 'possimus et harum', 'Quos enim voluptatem nam ab dolores et. Placeat ea voluptates omnis praesentium laboriosam. Omnis cum ducimus aperiam dolores voluptatem.', 'https://picsum.photos/seed/ad4987d7-02e8-35f3-ba23-ad6bd9d8048b/640/480', 661.89, 0, 517, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(72, '775460', 'rem qui dignissimos', 'Officia amet sit voluptatem veniam iste nisi. Voluptatem labore distinctio officiis aperiam aut. Consectetur vel ad corrupti consequatur. Nisi libero eaque sed impedit aliquam.', 'https://picsum.photos/seed/3c7c66b1-1d29-3f1a-8245-d711849edd81/640/480', 600.03, 0, 345, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(73, '538236', 'hic dolor consequuntur', 'Eaque facilis ut itaque. Delectus et ut expedita expedita doloribus enim ipsa blanditiis. Qui eos at et fugit.', 'https://picsum.photos/seed/33417391-7b65-3246-a047-ad927e6d7393/640/480', 804.67, 0, 584, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(74, '325186', 'accusamus eveniet eveniet', 'Quia eius voluptatem et non ex. Modi suscipit rem aut suscipit illo rerum. Est nam dignissimos qui voluptatem quaerat neque. Sint quo magni repellendus sit et fugiat omnis.', 'https://picsum.photos/seed/16a3637a-7970-3c12-9d76-fa35cb50c928/640/480', 466.71, 0, 510, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(75, '988900', 'sed est aut', 'Dolorum inventore nostrum dolor maxime. Quos vero iste aut quam ex enim nesciunt. Accusamus dolor quis nihil unde nisi sint. Perspiciatis qui et officia.', 'https://picsum.photos/seed/af1c3ee9-a4ed-3372-bd3d-29bf77f4be73/640/480', 190.91, 0, 2, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(76, '769543', 'doloribus autem impedit', 'Ipsa ipsa ut accusamus qui. Nostrum consequatur possimus fugiat temporibus natus. Qui dicta beatae omnis inventore possimus tempora. Culpa eum et dolorem perspiciatis.', 'https://picsum.photos/seed/e30f2ac3-081c-30bf-8183-27ac0a4c957f/640/480', 210.58, 0, 254, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(77, '969411', 'mollitia suscipit temporibus', 'Delectus voluptas tenetur dolores et laborum fugit dolor. Qui minus qui non mollitia tempora. Fuga delectus dignissimos quo est nobis atque. Ad aliquid asperiores dicta nisi eum.', 'https://picsum.photos/seed/021dfbba-d1ad-330c-a850-e6f70ecd3b4b/640/480', 97.02, 0, 458, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(78, '871356', 'atque cupiditate veritatis', 'Mollitia maxime odit voluptatem harum neque voluptatem. Qui iste vero et unde. Voluptatem voluptatem at recusandae doloremque. Corrupti distinctio quam adipisci quae quia maiores.', 'https://picsum.photos/seed/2b5d4b89-04a1-39d4-955c-b0d5616ac07e/640/480', 331.63, 0, 376, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(79, '486191', 'et eaque eaque', 'Et iste rem quisquam quo id. Velit quis dolores quidem deleniti eum et ab. Impedit dolor est doloribus aut aliquid omnis.', 'https://picsum.photos/seed/3f169fc8-bac6-3647-bfa9-773bc579c441/640/480', 79.75, 0, 323, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(80, '786294', 'beatae dolore assumenda', 'Eligendi in similique asperiores eius. Molestiae possimus et consequatur voluptatem at. Suscipit velit molestiae cum voluptas ad autem. Perferendis est id voluptates minus ea.', 'https://picsum.photos/seed/ac4ac1f6-96f1-3502-8366-22758b6969f0/640/480', 902.43, 0, 196, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(81, '752511', 'autem modi ipsa', 'Amet illo ullam tempore ipsam. Asperiores reiciendis iure itaque cumque veniam. Et illo ab odit ipsam temporibus. Modi modi reiciendis porro deleniti inventore at voluptatem.', 'https://picsum.photos/seed/83c275ae-10d6-3c00-af10-5a7d0b97ce0e/640/480', 557.41, 0, 353, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(82, '917237', 'nobis quisquam voluptatum', 'Consequatur officia corporis quae magni maiores. Aspernatur fugit non et. Quia cupiditate quia et quia qui. Quae consectetur molestiae beatae incidunt vitae sint.', 'https://picsum.photos/seed/2fd8f9b0-4734-37fc-9541-deb3854626dd/640/480', 896.81, 0, 307, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(83, '889713', 'dolorum voluptatem ut', 'Nulla aspernatur dolor qui exercitationem est. Nihil consectetur aspernatur veniam non corporis sunt sit. Omnis asperiores blanditiis ut dolorem. Dolor reiciendis corporis sunt ipsum voluptatem.', 'https://picsum.photos/seed/f341d8e8-1654-397c-af0e-f3477863f332/640/480', 407.61, 0, 122, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(84, '103862', 'placeat corporis laudantium', 'Assumenda vitae maxime sed quia eos officia. Et aut nisi inventore. Vel quasi earum et ex molestiae animi quas.', 'https://picsum.photos/seed/db9543cf-6b8b-3ccc-9d1a-b3ea91336f83/640/480', 604.48, 0, 614, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(85, '226924', 'nostrum sapiente et', 'Dolor officia dolores dolore perferendis nesciunt sapiente. Et earum ratione sit consequatur ut numquam corrupti. Enim doloribus ipsam aut voluptate porro impedit eos.', 'https://picsum.photos/seed/5bdd3a82-3ec7-303a-b84c-771cc4d83b67/640/480', 975.11, 0, 317, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(86, '518343', 'sed et quisquam', 'Omnis dolorem veritatis quaerat sequi necessitatibus. Voluptatem maxime est rerum est repellendus. Laudantium qui inventore vel quod voluptatem nihil maxime.', 'https://picsum.photos/seed/0a19fb75-7a9c-3e3c-8ee5-2e0e28f92640/640/480', 202.23, 0, 526, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(87, '501647', 'autem porro sequi', 'Molestias omnis voluptas officia beatae nesciunt veniam voluptates ipsa. Quia quia iure hic minus excepturi. Atque doloremque quia quidem tempora. Et et ipsam eos sunt eaque repudiandae deserunt.', 'https://picsum.photos/seed/9d0242dd-740e-3aca-9ead-fee5e8db21d7/640/480', 894.94, 0, 190, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(88, '153066', 'magni quisquam provident', 'Fuga error ab ut accusamus. Fuga temporibus nemo et nihil autem molestiae. Provident in qui sit ea.', 'https://picsum.photos/seed/139eb554-911e-348d-94e1-a4f395284e08/640/480', 273.66, 0, 169, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(89, '421223', 'omnis eius deserunt', 'Quibusdam itaque veniam dolorem provident. Autem et suscipit suscipit distinctio ut facere tenetur. Et illo eum voluptatum perspiciatis et.', 'https://picsum.photos/seed/caba2508-c331-38dd-b00a-bf1515bf804c/640/480', 211.68, 0, 530, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(90, '637576', 'voluptatem voluptatem quibusdam', 'Tempore animi error ut omnis esse aspernatur placeat accusantium. Quia quia aperiam adipisci. Quia exercitationem fuga consequatur id. Quo atque itaque modi ut et voluptate quos.', 'https://picsum.photos/seed/d91c1b6f-35fd-3d27-abf3-a1c67a3f238d/640/480', 51.83, 0, 126, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(91, '904716', 'suscipit omnis repellendus', 'Rerum sit dolores dicta sunt tempore eligendi maiores. Quo voluptatem velit et. Non ratione quo et et animi cupiditate laboriosam incidunt.', 'https://picsum.photos/seed/4aa4638e-e6b9-3f20-aba3-caad76d36b1b/640/480', 670.96, 0, 108, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(92, '207806', 'accusantium et veniam', 'Nisi alias assumenda officiis minus aut similique. Quasi voluptatem perspiciatis rerum possimus accusamus est. Quis explicabo cumque autem alias labore. Totam natus consequuntur perferendis id.', 'https://picsum.photos/seed/fce15517-12ca-35b0-bc02-a68db079dd50/640/480', 676.92, 0, 458, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(93, '361233', 'ipsam dignissimos numquam', 'Itaque ea voluptatem sed minima deleniti quibusdam. Laborum velit delectus velit quo eos. Sunt minus ex quae et. Est ut labore accusantium commodi et.', 'https://picsum.photos/seed/b1ad91d5-98d7-3923-a781-1b7d5b9395b3/640/480', 253.32, 0, 396, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(94, '369334', 'ut accusantium id', 'Ratione odio consequatur consequatur. Deserunt non quo facere aspernatur error. Aut natus fugit nam aut.', 'https://picsum.photos/seed/d8b4a616-7353-3de9-b6b1-6dbf0c413dc5/640/480', 726.94, 0, 349, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(95, '571168', 'qui consequuntur molestiae', 'Quia sint quos vitae et mollitia commodi. Quo sequi aut enim voluptatem necessitatibus. Omnis ut sint dolorum non sint expedita. Dolores blanditiis fuga qui dolorum.', 'https://picsum.photos/seed/0ae61680-5a8c-37e6-ad48-1eb7fa8af4c7/640/480', 520.67, 0, 102, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(96, '514149', 'ut aut exercitationem', 'Maxime molestiae sed recusandae velit est. Quia dolorem ut esse. Consequatur ut qui ut quod vel est dolorum officiis.', 'https://picsum.photos/seed/a905b2c9-0527-3002-acc3-c5dfd1e5d98f/640/480', 854.62, 0, 367, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(97, '629519', 'facere iure ipsum', 'Aut est accusantium porro placeat cum pariatur consequatur. Sint consequatur quod dolorum. In voluptas et corporis aut. Nesciunt et eius recusandae ea eligendi.', 'https://picsum.photos/seed/b7ad356d-c783-3267-9713-f98336aaa4e3/640/480', 476.57, 0, 317, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(98, '714132', 'aliquid aliquid ut', 'Autem ut vel ut molestiae voluptate fugiat iste. Porro sint dolor consequatur. Numquam et porro nostrum vero exercitationem facilis quod. Perferendis ea repellendus sapiente labore ea qui eius.', 'https://picsum.photos/seed/b9c24d21-d409-3042-b7b9-6c8d35974ec3/640/480', 771.06, 0, 256, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(99, '521693', 'alias est provident', 'Sit ut neque enim repellat adipisci. Omnis omnis nam ut hic. Molestiae provident quia nulla ea quas. Ut qui assumenda consequatur commodi accusamus qui autem culpa.', 'https://picsum.photos/seed/78654640-dbfd-3a3d-b91e-d2a35b67850e/640/480', 477.00, 0, 173, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(100, '691308', 'molestiae facilis aliquid', 'Consequatur esse corporis consequatur et iste esse consequatur. Nihil recusandae delectus excepturi iste. Eum deserunt nesciunt rerum velit consequatur qui.', 'https://picsum.photos/seed/e1ac444e-05d0-30b4-9120-b88c10e36f55/640/480', 107.80, 0, 304, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(101, '283128', 'est omnis suscipit', 'Repellat sit minima dolores incidunt. Quae enim amet qui quia sunt. Asperiores error nisi fuga ex libero sint odit.', 'https://picsum.photos/seed/938cc904-4e3c-32da-af18-2e7cf8345ba4/640/480', 142.10, 0, 465, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(102, '188795', 'corrupti adipisci sint', 'Quae dicta voluptates laudantium quia. Recusandae et natus tenetur nesciunt et quia. Molestiae laborum alias id voluptas quaerat. Ratione voluptatem perferendis et autem quis quo sed.', 'https://picsum.photos/seed/f7f0c639-d52a-3b8e-b704-880bba320051/640/480', 194.56, 0, 244, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(103, '474064', 'magnam et possimus', 'Adipisci sint soluta debitis sit aut. Est quia itaque voluptas eos rem. Deleniti magni quo eum sit exercitationem.', 'https://picsum.photos/seed/3469bd1b-3f6e-38e1-8deb-febcedc98d3d/640/480', 962.21, 0, 404, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(104, '313495', 'cum et commodi', 'Qui atque voluptas praesentium autem. Quis corrupti quos ex quo qui asperiores in. Qui dolorum aspernatur sit sed. Suscipit ratione dolores vel culpa eligendi.', 'https://picsum.photos/seed/507b5936-2c50-336b-a229-01387e9011c0/640/480', 891.86, 0, 244, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(105, '692947', 'laboriosam corrupti ratione', 'Eos et nisi placeat. Et error et nostrum laborum dolores. Cupiditate earum dolor molestiae et quos accusantium. Dicta nisi est id sint quis totam illum.', 'https://picsum.photos/seed/474e5231-4861-36b6-9c6e-3ebca87995f6/640/480', 443.52, 0, 115, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(106, '779490', 'tenetur et sit', 'Iure qui qui totam animi. Cum alias magni explicabo quam. Unde placeat qui velit nemo odit non cupiditate. Est consectetur quo veritatis illo aliquam.', 'https://picsum.photos/seed/b7e281f9-7b4e-347f-9cae-c033839197bc/640/480', 888.33, 0, 422, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(107, '370941', 'porro facilis sunt', 'Delectus enim quos laudantium quia. Veritatis placeat quas est earum. Sit iure quod placeat minima debitis magni aut voluptate. Sit sed blanditiis consectetur rerum debitis inventore sit similique.', 'https://picsum.photos/seed/f1b7b177-6b9a-3d6a-be7a-f146ef1ce1e7/640/480', 34.24, 0, 195, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(108, '718709', 'id illum sequi', 'Voluptatum sed voluptatem placeat itaque illo nihil voluptas. Doloremque earum cupiditate amet eius. Sunt maxime quod id recusandae voluptas porro omnis rerum.', 'https://picsum.photos/seed/60bf3051-db95-3599-ba67-e46b03269de9/640/480', 518.23, 0, 531, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(109, '795639', 'adipisci non itaque', 'Officiis temporibus possimus ut maiores dignissimos quae. Eos labore laborum omnis.', 'https://picsum.photos/seed/d3009e60-9f87-3aaf-ab8e-0639b08caf9b/640/480', 831.15, 0, 367, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(110, '625578', 'eaque voluptate et', 'Est nostrum minus omnis porro enim dolorem. Est et aut rerum nihil placeat. Culpa quia sint maiores optio magni quidem.', 'https://picsum.photos/seed/2afacdc3-fde6-352d-90cd-b63a8358e34c/640/480', 630.64, 0, 40, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(111, '394201', 'voluptatem facilis et', 'Cupiditate qui perferendis eum perspiciatis qui. Sit ad velit reiciendis qui qui nulla culpa et. Distinctio corrupti cupiditate rem eveniet. Iure ut molestiae molestias est odit facilis dicta.', 'https://picsum.photos/seed/2448c70e-58c9-3284-bec9-2142a41ae9a0/640/480', 566.13, 0, 365, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(112, '564201', 'facilis omnis quibusdam', 'Et qui sequi aut inventore numquam id. Amet eius voluptatem placeat corporis et unde quam. Deleniti repellat beatae vero et consequuntur.', 'https://picsum.photos/seed/9398f689-4d81-3890-8f53-e8ba2022e5e8/640/480', 831.74, 0, 459, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(113, '323099', 'iusto commodi dolorem', 'Unde sit est qui pariatur maxime voluptas. Veniam quam incidunt harum ullam ut autem. Aperiam iure sint dolor perspiciatis expedita enim quia. Ea illum blanditiis non error molestiae eaque at.', 'https://picsum.photos/seed/c26c39bc-bc0d-3a6b-8160-654923648883/640/480', 299.10, 0, 423, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(114, '577825', 'optio nesciunt dolorum', 'Quia dolor commodi quia architecto sapiente eligendi. Ut optio eos libero ullam incidunt quibusdam. Aut nisi expedita dolorem ut blanditiis.', 'https://picsum.photos/seed/728d28d6-b66c-3241-a532-0cea36556322/640/480', 737.12, 0, 209, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(115, '212413', 'est quasi fugit', 'Esse libero aut possimus iste. Commodi vero consequatur eos excepturi quam ut reprehenderit. Incidunt corporis unde incidunt quia non. Illo iste veniam quod et.', 'https://picsum.photos/seed/a644cefe-0dcb-3110-97c7-2927e1dfbe64/640/480', 235.28, 0, 509, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(116, '372882', 'velit voluptatem culpa', 'Eligendi magni amet qui repellendus vel aut. Explicabo corrupti exercitationem a atque. Neque ex ut voluptatem dolore earum autem dolorem.', 'https://picsum.photos/seed/6549809b-d6a6-3848-b1ac-413ed568c5e7/640/480', 861.90, 0, 494, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(117, '472778', 'non perspiciatis similique', 'Voluptas corporis aut facere eos sit dolorum. Ut id ut deserunt animi temporibus.', 'https://picsum.photos/seed/7735e2b2-73de-3d6d-b8cf-dc4c671bc47e/640/480', 346.21, 0, 392, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(118, '328823', 'vero consequatur iure', 'Expedita occaecati hic optio qui suscipit. Odit explicabo possimus illo sed ratione enim. Et totam aut quia deleniti quaerat ea quia. Excepturi nihil dolores autem quis sequi.', 'https://picsum.photos/seed/1fd33465-32ab-33f9-ad67-9984dec88700/640/480', 127.67, 0, 55, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(119, '686860', 'magni quos illo', 'Blanditiis dolores harum quis non ut dolores. Enim non eos veniam deserunt beatae velit. Odio repudiandae asperiores itaque asperiores.', 'https://picsum.photos/seed/a85a85be-0348-38ee-a928-7e39bab693c2/640/480', 455.52, 0, 507, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(120, '773385', 'velit quia officiis', 'Tenetur fugiat illum est ad. Voluptate alias et laudantium. Non perspiciatis ex veniam. Dolorem quidem consequatur et et fugit quis.', 'https://picsum.photos/seed/62201148-ff1a-34b0-8f84-2d5218883d29/640/480', 261.74, 0, 494, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(121, '457397', 'repudiandae eos sit', 'Deserunt ea est rerum occaecati officiis. Ex quia in eos quam voluptatibus. Perferendis iure expedita soluta quas.', 'https://picsum.photos/seed/664c72c8-7f7c-3a42-a57e-7fc649c946dc/640/480', 137.20, 0, 328, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(122, '857447', 'cum aut ducimus', 'Et libero voluptatem temporibus quod voluptatem. Voluptatibus earum nihil et aut sint assumenda occaecati omnis. Est architecto corporis nesciunt aspernatur.', 'https://picsum.photos/seed/61942da9-18da-3767-8044-207f5117dac2/640/480', 302.08, 0, 518, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(123, '497414', 'omnis facilis id', 'Distinctio modi laboriosam voluptatem sed dolores commodi reiciendis. Fugit magnam ipsum sed libero eum. Consequatur dolorem laboriosam eligendi qui nihil ipsam.', 'https://picsum.photos/seed/794c6a58-2de9-350b-baaa-34a3ceeedb9c/640/480', 794.75, 0, 413, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(124, '283181', 'ducimus cum aut', 'Ut commodi sequi reprehenderit impedit et architecto consequuntur. Et natus velit repellendus ut. Id corrupti suscipit quia distinctio. Officia unde dolor repellat ut.', 'https://picsum.photos/seed/0ae6a02f-dd8e-3b0a-8638-da5a57e6cb54/640/480', 506.38, 0, 189, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(125, '243376', 'in minima ex', 'Ut aut illo delectus molestias. Placeat in voluptas nam dignissimos. Quia autem quae est doloremque et temporibus illo ipsam. Odio deleniti corporis quia et explicabo doloribus vitae.', 'https://picsum.photos/seed/690cd594-9fb4-3878-9a63-1757674b2472/640/480', 826.14, 0, 87, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(126, '721724', 'adipisci aut molestiae', 'Officiis fuga eius quae quia voluptas dolores eius. Asperiores necessitatibus consequuntur autem ut dolorem laudantium magnam. Et voluptatem fugiat earum veritatis.', 'https://picsum.photos/seed/5b581f91-bdf4-3a4d-9665-be684d7491f4/640/480', 893.84, 0, 287, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(127, '872177', 'non provident ut', 'Dolorem voluptatum et recusandae dolores. Quod et doloribus eius deserunt beatae ut. Qui excepturi fugit est est autem. Nulla adipisci officia est ullam sint magnam.', 'https://picsum.photos/seed/44c3bef4-2a9b-37cd-8b3b-98190adb4ff9/640/480', 843.74, 0, 424, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(128, '237845', 'nihil aut esse', 'Eveniet et quia dolor consequatur. Quis eius sequi voluptas. Ea consequatur hic pariatur accusantium non qui repellat.', 'https://picsum.photos/seed/160d1fed-4f57-3642-9050-77ef647dc5db/640/480', 897.56, 0, 232, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(129, '213184', 'accusantium quo id', 'Dolorem qui tenetur voluptatem non in. Ut dolores ab aperiam quo saepe accusantium doloribus. Omnis omnis rem ut laborum eos. Molestiae rem fugiat pariatur corrupti autem ea nostrum.', 'https://picsum.photos/seed/5781014c-13ba-3f7f-841b-c20bdf106410/640/480', 217.60, 0, 464, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(130, '673804', 'sed aut nihil', 'Consequatur cupiditate laudantium neque quas et. Et nihil dolorem voluptatem deleniti at blanditiis ex nostrum. Quas aperiam ut et amet harum dolor.', 'https://picsum.photos/seed/f004f7ee-1c03-3c43-9286-52cfb8d3d97c/640/480', 409.94, 0, 252, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(131, '364704', 'temporibus dignissimos beatae', 'Voluptatem numquam architecto laudantium ea distinctio. Ut laborum voluptatem est debitis praesentium. Maiores ratione neque nostrum est deserunt.', 'https://picsum.photos/seed/34e5a01d-0199-32b6-a11a-a995a621e849/640/480', 257.75, 0, 540, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(132, '236310', 'officiis molestias id', 'Dolor consequatur nostrum nemo consequatur. Odio occaecati quis et deserunt placeat necessitatibus in.', 'https://picsum.photos/seed/669ac1b9-2c22-3f6c-bfeb-6e5ecd2e4533/640/480', 767.14, 0, 323, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(133, '676869', 'ut et molestiae', 'Eum facilis et et iste sit. Culpa earum voluptatem delectus delectus voluptatem earum numquam. Aut deserunt ducimus exercitationem similique. Qui et facere saepe assumenda.', 'https://picsum.photos/seed/75aadc2a-68c8-34f1-a846-a55ad4418e27/640/480', 851.54, 0, 619, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(134, '769302', 'eaque facere unde', 'Ratione unde corporis corporis vel. Ratione architecto provident cum et impedit id. Sequi commodi a nemo.', 'https://picsum.photos/seed/4269feec-6439-34e6-b6e7-f84b186bc3dc/640/480', 97.87, 0, 31, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(135, '541151', 'labore quam nemo', 'Aut qui consectetur totam et quisquam eligendi. Ipsam quos aut aut dolor id soluta eaque est. Magnam fuga saepe maxime dolorum vel ut.', 'https://picsum.photos/seed/94839bb5-abe7-37f2-864c-accb8d4b9d76/640/480', 676.19, 0, 54, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(136, '382918', 'nulla delectus quis', 'Iste qui aliquam eveniet est. Magnam harum est incidunt vitae autem ut. Quo minus asperiores eaque facere ut aut. Sit incidunt omnis alias et velit corrupti aut sequi.', 'https://picsum.photos/seed/e89377b2-31f7-33d3-b1d7-76a1a99437e3/640/480', 577.99, 0, 254, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(137, '444256', 'error corrupti est', 'Est et maiores voluptate voluptatum. Beatae error sit et excepturi. Molestiae id ipsam facilis nihil debitis debitis voluptatem.', 'https://picsum.photos/seed/25ffc333-0a6d-3c38-87eb-40fc8e1d24dd/640/480', 744.56, 0, 368, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(138, '827838', 'doloremque aut delectus', 'Quia rerum rerum dicta eveniet. Ab autem eligendi tempora dolor. Consequatur ratione aut dolore repellat. Est nisi voluptatum assumenda.', 'https://picsum.photos/seed/90fd76e0-0a2e-3b3d-9786-e56fafa216bf/640/480', 702.54, 0, 78, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(139, '713590', 'a magnam recusandae', 'Laudantium molestias quia est omnis quasi qui. Enim mollitia rerum sequi cumque.', 'https://picsum.photos/seed/2b964ed7-92db-3188-b955-e9e8ed418e1a/640/480', 111.52, 0, 208, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(140, '126261', 'saepe cupiditate cum', 'Dolor ut numquam ad deleniti aspernatur rem sit. Iusto sed ea tempore rerum pariatur voluptatem. Nam quia ut odio quidem necessitatibus.', 'https://picsum.photos/seed/ce4a8b97-8f60-3faa-b561-d06a0a4af19e/640/480', 8.53, 0, 356, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(141, '367893', 'dolor eius aut', 'Non non odio placeat nemo. Molestiae dolorem totam doloribus consequatur recusandae eos asperiores. Ipsam autem libero qui perferendis ipsam magni. Qui est sunt non fuga cum sapiente.', 'https://picsum.photos/seed/6c5e736f-7b31-322b-b97f-79b42119ca28/640/480', 711.18, 0, 558, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(142, '642481', 'deleniti id autem', 'Eum quia enim vel voluptas consequatur dolores et. Quia eaque illo quidem omnis. Qui veniam sunt ipsum quibusdam nihil.', 'https://picsum.photos/seed/0234738a-11aa-361e-948b-f40fde09bdce/640/480', 870.89, 0, 173, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(143, '249865', 'dolore sit sit', 'Perspiciatis nam est quia. Et magni ea tempore harum sit. Maxime aut quidem asperiores labore maxime voluptatem.', 'https://picsum.photos/seed/327cd0db-3f26-342e-b92f-da4d720261b3/640/480', 61.62, 0, 476, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(144, '761844', 'sapiente inventore quibusdam', 'Saepe debitis ipsam aspernatur quia. Laborum iusto amet dolores facilis. Est ea consequatur laudantium sit voluptatem et quam. Exercitationem voluptatem possimus ut unde soluta.', 'https://picsum.photos/seed/e2ad705e-23f4-39e1-892c-319d40f73dfe/640/480', 902.69, 0, 442, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(145, '264287', 'omnis dolorem sint', 'Sit quo accusamus repellendus. Dolorem voluptatem nostrum doloremque saepe sed. Porro voluptatum impedit voluptates at quasi deleniti. Rerum quaerat ipsa et sed.', 'https://picsum.photos/seed/0ef9e64b-1bc7-3b53-8839-4273a6997008/640/480', 142.99, 0, 299, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(146, '130991', 'deleniti et voluptate', 'Accusamus quisquam consectetur nobis eius blanditiis rerum repudiandae. Est dolores quis sequi ut atque omnis. Ducimus cumque assumenda laborum quaerat at beatae quo.', 'https://picsum.photos/seed/41075fed-8e8a-32be-a020-02623fff98ae/640/480', 512.00, 0, 84, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(147, '177236', 'saepe commodi et', 'Harum in sit quisquam quibusdam sed hic assumenda. Nisi aut quo sequi eos consequuntur iste. Itaque ipsam sit voluptas quas neque. Nesciunt illo veniam voluptatem.', 'https://picsum.photos/seed/d71fcfd5-5cc6-3416-9388-85b9e8481e21/640/480', 628.05, 0, 1, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(148, '820009', 'cupiditate perspiciatis voluptates', 'Ea rerum porro fuga aut. Hic nisi eaque inventore aut eius. Vero officia nihil accusamus dolorem ad.', 'https://picsum.photos/seed/dc835f8e-9e0b-3a89-be02-963a2dfab530/640/480', 487.96, 0, 197, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(149, '646274', 'quia ut adipisci', 'Et iste et voluptas aut. Corporis et aperiam nisi reprehenderit et sed. Doloribus expedita nesciunt assumenda tempore.', 'https://picsum.photos/seed/1edf882f-7c49-3f02-a67a-1b052d3300fb/640/480', 822.63, 0, 91, '2025-10-19 21:27:42', '2025-10-19 21:27:42'),
(150, '381067', 'repellendus et voluptates', 'Deleniti aliquid mollitia quia quia totam placeat aliquid. Tempore temporibus qui vero et neque qui. Officiis provident mollitia sed natus. Corrupti porro consequatur quo adipisci molestias.', 'https://picsum.photos/seed/34f22c76-e1ad-38f3-9c53-a1888e688e55/640/480', 943.92, 0, 261, '2025-10-19 21:27:42', '2025-10-19 21:27:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superAdmin', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(2, 'admin', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(3, 'secretaria', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(4, 'profesor', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(5, 'cliente', 'web', '2025-10-19 21:27:38', '2025-10-19 21:27:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QVnGvi2sBGREb3spijFgfEFaL8IEz0FYvLiVO4FD', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZlJ4YkE4dUFWemdXdm9CMnh3WVVpbVBhcWpZaGZwMzJmbFRkTnNodiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hZG1pbi9jb3ZlcnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJHVVWHFwSlozak1jTWUzU3o1U1BqQS5hNE8vQngvY0NudWF4c3I3ckcxbjBhaXhJSFhkVWp1Ijt9', 1761016211);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Accesorios para TV', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(2, 'LED', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(3, 'OLED', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(4, 'Otros', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(5, 'Proyectores', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(6, 'Insumos para TV', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(7, 'Televisores LGS', 1, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(8, 'Accesorios', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(9, 'Audifonos', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(10, 'Baterías externas', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(11, 'Carcasas y láminas', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(12, 'Celulares y Smartphones', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(13, 'Reacondicionados', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(14, 'Smartwatch', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(15, 'Tarjeta de memoria', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(16, 'Telefonía inalámbricos', 2, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(17, 'Accesorios', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(18, 'Almacenamiento', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(19, 'Computadores de escritorio', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(20, 'Impresoras y Scanners', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(21, 'Laptops', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(22, 'Monitores', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(23, 'Otros', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(24, 'Software', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(25, 'Tablets', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(26, 'Todo computación', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(27, 'Camara web', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(28, 'Mouse y teclados', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(29, 'Audio y parlantes', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(30, 'Router y redes', 3, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(31, 'Accesorios', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(32, 'Consolas', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(33, 'Nintendo', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(34, 'Otros', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(35, 'Playstation', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(36, 'Juegos', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(37, 'Mandos', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(38, 'Xbox', 4, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(39, 'Juegos', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(40, 'Laptops gamer', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(41, 'Otros', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(42, 'PC gamer', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(43, 'Sillas gamer', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(44, 'Micrófonos gamer', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(45, 'Mouse gamer', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(46, 'Combos gamer', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(47, 'Teclados gamer', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(48, 'Audífonos gamer', 5, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(49, 'Accesorios', 6, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(50, 'Audífonos', 6, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(51, 'Equipos de sonido', 6, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(52, 'Instrumentos musicales', 6, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(53, 'Parlantes', 6, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(54, 'Soundbar y Home Theater', 6, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(55, 'Autoradios', 6, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(56, 'Equipos de DJ', 6, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(57, 'Cocina smart', 7, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(58, 'Iluminación inteligente', 7, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(59, 'Seguridad inteligente', 7, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(60, 'Camaras de seguridad', 7, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(61, 'Enchufes inteligentes', 7, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(62, 'Parlantes inteligentes', 7, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(63, 'Camararas acuáticas', 8, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(64, 'Camaras compactas', 8, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(65, 'Camaras de video', 8, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(66, 'Drones', 8, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(67, 'Lentes y accesorios', 8, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(68, 'tintas', 9, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(69, 'toners', 9, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(70, 'Congeladores', 10, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(71, 'Enfriadores de agua', 10, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(72, 'Frigobar', 10, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(73, 'Refrigeradoras', 10, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(74, 'Vineras', 10, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(75, 'Cocinas', 11, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(76, 'Hornos', 11, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(77, 'Microondas', 11, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(78, 'Otros', 11, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(79, 'Planchas', 11, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(80, 'Refractarios', 11, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(81, 'Sartenes', 11, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(82, 'Vajillas', 11, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(83, 'Centro de lavado', 12, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(84, 'Lavadoras', 12, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(85, 'Lavasecas', 12, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(86, 'Otros', 12, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(87, 'Secadoras', 12, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(88, 'Aires acondicionados', 13, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(89, 'Calefacción', 13, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(90, 'Climatizadores', 13, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(91, 'Otros', 13, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(92, 'Ventiladores', 13, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(93, 'Aspiradoras', 14, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(94, 'Otros', 14, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(95, 'Planchas a vapor', 14, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(96, 'Robot aspiradoras', 14, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(97, 'Batidoras', 15, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(98, 'Cafeteras', 15, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(99, 'Extractores', 15, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(100, 'Licuadoras', 15, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(101, 'Otros', 15, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(102, 'Ollas arroceras', 15, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(103, 'Sanducheras', 15, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(104, 'Tostadoras', 15, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(105, 'Colección de verano', 16, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(106, 'Lo mas nuevo', 16, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(107, 'Abrigos', 17, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(108, 'Camisas', 17, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(109, 'Camisetas', 17, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(110, 'Jeans', 17, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(111, 'Pantalones', 17, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(112, 'Polos', 17, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(113, 'Ropa interior', 17, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(114, 'Shorts', 17, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(115, 'Trajes', 17, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(116, 'Zapatos', 17, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(117, 'Billeteras', 18, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(118, 'Cinturones', 18, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(119, 'Corbatas', 18, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(120, 'Gorros', 18, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(121, 'Gafas', 18, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(122, 'Guantes', 18, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(123, 'Mochilas', 18, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(124, 'Otros', 18, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(125, 'Relojes', 18, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(126, 'Sombreros', 18, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(127, 'Boxers', 19, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(128, 'Pijamas', 19, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(129, 'Ropa interior', 19, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(130, 'Botas', 20, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(131, 'Casuales', 20, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(132, 'Formales', 20, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(133, 'Otros', 20, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(134, 'Sandalias', 20, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(135, 'Zapatillas', 20, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(136, 'Colección de verano', 21, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(137, 'Lo mas nuevo', 21, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(138, 'Comodidad', 21, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(139, 'Colección otoño invierno', 21, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(140, 'Abrigos', 22, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(141, 'Blusas', 22, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(142, 'Camisas', 22, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(143, 'Camisetas', 22, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(144, 'Jeans', 22, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(145, 'Pantalones', 22, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(146, 'Polos', 22, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(147, 'Ropa interior', 22, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(148, 'Shorts', 22, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(149, 'Vestidos', 22, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(150, 'Zapatos', 22, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(151, 'Billeteras', 23, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(152, 'Cinturones', 23, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(153, 'Gorros', 23, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(154, 'Gafas', 23, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(155, 'Guantes', 23, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(156, 'Mochilas', 23, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(157, 'Otros', 23, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(158, 'Relojes', 23, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(159, 'Sombreros', 23, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(160, 'Pijamas', 24, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(161, 'Ropa interior', 24, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(162, 'Botas', 25, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(163, 'Casuales', 25, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(164, 'Formales', 25, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(165, 'Otros', 25, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(166, 'Sandalias', 25, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(167, 'Zapatillas', 25, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(168, 'Acondicionadores', 26, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(169, 'Cepillos', 26, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(170, 'Cremas para peinar', 26, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(171, 'Otros', 26, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(172, 'Shampoo', 26, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(173, 'Tintes', 26, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(174, 'Cremas corporales', 27, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(175, 'Cremas de manos', 27, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(176, 'Cremas de pies', 27, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(177, 'Cuidado de uñas', 27, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(178, 'Desodorantes', 27, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(179, 'Exfoliantes', 27, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(180, 'Otros', 27, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(181, 'Cremas antiarrugas', 28, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(182, 'Cremas antimanchas', 28, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(183, 'Cremas hidratantes', 28, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(184, 'Cremas nutritivas', 28, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(185, 'Cremas reafirmantes', 28, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(186, 'Cremas reductoras', 28, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(187, 'Otros', 28, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(188, 'Cepillos alisadores', 29, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(189, 'Cepillos faciales', 29, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(190, 'Cortadoras de cabello', 29, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(191, 'Depiladoras', 29, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(192, 'Otros', 29, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(193, 'Planchas', 29, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(194, 'Rizadores', 29, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(195, 'Secadoras', 29, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(196, 'Bases', 30, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(197, 'Brochas', 30, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(198, 'Correctores', 30, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(199, 'Delineadores', 30, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(200, 'Labiales', 30, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(201, 'Otros', 30, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(202, 'Polvos', 30, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(203, 'Sombras', 30, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(204, 'Aceites', 31, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(205, 'Cremas', 31, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(206, 'Otros', 31, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(207, 'Femeninos', 32, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(208, 'Masculinos', 32, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(209, 'Otros', 32, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(210, 'Cremas antiarrugas', 33, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(211, 'Cremas antimanchas', 33, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(212, 'Cremas hidratantes', 33, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(213, 'Cremas nutritivas', 33, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(214, 'Cremas reafirmantes', 33, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(215, 'Cremas reductoras', 33, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(216, 'Otros', 33, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(217, 'Cuidado capilar', 34, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(218, 'Cuidado corporal', 34, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(219, 'Dermocosmética', 34, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(220, 'Electro belleza', 34, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(221, 'Maquillaje', 34, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(222, 'Masaje y spa', 34, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(223, 'Perfumes', 34, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(224, 'Tratamientos faciales', 34, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(225, 'Cuidado del adulto', 35, '2025-10-19 21:27:38', '2025-10-19 21:27:38'),
(226, 'Protección del adulto', 35, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(227, 'Cuidado femenino', 36, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(228, 'Protección femenina', 36, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(229, 'Cuidado del adulto', 37, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(230, 'Cuidado femenino', 37, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(231, 'Protección del adulto', 37, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(232, 'Protección femenina', 37, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(233, 'Café', 38, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(234, 'Cereales', 38, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(235, 'Galletas', 38, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(236, 'Mermeladas', 38, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(237, 'Otros', 38, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(238, 'Pan', 38, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(239, 'Té', 38, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(240, 'Embutidos', 39, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(241, 'Fiambres', 39, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(242, 'Afeitado', 40, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(243, 'Cuidado bucal', 40, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(244, 'Higiene corporal', 40, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(245, 'Shampoo y acondicionador', 40, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(246, 'Papel higiénico', 40, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(247, 'Alcohol y desinfectantes', 40, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(248, 'Aceites', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(249, 'Arroz', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(250, 'Azúcar', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(251, 'Bebidas', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(252, 'Café', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(253, 'Cereales', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(254, 'Conservas', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(255, 'Dulces', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(256, 'Enlatados', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(257, 'Fideos', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(258, 'Galletas', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(259, 'Harinas', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(260, 'Legumbres', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(261, 'Mermeladas', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(262, 'Otros', 41, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(263, 'Carnes', 42, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(264, 'Empanadas', 42, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(265, 'Helados', 42, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(266, 'Otros', 42, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(267, 'Pescados', 42, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(268, 'Pollos', 42, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(269, 'Vegetales', 42, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(270, 'Cuidado del bebé', 43, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(271, 'Pañales', 43, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(272, 'Frutas', 44, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(273, 'Verduras', 44, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(274, 'Leche', 45, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(275, 'Mantequilla', 45, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(276, 'Otros', 45, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(277, 'Quesos', 45, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(278, 'Yogurt', 45, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(279, 'Cervezas', 46, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(280, 'Espumantes', 46, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(281, 'Otros', 46, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(282, 'Piscos', 46, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(283, 'Vinos', 46, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(284, 'Detergentes', 47, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(285, 'Lavavajillas', 47, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(286, 'Otros', 47, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(287, 'Suavizantes', 47, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(288, 'Panetones', 48, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(289, 'Aminoácidos', 49, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(290, 'Creatina', 49, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(291, 'Otros', 49, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(292, 'Proteínas', 49, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(293, 'Bicicletas', 50, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(294, 'Otros', 50, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(295, 'Repuestos', 50, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(296, 'Accesorios', 51, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(297, 'Bancas', 51, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(298, 'Bicicletas estáticas', 51, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(299, 'Caminadoras', 51, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(300, 'Otros', 51, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(301, 'Pesas', 51, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(302, 'Plataformas', 51, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(303, 'Remadoras', 51, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(304, 'Steppers', 51, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(305, 'Accesorios', 52, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(306, 'Bolsos', 52, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(307, 'Otros', 52, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(308, 'Relojes', 52, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(309, 'Balones', 53, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(310, 'Bicicletas', 53, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(311, 'Camping', 53, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(312, 'Ciclismo', 53, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(313, 'Fitness', 53, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(314, 'Futbol', 53, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(315, 'Otros', 53, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(316, 'Skate', 53, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(317, 'Tenis', 53, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(318, 'Basquet', 54, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(319, 'Boxeo', 54, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(320, 'Futbol', 54, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(321, 'Golf', 54, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(322, 'Otros', 54, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(323, 'Tenis', 54, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(324, 'Accesorios', 55, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(325, 'Audio', 55, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(326, 'Cargadores', 55, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(327, 'Otros', 55, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(328, 'Parlantes', 55, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(329, 'Reproductores', 55, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(330, 'Cerrajería', 56, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(331, 'Electricidad', 56, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(332, 'Gasfitería', 56, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(333, 'Iluminación', 56, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(334, 'Jardinería', 56, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(335, 'Otros', 56, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(336, 'Seguridad', 56, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(337, 'Atornilladores', 57, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(338, 'Caladoras', 57, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(339, 'Cepillos', 57, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(340, 'Compresores', 57, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(341, 'Cortadoras', 57, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(342, 'Esmeriles', 57, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(343, 'Lijadoras', 57, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(344, 'Otros', 57, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(345, 'Pistolas de calor', 57, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(346, 'Pulidoras', 57, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(347, 'Sierras', 57, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(348, 'Taladros', 57, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(349, 'Alicates', 58, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(350, 'Cinceles', 58, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(351, 'Cortadores', 58, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(352, 'Destornilladores', 58, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(353, 'Llaves', 58, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(354, 'Martillos', 58, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(355, 'Otros', 58, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(356, 'Pinzas', 58, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(357, 'Sierras', 58, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(358, 'Taladros', 58, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(359, 'Brochas', 59, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(360, 'Otros', 59, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(361, 'Pinturas', 59, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(362, 'Rodillos', 59, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(363, 'Cintas métricas', 60, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(364, 'Escuadras', 60, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(365, 'Flexómetros', 60, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(366, 'Niveles', 60, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(367, 'Otros', 60, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(368, 'Plomadas', 60, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(369, 'Reglas', 60, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(370, 'Accesorios', 61, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(371, 'Alfombras', 61, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(372, 'Cortinas', 61, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(373, 'Otros', 61, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(374, 'Toallas', 61, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(375, 'Accesorios', 62, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(376, 'Cubiertos', 62, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(377, 'Otros', 62, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(378, 'Ollas', 62, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(379, 'Sartenes', 62, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(380, 'Vajillas', 62, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(381, 'Flores y plantas', 63, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(382, 'Iluminación', 63, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(383, 'Otros', 63, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(384, 'Relojes', 63, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(385, 'Textiles', 63, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(386, 'Cilindros', 64, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(387, 'Cajas chinas', 64, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(388, 'Utensilios y accesorios', 64, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(389, 'Parrillas', 64, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(390, 'Vasos, copas y jarras', 65, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(391, 'Tazas y platos', 65, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(392, 'Juegos de té y café', 65, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(393, 'Cajas', 66, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(394, 'Cestos', 66, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(395, 'Otros', 66, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(396, 'Percheros', 66, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(397, 'Repisas', 66, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(398, 'Colección de verano', 67, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(399, 'Lo mas nuevo', 67, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(400, 'Colección otoño invierno', 67, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(401, 'Abrigos', 68, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(402, 'Camisas', 68, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(403, 'Camisetas', 68, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(404, 'Jeans', 68, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(405, 'Pantalones', 68, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(406, 'Polos', 68, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(407, 'Ropa interior', 68, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(408, 'Shorts', 68, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(409, 'Zapatos', 68, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(410, 'Billeteras', 69, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(411, 'Cinturones', 69, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(412, 'Gorros', 69, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(413, 'Gafas', 69, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(414, 'Guantes', 69, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(415, 'Mochilas', 69, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(416, 'Otros', 69, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(417, 'Relojes', 69, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(418, 'Sombreros', 69, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(419, 'Boxers', 70, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(420, 'Pijamas', 70, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(421, 'Ropa interior', 70, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(422, 'Botas', 71, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(423, 'Casuales', 71, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(424, 'Formales', 71, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(425, 'Otros', 71, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(426, 'Sandalias', 71, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(427, 'Zapatillas', 71, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(428, 'Abrigos', 72, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(429, 'Blusas', 72, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(430, 'Camisas', 72, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(431, 'Camisetas', 72, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(432, 'Jeans', 72, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(433, 'Pantalones', 72, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(434, 'Polos', 72, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(435, 'Ropa interior', 72, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(436, 'Shorts', 72, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(437, 'Vestidos', 72, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(438, 'Zapatos', 72, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(439, 'Botas', 73, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(440, 'Casuales', 73, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(441, 'Formales', 73, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(442, 'Otros', 73, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(443, 'Sandalias', 73, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(444, 'Zapatillas', 73, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(445, 'Alimento para gatos', 74, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(446, 'Alimento para perros', 74, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(447, 'Otros', 74, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(448, 'Accesorios para gatos', 75, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(449, 'Accesorios para perros', 75, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(450, 'Otros', 75, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(451, 'Juguetes para gatos', 76, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(452, 'Juguetes para perros', 76, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(453, 'Otros', 76, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(454, 'Cuidado de gatos', 77, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(455, 'Cuidado de perros', 77, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(456, 'Otros', 77, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(457, 'Higiene de gatos', 78, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(458, 'Higiene de perros', 78, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(459, 'Otros', 78, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(460, 'Transporte de gatos', 79, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(461, 'Transporte de perros', 79, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(462, 'Otros', 79, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(463, 'Colchones', 80, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(464, 'Otros', 80, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(465, 'Almohadas', 81, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(466, 'Cobertores', 81, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(467, 'Otros', 81, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(468, 'Sábanas', 81, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(469, 'Bases', 82, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(470, 'Cabeceras', 82, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(471, 'Cómodas', 82, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(472, 'Otros', 82, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(473, 'Veladores', 82, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(474, 'Accesorios', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(475, 'Autos', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(476, 'Bloques', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(477, 'Cocinas', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(478, 'Disfraces', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(479, 'Figuras de acción', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(480, 'Juegos de mesa', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(481, 'Juguetes de madera', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(482, 'Juguetes didácticos', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(483, 'Juguetes electrónicos', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(484, 'Juguetes para bebés', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(485, 'Juguetes para niñas', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(486, 'Juguetes para niños', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(487, 'Lanzadores', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(488, 'Muñecas', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(489, 'Otros', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(490, 'Peluches', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(491, 'Pistas', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(492, 'Puzzles', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(493, 'Rompecabezas', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(494, 'Vehículos', 83, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(495, 'Accesorios', 84, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(496, 'Alimentación', 84, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(497, 'Baño', 84, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(498, 'Cuidado del bebé', 84, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(499, 'Juguetes para bebés', 84, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(500, 'Pañales', 84, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(501, 'Ropa de bebé', 84, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(502, 'Seguridad', 84, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(503, 'Sillas de auto', 84, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(504, 'Transporte', 84, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(505, 'Accesorios', 85, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(506, 'Cuidado de la salud', 85, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(507, 'Otros', 85, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(508, 'Afeitado', 86, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(509, 'Cuidado bucal', 86, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(510, 'Higiene corporal', 86, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(511, 'Shampoo y acondicionador', 86, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(512, 'Papel higiénico', 86, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(513, 'Alcohol y desinfectantes', 86, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(514, 'Accesorios', 87, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(515, 'Cuidado sexual', 87, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(516, 'Otros', 87, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(517, 'Accesorios', 88, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(518, 'Equipos médicos', 88, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(519, 'Otros', 88, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(520, 'Medicamentos', 89, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(521, 'Otros', 89, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(522, 'Aminoácidos', 90, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(523, 'Creatina', 90, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(524, 'Otros', 90, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(525, 'Proteínas', 90, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(526, 'Accesorios', 91, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(527, 'Audio', 91, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(528, 'Cargadores', 91, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(529, 'Otros', 91, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(530, 'Parlantes', 91, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(531, 'Reproductores', 91, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(532, 'Llantas', 92, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(533, 'Otros', 92, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(534, 'Accesorios', 93, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(535, 'Otros', 93, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(536, 'Repuestos', 93, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(537, 'Accesorios', 94, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(538, 'Alacenas', 94, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(539, 'Cocinas', 94, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(540, 'Comedores', 94, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(541, 'Despensas', 94, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(542, 'Mesas', 94, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(543, 'Otros', 94, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(544, 'Sillas', 94, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(545, 'Accesorios', 95, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(546, 'Alacenas', 95, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(547, 'Comedores', 95, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(548, 'Mesas', 95, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(549, 'Otros', 95, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(550, 'Sillas', 95, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(551, 'Accesorios', 96, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(552, 'Bases', 96, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(553, 'Cabeceras', 96, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(554, 'Cómodas', 96, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(555, 'Otros', 96, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(556, 'Veladores', 96, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(557, 'Accesorios', 97, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(558, 'Archivadores', 97, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(559, 'Escritorios', 97, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(560, 'Otros', 97, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(561, 'Sillas', 97, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(562, 'Accesorios', 98, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(563, 'Alacenas', 98, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(564, 'Mesas', 98, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(565, 'Otros', 98, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(566, 'Sillas', 98, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(567, 'Sofás', 98, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(568, 'Accesorios', 99, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(569, 'Alacenas', 99, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(570, 'Mesas', 99, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(571, 'Otros', 99, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(572, 'Sillas', 99, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(573, 'Sofás', 99, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(574, 'Libros', 100, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(575, 'Otros', 100, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(576, 'Libros digitales', 101, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(577, 'Otros', 101, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(578, 'Libros infantiles', 102, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(579, 'Otros', 102, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(580, 'Libros juveniles', 103, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(581, 'Otros', 103, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(582, 'Libros de texto', 104, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(583, 'Otros', 104, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(584, 'Libros de cocina', 105, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(585, 'Otros', 105, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(586, 'Libros de autoayuda', 106, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(587, 'Otros', 106, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(588, 'Libros de ficción', 107, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(589, 'Otros', 107, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(590, 'Libros de no ficción', 108, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(591, 'Otros', 108, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(592, 'Libros de historia', 109, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(593, 'Otros', 109, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(594, 'Libros de arte', 110, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(595, 'Otros', 110, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(596, 'Libros de ciencia', 111, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(597, 'Otros', 111, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(598, 'Libros de medicina', 112, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(599, 'Otros', 112, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(600, 'Libros de psicología', 113, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(601, 'Otros', 113, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(602, 'Libros de economía', 114, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(603, 'Otros', 114, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(604, 'Libros de negocios', 115, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(605, 'Otros', 115, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(606, 'Libros de marketing', 116, '2025-10-19 21:27:39', '2025-10-19 21:27:39'),
(607, 'Otros', 116, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(608, 'Libros de finanzas', 117, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(609, 'Otros', 117, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(610, 'Libros de derecho', 118, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(611, 'Otros', 118, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(612, 'Accesorios', 119, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(613, 'Cuidado de la salud', 119, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(614, 'Otros', 119, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(615, 'Afeitado', 120, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(616, 'Cuidado bucal', 120, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(617, 'Higiene corporal', 120, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(618, 'Shampoo y acondicionador', 120, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(619, 'Papel higiénico', 120, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(620, 'Alcohol y desinfectantes', 120, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(621, 'Accesorios', 121, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(622, 'Cuidado sexual', 121, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(623, 'Otros', 121, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(624, 'Accesorios', 122, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(625, 'Equipos médicos', 122, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(626, 'Otros', 122, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(627, 'Medicamentos', 123, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(628, 'Otros', 123, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(629, 'Aminoácidos', 124, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(630, 'Creatina', 124, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(631, 'Otros', 124, '2025-10-19 21:27:40', '2025-10-19 21:27:40'),
(632, 'Proteínas', 124, '2025-10-19 21:27:40', '2025-10-19 21:27:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `document_type` int(11) NOT NULL,
  `document_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `document_type`, `document_number`, `email`, `email_verified_at`, `phone`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'Admin ', 1, '123123123', 'admin@email.com', '2025-10-19 21:27:41', 9514268, '$2y$10$5chyluqq1VaNjIk.uqtWP.gds.e6b5cVhAXEW0lSs5VafXo/EZRhS', NULL, NULL, NULL, 'thHKrHG21m', NULL, NULL, 1, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(2, 'Jose Daniel', 'Grijalba Osorio', 1, '123123123', 'jose.jdgo97@gmail.com', '2025-10-19 21:27:41', 9514268, '$2y$10$uUXqpJZ3jMcMe3Sz5SPjA.a4O/Bx/cCnuaxsr7rG1n0aixIHXdUju', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-10-19 21:27:41', '2025-10-19 21:27:41'),
(3, 'zxczxc', 'xzxzc', 2, '12412445654', 'jdgo97@gmail.com', NULL, 123123, '$2y$10$XX5Eqyqh2eS8p1uGSsjLIuoiZhQm4LaLve05x9IpH4HxMdSVP5HDq', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-10-20 05:31:17', '2025-10-20 05:31:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_family_id_foreign` (`family_id`);

--
-- Indices de la tabla `covers`
--
ALTER TABLE `covers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `features_option_id_foreign` (`option_id`);

--
-- Indices de la tabla `feature_variant`
--
ALTER TABLE `feature_variant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feature_variant_feature_id_foreign` (`feature_id`),
  ADD KEY `feature_variant_variant_id_foreign` (`variant_id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `option_product`
--
ALTER TABLE `option_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_product_option_id_foreign` (`option_id`),
  ADD KEY `option_product_product_id_foreign` (`product_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT de la tabla `covers`
--
ALTER TABLE `covers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `families`
--
ALTER TABLE `families`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `feature_variant`
--
ALTER TABLE `feature_variant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `option_product`
--
ALTER TABLE `option_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=633;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_family_id_foreign` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`);

--
-- Filtros para la tabla `features`
--
ALTER TABLE `features`
  ADD CONSTRAINT `features_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `feature_variant`
--
ALTER TABLE `feature_variant`
  ADD CONSTRAINT `feature_variant_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feature_variant_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `option_product`
--
ALTER TABLE `option_product`
  ADD CONSTRAINT `option_product_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`),
  ADD CONSTRAINT `option_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
