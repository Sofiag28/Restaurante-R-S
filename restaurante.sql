-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-04-2024 a las 03:20:36
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebidas`
--

CREATE TABLE `bebidas` (
  `Id_Bebidas` int(11) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Id_Categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bebidas`
--

INSERT INTO `bebidas` (`Id_Bebidas`, `Nombre`, `Id_Categoria`) VALUES
(6, 'Cocacola', 10),
(7, 'Agua', 20),
(8, 'Vino', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Id_Categoria` int(11) NOT NULL,
  `Tipo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`Id_Categoria`, `Tipo`) VALUES
(4, 'Comida Rápida'),
(8, 'Comida Rápida'),
(10, 'Gaseosa'),
(13, 'Comida Rápida'),
(20, 'Natural'),
(30, 'Alcoholica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comidas`
--

CREATE TABLE `comidas` (
  `Id_Comidas` int(11) NOT NULL,
  `Nombre` varchar(15) DEFAULT NULL,
  `Id_Categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comidas`
--

INSERT INTO `comidas` (`Id_Comidas`, `Nombre`, `Id_Categoria`) VALUES
(14, 'Hamburguesa', 13),
(15, 'Pizza', 8),
(16, 'Salchipapas', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `Id_orden` int(11) NOT NULL,
  `Id_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`Id_orden`, `Id_pedido`) VALUES
(70, 1),
(71, 2),
(72, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `Id_pedido` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Id_Bebidas` int(11) NOT NULL,
  `Id_Comidas` int(11) NOT NULL,
  `Total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`Id_pedido`, `Cantidad`, `Id_Bebidas`, `Id_Comidas`, `Total`) VALUES
(1, 1, 6, 14, 27),
(2, 1, 7, 15, 15),
(3, 1, 8, 16, 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  ADD PRIMARY KEY (`Id_Bebidas`),
  ADD KEY `fk_id2` (`Id_Categoria`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Indices de la tabla `comidas`
--
ALTER TABLE `comidas`
  ADD PRIMARY KEY (`Id_Comidas`),
  ADD KEY `fk_id3` (`Id_Categoria`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`Id_orden`),
  ADD KEY `fk_id5` (`Id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Id_pedido`),
  ADD KEY `fk_id_1` (`Id_Bebidas`),
  ADD KEY `f_id4` (`Id_Comidas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  MODIFY `Id_Bebidas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `Id_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `comidas`
--
ALTER TABLE `comidas`
  MODIFY `Id_Comidas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `Id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `Id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bebidas`
--
ALTER TABLE `bebidas`
  ADD CONSTRAINT `fk_id2` FOREIGN KEY (`Id_Categoria`) REFERENCES `categoria` (`Id_Categoria`);

--
-- Filtros para la tabla `comidas`
--
ALTER TABLE `comidas`
  ADD CONSTRAINT `fk_id3` FOREIGN KEY (`Id_Categoria`) REFERENCES `categoria` (`Id_Categoria`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_id5` FOREIGN KEY (`Id_pedido`) REFERENCES `pedidos` (`Id_pedido`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `f_id4` FOREIGN KEY (`Id_Comidas`) REFERENCES `comidas` (`Id_Comidas`),
  ADD CONSTRAINT `fk_id_1` FOREIGN KEY (`Id_Bebidas`) REFERENCES `bebidas` (`Id_Bebidas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
