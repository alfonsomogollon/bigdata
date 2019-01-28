-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-01-2019 a las 11:59:52
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lavanderia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cesta`
--

CREATE TABLE `cesta` (
  `id_cesta` int(11) NOT NULL,
  `limpieza_cesta` enum('limpia','sucia','','') NOT NULL,
  `peso_cesta` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `cif_cliente` varchar(255) NOT NULL,
  `nombre_empresa_cliente` varchar(255) NOT NULL,
  `direccion_cliente` varchar(255) NOT NULL,
  `ciudad_cliente` varchar(255) NOT NULL,
  `pais_cliente` varchar(255) NOT NULL,
  `telefono_cliente` int(11) NOT NULL,
  `email_cliente` varchar(255) NOT NULL,
  `nombre_responsable_cliente` varchar(255) NOT NULL,
  `tipo_empresa_cliente` enum('hosteleria','hospital','fabrica','otros') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumo`
--

CREATE TABLE `consumo` (
  `unidades_consumo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `nombre_departamento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flujo_lavado`
--

CREATE TABLE `flujo_lavado` (
  `id_flujo_lavado` int(11) NOT NULL,
  `inicio_flujo_lavado` datetime NOT NULL,
  `fin_flujo_lavado` datetime NOT NULL,
  `fk_id_posicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lavanderia`
--

CREATE TABLE `lavanderia` (
  `id_lavanderia` int(11) NOT NULL,
  `nombre_lavanderia` varchar(255) NOT NULL,
  `direccion_lavanderia` varchar(255) NOT NULL,
  `ciudad_lavanderia` varchar(255) NOT NULL,
  `pais_lavanderia` varchar(255) NOT NULL,
  `telefono_lavanderia` varchar(255) NOT NULL,
  `email_lavanderia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m_cesta_ropa`
--

CREATE TABLE `m_cesta_ropa` (
  `fk_id_cesta` int(11) NOT NULL,
  `fk_id_ropa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m_cliente_cesta`
--

CREATE TABLE `m_cliente_cesta` (
  `fk_id_cliente` int(11) NOT NULL,
  `fk_id_cesta` int(11) NOT NULL,
  `fk_id_transporte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m_consumo_posicion`
--

CREATE TABLE `m_consumo_posicion` (
  `fk_unidades_consumo` int(11) NOT NULL,
  `fk_id_posicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m_paquete_flujo`
--

CREATE TABLE `m_paquete_flujo` (
  `fk_id_paquete` int(11) NOT NULL,
  `fk_id_flujo_lavado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m_producto_consumo`
--

CREATE TABLE `m_producto_consumo` (
  `fk_id_producto` int(11) NOT NULL,
  `fk_unidades_consumo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m_proveedor_producto`
--

CREATE TABLE `m_proveedor_producto` (
  `fk_id_proveedor` int(11) NOT NULL,
  `fk_id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m_ropa_paquete`
--

CREATE TABLE `m_ropa_paquete` (
  `fk_id_ropa` int(11) NOT NULL,
  `fk_id_paquete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `id_paquete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posicion`
--

CREATE TABLE `posicion` (
  `id_posicion` int(11) NOT NULL,
  `fk_id_lavanderia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `tipo_producto` varchar(255) NOT NULL,
  `subtipo_producto` varchar(255) NOT NULL,
  `precio_producto` float NOT NULL,
  `cantidad_producto` int(11) NOT NULL,
  `fecha_producto` date NOT NULL,
  `nombre_producto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `cif_proveedor` varchar(255) NOT NULL,
  `nombre_proveedor` varchar(255) NOT NULL,
  `direccion_proveedor` varchar(255) NOT NULL,
  `ciudad_proveedor` varchar(255) NOT NULL,
  `telefono_proveedor` varchar(255) NOT NULL,
  `email_proveedor` varchar(255) NOT NULL,
  `pais_proveedor` varchar(255) NOT NULL,
  `moneda_proveedor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ropa`
--

CREATE TABLE `ropa` (
  `id_ropa` int(11) NOT NULL,
  `color_ropa` enum('blanca','color') NOT NULL,
  `estado_ropa` enum('bien','reparar','sustituir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `id_trabajador` int(11) NOT NULL,
  `nombre_trabajador` varchar(255) NOT NULL,
  `apellidos_trabajador` varchar(255) NOT NULL,
  `dni_trabajador` varchar(255) NOT NULL,
  `sueldo_trabajador` int(11) NOT NULL,
  `tipo_de_contrato_trabajador` enum('eventual','indefinido') NOT NULL,
  `fecha_inicio_trabajador` date NOT NULL,
  `fk_id_lavanderia` int(11) NOT NULL,
  `fk_id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte`
--

CREATE TABLE `transporte` (
  `id_transporte` int(11) NOT NULL,
  `entrada_ropa_transporte` datetime NOT NULL,
  `salida_ropa_transporte` datetime NOT NULL,
  `ubicacion_transporte` varchar(255) NOT NULL,
  `id_conductor_transporte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cesta`
--
ALTER TABLE `cesta`
  ADD PRIMARY KEY (`id_cesta`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `consumo`
--
ALTER TABLE `consumo`
  ADD PRIMARY KEY (`unidades_consumo`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `flujo_lavado`
--
ALTER TABLE `flujo_lavado`
  ADD PRIMARY KEY (`id_flujo_lavado`),
  ADD KEY `fk_id_posicion` (`fk_id_posicion`);

--
-- Indices de la tabla `lavanderia`
--
ALTER TABLE `lavanderia`
  ADD PRIMARY KEY (`id_lavanderia`);

--
-- Indices de la tabla `m_cesta_ropa`
--
ALTER TABLE `m_cesta_ropa`
  ADD KEY `fk_id_cesta` (`fk_id_cesta`),
  ADD KEY `fk_id_ropa` (`fk_id_ropa`);

--
-- Indices de la tabla `m_cliente_cesta`
--
ALTER TABLE `m_cliente_cesta`
  ADD KEY `fk_id_cliente` (`fk_id_cliente`),
  ADD KEY `fk_id_cesta` (`fk_id_cesta`),
  ADD KEY `fk_id_transporte` (`fk_id_transporte`);

--
-- Indices de la tabla `m_consumo_posicion`
--
ALTER TABLE `m_consumo_posicion`
  ADD KEY `fk_id_consumo` (`fk_unidades_consumo`),
  ADD KEY `fk_id_posicion` (`fk_id_posicion`);

--
-- Indices de la tabla `m_paquete_flujo`
--
ALTER TABLE `m_paquete_flujo`
  ADD KEY `fk_id_paquete` (`fk_id_paquete`),
  ADD KEY `m_paquete_flujo_ibfk_2` (`fk_id_flujo_lavado`);

--
-- Indices de la tabla `m_producto_consumo`
--
ALTER TABLE `m_producto_consumo`
  ADD KEY `fk_id_producto` (`fk_id_producto`),
  ADD KEY `fk_unidades_consumo` (`fk_unidades_consumo`);

--
-- Indices de la tabla `m_proveedor_producto`
--
ALTER TABLE `m_proveedor_producto`
  ADD KEY `fk_id_proveedor` (`fk_id_proveedor`),
  ADD KEY `fk_id_producto` (`fk_id_producto`);

--
-- Indices de la tabla `m_ropa_paquete`
--
ALTER TABLE `m_ropa_paquete`
  ADD KEY `fk_id_ropa` (`fk_id_ropa`),
  ADD KEY `m_ropa_paquete_ibfk_2` (`fk_id_paquete`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`id_paquete`);

--
-- Indices de la tabla `posicion`
--
ALTER TABLE `posicion`
  ADD PRIMARY KEY (`id_posicion`),
  ADD KEY `fk_id_lavanderia` (`fk_id_lavanderia`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `ropa`
--
ALTER TABLE `ropa`
  ADD PRIMARY KEY (`id_ropa`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`id_trabajador`),
  ADD KEY `fk_id_lavanderia` (`fk_id_lavanderia`),
  ADD KEY `fk_id_departamento` (`fk_id_departamento`);

--
-- Indices de la tabla `transporte`
--
ALTER TABLE `transporte`
  ADD PRIMARY KEY (`id_transporte`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cesta`
--
ALTER TABLE `cesta`
  MODIFY `id_cesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `flujo_lavado`
--
ALTER TABLE `flujo_lavado`
  MODIFY `id_flujo_lavado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lavanderia`
--
ALTER TABLE `lavanderia`
  MODIFY `id_lavanderia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paquete`
--
ALTER TABLE `paquete`
  MODIFY `id_paquete` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ropa`
--
ALTER TABLE `ropa`
  MODIFY `id_ropa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `id_trabajador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transporte`
--
ALTER TABLE `transporte`
  MODIFY `id_transporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `flujo_lavado`
--
ALTER TABLE `flujo_lavado`
  ADD CONSTRAINT `flujo_lavado_ibfk_1` FOREIGN KEY (`fk_id_posicion`) REFERENCES `posicion` (`id_posicion`);

--
-- Filtros para la tabla `m_cesta_ropa`
--
ALTER TABLE `m_cesta_ropa`
  ADD CONSTRAINT `m_cesta_ropa_ibfk_1` FOREIGN KEY (`fk_id_cesta`) REFERENCES `cesta` (`id_cesta`),
  ADD CONSTRAINT `m_cesta_ropa_ibfk_2` FOREIGN KEY (`fk_id_ropa`) REFERENCES `ropa` (`id_ropa`);

--
-- Filtros para la tabla `m_cliente_cesta`
--
ALTER TABLE `m_cliente_cesta`
  ADD CONSTRAINT `m_cliente_cesta_ibfk_1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `m_cliente_cesta_ibfk_2` FOREIGN KEY (`fk_id_cesta`) REFERENCES `cesta` (`id_cesta`),
  ADD CONSTRAINT `m_cliente_cesta_ibfk_3` FOREIGN KEY (`fk_id_transporte`) REFERENCES `transporte` (`id_transporte`);

--
-- Filtros para la tabla `m_consumo_posicion`
--
ALTER TABLE `m_consumo_posicion`
  ADD CONSTRAINT `m_consumo_posicion_ibfk_1` FOREIGN KEY (`fk_unidades_consumo`) REFERENCES `consumo` (`unidades_consumo`),
  ADD CONSTRAINT `m_consumo_posicion_ibfk_2` FOREIGN KEY (`fk_id_posicion`) REFERENCES `posicion` (`id_posicion`);

--
-- Filtros para la tabla `m_paquete_flujo`
--
ALTER TABLE `m_paquete_flujo`
  ADD CONSTRAINT `m_paquete_flujo_ibfk_1` FOREIGN KEY (`fk_id_paquete`) REFERENCES `paquete` (`id_paquete`),
  ADD CONSTRAINT `m_paquete_flujo_ibfk_2` FOREIGN KEY (`fk_id_flujo_lavado`) REFERENCES `flujo_lavado` (`id_flujo_lavado`);

--
-- Filtros para la tabla `m_producto_consumo`
--
ALTER TABLE `m_producto_consumo`
  ADD CONSTRAINT `m_producto_consumo_ibfk_1` FOREIGN KEY (`fk_id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `m_producto_consumo_ibfk_2` FOREIGN KEY (`fk_unidades_consumo`) REFERENCES `consumo` (`unidades_consumo`);

--
-- Filtros para la tabla `m_proveedor_producto`
--
ALTER TABLE `m_proveedor_producto`
  ADD CONSTRAINT `m_proveedor_producto_ibfk_1` FOREIGN KEY (`fk_id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  ADD CONSTRAINT `m_proveedor_producto_ibfk_2` FOREIGN KEY (`fk_id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `m_ropa_paquete`
--
ALTER TABLE `m_ropa_paquete`
  ADD CONSTRAINT `m_ropa_paquete_ibfk_1` FOREIGN KEY (`fk_id_ropa`) REFERENCES `ropa` (`id_ropa`),
  ADD CONSTRAINT `m_ropa_paquete_ibfk_2` FOREIGN KEY (`fk_id_paquete`) REFERENCES `paquete` (`id_paquete`);

--
-- Filtros para la tabla `posicion`
--
ALTER TABLE `posicion`
  ADD CONSTRAINT `posicion_ibfk_1` FOREIGN KEY (`fk_id_lavanderia`) REFERENCES `lavanderia` (`id_lavanderia`);

--
-- Filtros para la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD CONSTRAINT `trabajador_ibfk_1` FOREIGN KEY (`fk_id_lavanderia`) REFERENCES `lavanderia` (`id_lavanderia`),
  ADD CONSTRAINT `trabajador_ibfk_2` FOREIGN KEY (`fk_id_departamento`) REFERENCES `departamento` (`id_departamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
