-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2024 a las 04:33:02
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
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(3) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` int(10) NOT NULL,
  `correo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombre`, `apellido`, `telefono`, `correo`) VALUES
(1, 'Juan', 'Pérez', 1122336644, 'juan.perez@example.com'),
(2, 'María', 'Gómez', 1177884455, 'maria.gomez@example.com'),
(3, 'Luis', 'Rodríguez', 1144885522, 'luis.rodriguez@example.com'),
(4, 'Ana', 'García', 1133662255, 'ana.garcia@example.com'),
(5, 'Carlos', 'Fernández', 1188445599, 'carlos.fernandez@example.com');

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
(1, 'Calle Principal 123', 'Pedro', 'Martínez', 12145678, 1122334455, 1),
(2, 'Avenida Central 456', 'Ana', 'López', 87651321, 2147483647, 2),
(3, 'Calle Secundaria 789', 'Laura', 'Gutiérrez', 98765432, 1158846991, 2),
(4, 'Avenida Norte 345', 'David', 'López', 87654321, 1188992233, 1),
(5, 'Calle Este 678', 'Sofía', 'Martín', 56789012, 1144558866, 2);

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
(1, 1, 50.00, '2024-06-18 15:00:00'),
(2, 2, 75.00, '2024-06-18 17:30:00'),
(3, 3, 100.00, '2024-06-19 16:15:00'),
(4, 4, 120.00, '2024-06-19 17:45:00'),
(5, 5, 80.00, '2024-06-19 19:00:00');

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
  `degustacionBebidas` varchar(30) NOT NULL,
  `adicional` varchar(30) NOT NULL,
  `precioUnitario` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `menues`
--

INSERT INTO `menues` (`idMenu`, `nombre`, `entrada`, `platoPrincipal`, `postre`, `degustacionBebidas`, `adicional`, `precioUnitario`) VALUES
(1, 'Menú Ejecutivo', 'Ensalada', 'Filete de Salmón', 'Tarta de Manzana', 'Vino tinto', 'Café', 25.00),
(2, 'Menú Infantil', 'Croquetas', 'Pechuga de Pollo', 'Helado', 'Jugo de Frutas', 'Galletas', 15.00),
(3, 'Menú Vegetariano', 'Crema de Calabaza', 'Risotto de Champiñones', 'Fruta Fresca', 'Agua Mineral', 'Té Verde', 20.00),
(4, 'Menú Ejecutivo 2', 'Sopa de Verduras', 'Lomo a la Pimienta', 'Mousse de Chocolate', 'Vino Blanco', 'Café', 30.00),
(5, 'Menú Infantil 2', 'Nuggets de Pollo', 'Puré de Papas', 'Gelatina', 'Jugo de Naranja', 'Galletas', 15.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(3) NOT NULL,
  `idCliente` int(3) NOT NULL,
  `idMenu` int(3) NOT NULL,
  `cantMenues` int(2) NOT NULL,
  `precioPedido` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `idCliente`, `idMenu`, `cantMenues`, `precioPedido`) VALUES
(1, 1, 1, 2, 50.00),
(2, 2, 2, 3, 45.00),
(3, 3, 3, 5, 100.00),
(4, 4, 4, 4, 120.00),
(5, 5, 5, 3, 45.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `idPuesto` int(1) NOT NULL,
  `nombrePuesto` varchar(30) NOT NULL,
  `sueldo` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`idPuesto`, `nombrePuesto`, `sueldo`) VALUES
(1, 'Chef', 3000.00),
(2, 'Camarero', 2000.00),
(3, 'Barman', 1800.00),
(4, 'Recepcionista', 1500.00);

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
  `fechahora` datetime NOT NULL,
  `idTurno` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`idReserva`, `nroMesa`, `cantPersonas`, `idCliente`, `senia`, `fechahora`, `idTurno`) VALUES
(1, 5, 4, 1, 50.00, '2024-06-20 19:00:00', 1),
(2, 3, 2, 2, 30.00, '2024-06-21 20:30:00', 2),
(3, 8, 3, 3, 30.00, '2024-06-20 18:30:00', 2),
(4, 12, 6, 4, 50.00, '2024-06-21 19:00:00', 1),
(5, 6, 2, 5, 20.00, '2024-06-22 20:00:00', 2);

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
(1, 'Almuerzo'),
(2, 'Cena');

--
-- Índices para tablas volcadas
--

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
  ADD PRIMARY KEY (`idFactura`);

--
-- Indices de la tabla `menues`
--
ALTER TABLE `menues`
  ADD PRIMARY KEY (`idMenu`);

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
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFactura` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `menues`
--
ALTER TABLE `menues`
  MODIFY `idMenu` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `idPuesto` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `idReserva` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `idTurno` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`idPuesto`) REFERENCES `puestos` (`idPuesto`);

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
