-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2024 a las 00:20:43
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
-- Base de datos: `gloria_gourment`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebidas`
--

CREATE TABLE `bebidas` (
  `idBebida` int(3) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bebidas`
--

INSERT INTO `bebidas` (`idBebida`, `nombre`) VALUES
(1, 'Agua mineral'),
(2, 'Vino tinto'),
(3, 'Refresco de cola'),
(4, 'Jugo de naranja'),
(5, 'Cerveza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(3) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombre`, `apellido`, `telefono`) VALUES
(1, 'Juan', 'Pérez', 1122334455),
(2, 'María', 'García', 2147483647),
(3, 'Carlos', 'López', 2147483647),
(4, 'Laura', 'Martínez', 2147483647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(2) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` int(8) NOT NULL,
  `telefono` int(10) NOT NULL,
  `idPuesto` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `direccion`, `nombre`, `apellido`, `dni`, `telefono`, `idPuesto`) VALUES
(4, 'Calle Principal 123', 'Pedro', 'Rodríguez', 20558448, 1158846994, 1),
(5, 'Av. Libertador 456', 'Ana', 'Sánchez', 17555888, 1133366412, 2),
(6, 'Av. Bolívar 789', 'Diego', 'Gómez', 19336445, 1158849955, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFactura` int(8) NOT NULL,
  `idPedido` int(10) NOT NULL,
  `precioTotal` float(12,2) NOT NULL,
  `fechaFactura` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFactura`, `idPedido`, `precioTotal`, `fechaFactura`) VALUES
(1, 1, 51000.00, '2024-06-21 22:12:26'),
(2, 2, 45750.00, '2024-06-21 22:12:39'),
(3, 3, 76500.00, '2024-06-21 22:13:08'),
(4, 4, 51000.00, '2024-06-21 22:12:48'),
(5, 5, 45750.00, '2024-06-21 22:13:54'),
(6, 6, 76500.00, '2024-06-21 22:14:00'),
(7, 7, 57000.00, '2024-06-21 22:13:13'),
(8, 8, 42250.00, '2024-06-21 22:13:19'),
(9, 9, 73800.00, '2024-06-21 22:13:29'),
(10, 10, 45750.00, '2024-06-21 22:13:33'),
(11, 11, 10200.00, '2024-06-21 22:13:38'),
(12, 12, 85500.00, '2024-06-21 22:13:43'),
(13, 13, 42250.00, '2024-06-21 22:13:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menues`
--

CREATE TABLE `menues` (
  `idMenu` int(3) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `entrada` varchar(30) NOT NULL,
  `platoPrincipal` varchar(30) NOT NULL,
  `postre` varchar(30) NOT NULL,
  `idBebida` int(3) NOT NULL,
  `adicional` varchar(30) NOT NULL,
  `precioUnitario` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `menues`
--

INSERT INTO `menues` (`idMenu`, `nombre`, `entrada`, `platoPrincipal`, `postre`, `idBebida`, `adicional`, `precioUnitario`) VALUES
(1, 'Menú del día', 'Ensalada mixta', 'Pollo a la parrilla', 'Helado de vainilla', 1, 'Pan casero', 25500.00),
(2, 'Menú gourmet', 'Carpaccio de salmón', 'Lomo Wellington', 'Tarta de frutas', 2, 'Copa de vino', 45750.00),
(3, 'Menú ejecutivo', 'Sopa de verduras', 'Filete de salmón', 'Mousse de chocolate', 4, 'Pan tostado', 38500.00),
(4, 'Menú infantil', 'Hamburguesa', 'Papas fritas', 'Helado de chocolate', 3, 'Refresco de naranja', 20750.00),
(5, 'Menú vegetariano', 'Ensalada de quinoa', 'Tofu a la plancha', 'Fruta fresca', 1, 'Agua con limón', 32000.00),
(6, 'Menú mediterráneo', 'Gazpacho', 'Paella mixta', 'Crema catalana', 2, 'Copa de vino blanco', 42250.00),
(7, 'Menú oriental', 'Rolls de sushi variados', 'Pollo teriyaki', 'Mochi de matcha', 5, 'Té verde', 36900.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(10) NOT NULL,
  `idCliente` int(3) NOT NULL,
  `idMenu` int(3) NOT NULL,
  `cantidadMenues` int(2) NOT NULL,
  `precioPedido` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `idCliente`, `idMenu`, `cantidadMenues`, `precioPedido`) VALUES
(1, 1, 1, 2, 51000.00),
(2, 2, 2, 1, 45750.00),
(3, 3, 1, 3, 76500.00),
(4, 1, 1, 2, 51000.00),
(5, 2, 2, 1, 45750.00),
(6, 3, 1, 3, 76500.00),
(7, 4, 3, 2, 57000.00),
(8, 1, 4, 1, 42250.00),
(9, 2, 5, 2, 73800.00),
(10, 3, 2, 1, 45750.00),
(11, 4, 1, 4, 102000.00),
(12, 1, 3, 3, 85500.00),
(13, 2, 4, 1, 42250.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `idPuesto` int(1) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `sueldo` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`idPuesto`, `nombre`, `sueldo`) VALUES
(1, 'Camarero', 980000.00),
(2, 'Chef', 800000.00),
(3, 'Cajero', 750000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `idReserva` int(4) NOT NULL,
  `nroMesa` int(2) NOT NULL,
  `cantPersonas` int(2) NOT NULL,
  `idCliente` int(3) NOT NULL,
  `senia` float(7,2) NOT NULL,
  `fecha` datetime NOT NULL,
  `idTurno` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`idReserva`, `nroMesa`, `cantPersonas`, `idCliente`, `senia`, `fecha`, `idTurno`) VALUES
(1, 5, 4, 4, 20000.00, '2024-06-22 20:00:00', 1),
(2, 7, 6, 3, 30000.00, '2024-06-23 19:30:00', 2),
(3, 2, 2, 2, 10000.00, '2024-06-24 21:00:00', 3),
(4, 3, 4, 1, 15000.00, '2024-06-22 19:00:00', 1),
(5, 6, 2, 2, 10000.00, '2024-06-23 20:30:00', 2),
(6, 1, 6, 3, 25000.00, '2024-06-24 21:00:00', 3),
(7, 4, 3, 4, 18000.00, '2024-06-25 18:00:00', 1),
(8, 5, 5, 1, 20000.00, '2024-06-26 19:30:00', 2),
(9, 2, 2, 2, 10000.00, '2024-06-27 20:00:00', 3),
(10, 7, 8, 3, 30000.00, '2024-06-28 19:00:00', 1),
(11, 8, 4, 4, 16000.00, '2024-06-29 20:30:00', 2),
(12, 9, 3, 1, 15000.00, '2024-06-30 21:00:00', 3),
(13, 10, 6, 2, 20000.00, '2024-07-01 18:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `idTurno` int(1) NOT NULL,
  `turno` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`idTurno`, `turno`) VALUES
(1, 'Mañana'),
(2, 'Tarde'),
(3, 'Noche');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  ADD PRIMARY KEY (`idBebida`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `idPuesto` (`idPuesto`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `menues`
--
ALTER TABLE `menues`
  ADD PRIMARY KEY (`idMenu`),
  ADD KEY `idBebida` (`idBebida`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idMenu` (`idMenu`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`idPuesto`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idTurno` (`idTurno`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`idTurno`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  MODIFY `idBebida` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFactura` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `menues`
--
ALTER TABLE `menues`
  MODIFY `idMenu` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `idPuesto` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `idReserva` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `idTurno` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`idPuesto`) REFERENCES `puestos` (`idPuesto`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`);

--
-- Filtros para la tabla `menues`
--
ALTER TABLE `menues`
  ADD CONSTRAINT `menues_ibfk_1` FOREIGN KEY (`idBebida`) REFERENCES `bebidas` (`idBebida`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idMenu`) REFERENCES `menues` (`idMenu`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`idTurno`) REFERENCES `turnos` (`idTurno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
