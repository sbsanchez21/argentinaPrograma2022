sss-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2022 a las 00:55:08
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `linked2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `id` int(11) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `altura` int(8) DEFAULT NULL,
  `entreCalles` varchar(50) DEFAULT NULL,
  `codigoPostal` varchar(10) DEFAULT NULL,
  `localidad` varchar(30) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL,
  `país` varchar(50) DEFAULT NULL,
  `idPersona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`id`, `calle`, `altura`, `entreCalles`, `codigoPostal`, `localidad`, `provincia`, `país`, `idPersona`) VALUES
(1, 'La Plata', 333, NULL, NULL, NULL, 'Buenos Aires', NULL, 3),
(2, 'Av. San Juan', 233, NULL, NULL, NULL, 'Buenos Aires', NULL, 1),
(3, 'Av. SAnta Fe', 333, NULL, NULL, NULL, 'Buenos Aires', NULL, 4),
(4, 'Dean Funes', 22, NULL, NULL, NULL, 'Cordoba', NULL, 3),
(5, 'Tres esquinas', 444, NULL, NULL, NULL, 'Buenos Aires', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educacion`
--

CREATE TABLE `educacion` (
  `id` int(11) NOT NULL,
  `institucion` varchar(50) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `anioIni` year(4) DEFAULT NULL,
  `anioFin` year(4) DEFAULT NULL,
  `idPersona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `educacion`
--

INSERT INTO `educacion` (`id`, `institucion`, `titulo`, `anioIni`, `anioFin`, `idPersona`) VALUES
(1, 'UTN', 'Ing en Sistemas', 2019, 2022, 1),
(2, 'Centro de Enseñanza', 'Tecnologo', 2014, 2018, 1),
(3, 'UBA', 'Ing en Sistemas', 2019, 2022, 1),
(4, 'UTN', 'Ing en Sistemas', 2019, 2022, 2),
(5, 'UTN', 'Ing en Sistemas', 2019, 2022, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `profesion` varchar(50) DEFAULT NULL,
  `acercaDe` varchar(100) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `profesion`, `acercaDe`, `telefono`, `email`) VALUES
(1, 'Manuel', 'Sadosky', 'Informático en Conicet', 'Matemático Físico y Químico', 1166654546, 'msadosky@gmail.com'),
(2, 'Juan', 'Perez', 'Informático en Conicet', 'Matemático Físico y Químico', 1166654546, 'msadosky@gmail.com'),
(3, 'Manuel', 'Rodriguez', 'Informático en Conicet', 'Matemático Físico y Químico', 1166654546, 'msadosky@gmail.com'),
(4, 'Josefina', 'Jaroseski', 'Informático en Conicet', 'Matemático Físico y Químico', 1166654546, 'msadosky@gmail.com'),
(5, 'Ramón', 'Sadosky', 'Informático en Conicet', 'Matemático Físico y Químico', 1166654546, 'msadosky@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPersona` (`idPersona`);

--
-- Indices de la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPersona` (`idPersona`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profesion` (`profesion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `educacion`
--
ALTER TABLE `educacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `domicilio_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD CONSTRAINT `educacion_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
