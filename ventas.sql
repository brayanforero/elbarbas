-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-12-2020 a las 12:44:51
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id14590551_ventas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`id14590551_brayan`@`%` PROCEDURE `reset_box` ()  BEGIN
	DECLARE _id_box INT;
	SET _id_box = (SELECT codigo FROM usuarios ORDER BY codigo DESC LIMIT 1);
	IF _id_box = 0 THEN
    	SET _id_box = 1;
     END IF;
     
    INSERT INTO cajas VALUES (NULL,concat('CAJA::',_id_box),concat('CAJA::',_id_box),_id_box);		
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonoscreditos`
--

CREATE TABLE `abonoscreditos` (
  `codabono` int(11) NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` int(11) NOT NULL,
  `montoabono` float(12,2) NOT NULL,
  `fechaabono` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `codcaja` int(11) NOT NULL,
  `nrocaja` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombrecaja` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`codcaja`, `nrocaja`, `nombrecaja`, `codigo`) VALUES
(1, '1', 'CAJA PRINCIPAL', 1),
(2, 'CAJA 2', 'CAJA 2', 2),
(3, 'CAJA::3', 'CAJA::3', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `codcategoria` int(11) NOT NULL,
  `nomcategoria` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`codcategoria`, `nomcategoria`) VALUES
(1, 'BEBIDAS'),
(2, 'HOLA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `codcliente` int(11) NOT NULL,
  `cedcliente` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomcliente` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfcliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emailcliente` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`codcliente`, `cedcliente`, `nomcliente`, `direccliente`, `tlfcliente`, `emailcliente`) VALUES
(1, '1010100', 'CLIENTE RANDOM', 'CALLE #3 COLON', '(0277) 2912343', 'CORREO@CORREO.COM'),
(2, '1803071654', 'JUAN PEREZ', 'ECUADOR', '(4151) 654', 'JUAN@EMAIL.COM'),
(3, '101010101', 'DIEGO', 'TARIJA', '(7111) 11111', 'DIEGO@GMAIL.COM'),
(4, '20202020', 'ISAAC', 'POTOSI', '(7222) 22', 'ISAAC@GMAIL.COM'),
(5, '0303303', 'LEONARDO', 'SUCRE', '(7555) 555', 'LEO@GMAIL.COM'),
(6, '47006656', 'MARCOS', 'VCVCDSSD', '(3323) 233232', ''),
(7, '001145455', '4444444', '44444', '(0422) 1441', 'SDASD@GAMIL.COM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `codcompra` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codseriec` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codautorizacionc` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `lote` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` int(11) NOT NULL,
  `subtotalivasic` float(12,2) NOT NULL,
  `subtotalivanoc` float(12,2) NOT NULL,
  `ivac` float(12,2) NOT NULL,
  `totalivac` float(12,2) NOT NULL,
  `descuentoc` float(12,2) NOT NULL,
  `totaldescuentoc` float(12,2) NOT NULL,
  `totalc` float(12,2) NOT NULL,
  `tipocompra` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `formacompra` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechavencecredito` date NOT NULL,
  `statuscompra` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechacompra` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`codcompra`, `codseriec`, `codautorizacionc`, `lote`, `codproveedor`, `subtotalivasic`, `subtotalivanoc`, `ivac`, `totalivac`, `descuentoc`, `totaldescuentoc`, `totalc`, `tipocompra`, `formacompra`, `fechavencecredito`, `statuscompra`, `fechacompra`, `codigo`) VALUES
('10101010', '02020202', '03030303', 'L000002', 1, 15000.00, 0.00, 16.00, 2400.00, 10.00, 1740.00, 15660.00, 'CONTADO', 'EFECTIVO', '0000-00-00', 'PAGADA', '2020-11-26 09:18:25', 3),
('90', '55', '34', 'L000001', 1, 0.00, 280.00, 16.00, 0.00, 9.00, 25.20, 254.80, 'CONTADO', 'EFECTIVO', '0000-00-00', 'PAGADA', '2020-11-26 12:07:33', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `rifempresa` varchar(25) CHARACTER SET latin1 NOT NULL,
  `nomempresa` varchar(100) CHARACTER SET latin1 NOT NULL,
  `direcempresa` varchar(100) CHARACTER SET latin1 NOT NULL,
  `tlfempresa` varchar(20) CHARACTER SET latin1 NOT NULL,
  `cedresponsable` varchar(25) CHARACTER SET latin1 NOT NULL,
  `nomresponsable` varchar(100) CHARACTER SET latin1 NOT NULL,
  `correoresponsable` varchar(70) CHARACTER SET latin1 NOT NULL,
  `tlfresponsable` varchar(20) CHARACTER SET latin1 NOT NULL,
  `ivac` float(12,2) NOT NULL,
  `ivav` float(12,2) NOT NULL,
  `ivas` float(12,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `rifempresa`, `nomempresa`, `direcempresa`, `tlfempresa`, `cedresponsable`, `nomresponsable`, `correoresponsable`, `tlfresponsable`, `ivac`, `ivav`, `ivas`) VALUES
(1, '0000000000', 'COMERCIALIZADORA EL BARBAS', 'DIRECCION EMPRESA', '(000) 0000000', '0000000000', 'SIOMARA DE ZAMBRANO', 'CORREO@GMAIL.COM', '(0424) 7740251', 16.00, 16.00, 16.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompras`
--

CREATE TABLE `detallecompras` (
  `coddetallecompra` int(11) NOT NULL,
  `codcompra` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `cantcompra` int(15) NOT NULL,
  `precio1` float(12,2) NOT NULL,
  `precio2` float(12,2) NOT NULL,
  `ivaproductoc` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `importecompra` float(12,2) NOT NULL,
  `lote` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `vence` date NOT NULL,
  `fechadetallecompra` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `detallecompras`
--

INSERT INTO `detallecompras` (`coddetallecompra`, `codcompra`, `codproducto`, `producto`, `codcategoria`, `cantcompra`, `precio1`, `precio2`, `ivaproductoc`, `importecompra`, `lote`, `vence`, `fechadetallecompra`, `codigo`) VALUES
(1, '90', '566', 'LECHED', 1, 56, 5.00, 8.00, 'NO', 280.00, 'L000001', '2020-11-28', '2020-11-26 12:07:33', 3),
(2, '10101010', '101010', 'RON', 1, 100, 150.00, 200.00, 'SI', 15000.00, 'L000002', '2020-12-31', '2020-11-26 09:18:25', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalledevolucion`
--

CREATE TABLE `detalledevolucion` (
  `coddetalledevolucion` int(11) NOT NULL,
  `coddevolucion` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` int(11) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `cantdevolucion` int(15) NOT NULL,
  `lotedevolucion` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `preciodevolucion` float(12,2) NOT NULL,
  `importe` float(12,2) NOT NULL,
  `fechadetalledevolucion` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedidos`
--

CREATE TABLE `detallepedidos` (
  `coddetallepedido` int(11) NOT NULL,
  `codpedido` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `cantpedido` int(5) NOT NULL,
  `fechadetallepedido` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleservicios`
--

CREATE TABLE `detalleservicios` (
  `coddetalleservicio` int(11) NOT NULL,
  `codservicio` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` int(11) NOT NULL,
  `coditems` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantservicio` int(5) NOT NULL,
  `precioservicio` float(12,2) NOT NULL,
  `importe` float(12,2) NOT NULL,
  `fechadetalleservicio` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventas`
--

CREATE TABLE `detalleventas` (
  `coddetalleventa` int(11) NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` int(11) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `cantventa` int(15) NOT NULL,
  `preciocompra` float(12,2) NOT NULL,
  `precioventa` float(12,2) NOT NULL,
  `ivaproducto` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `importe` float(12,2) NOT NULL,
  `importe2` float(12,2) NOT NULL,
  `fechadetalleventa` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `detalleventas`
--

INSERT INTO `detalleventas` (`coddetalleventa`, `codventa`, `codcliente`, `codproducto`, `producto`, `codcategoria`, `cantventa`, `preciocompra`, `precioventa`, `ivaproducto`, `importe`, `importe2`, `fechadetalleventa`, `codigo`) VALUES
(1, '2020-CAJA 2-V00001', 1, 'PAÑALES', 'PAÑALES', 1, 8, 2.00, 2000.00, 'SI', 16000.00, 16.00, '2020-11-18 10:35:55', 2),
(2, '2020-CAJA::3-V00001', 3, '101010', 'RON', 1, 20, 100.00, 150.00, 'SI', 3000.00, 2000.00, '2020-11-26 09:22:11', 3),
(3, '2020-CAJA::3-V00002', 4, '101010', 'RON', 1, 180, 100.00, 150.00, 'SI', 27000.00, 18000.00, '2020-11-26 09:27:28', 3),
(4, '2020-CAJA::3-V00003', 2, '566', 'LECHED', 1, 1, 56.00, 5.00, 'NO', 5.00, 56.00, '2020-11-26 07:43:29', 3),
(5, '2020-CAJA::3-V00004', 6, '7840033004513', 'LIMPIADOR DE PANTALLAS', 1, 10, 20000.00, 30000.00, 'SI', 300000.00, 200000.00, '2020-12-01 05:59:13', 3),
(6, '2020-CAJA 2-V00002', 6, '7840033004513', 'LIMPIADOR DE PANTALLAS', 1, 2, 20000.00, 30000.00, 'SI', 60000.00, 40000.00, '2020-12-01 06:12:51', 2),
(7, '2020-CAJA 2-V00003', 6, '7840033004513', 'LIMPIADOR DE PANTALLAS', 1, 1, 20000.00, 30000.00, 'SI', 30000.00, 20000.00, '2020-12-01 06:29:16', 2),
(8, '2020-CAJA 2-V00003', 6, 'PAÑALES', 'PAÑALES', 1, 1, 2.00, 2000.00, 'SI', 2000.00, 2.00, '2020-12-01 06:29:16', 2),
(9, '2020-CAJA::3-V00005', 3, 'PAÑALES', 'PAÑALES', 1, 1, 2.00, 2000.00, 'SI', 2000.00, 2.00, '2020-12-01 11:38:30', 3),
(10, '2020-CAJA::3-V00005', 3, '7840033004513', 'LIMPIADOR DE PANTALLAS', 1, 1, 20000.00, 30000.00, 'SI', 30000.00, 20000.00, '2020-12-01 11:38:30', 3),
(11, '2020--V00001', 3, '7840033004513', 'LIMPIADOR DE PANTALLAS', 1, 12, 20000.00, 30000.00, 'SI', 360000.00, 240000.00, '2020-12-01 11:39:42', 3),
(12, '2020-CAJA::3-V00006', 3, '7840033004513', 'LIMPIADOR DE PANTALLAS', 1, 1, 20000.00, 30000.00, 'SI', 30000.00, 20000.00, '2020-12-01 11:42:42', 3),
(13, '2020-CAJA::3-V00007', 7, '7840033004513', 'LIMPIADOR DE PANTALLAS', 1, 1, 20000.00, 30000.00, 'SI', 30000.00, 20000.00, '2020-12-02 12:00:16', 3);

--
-- Disparadores `detalleventas`
--
DELIMITER $$
CREATE TRIGGER `tg_detalleventas_BI` BEFORE INSERT ON `detalleventas` FOR EACH ROW BEGIN
        DECLARE cantidad INT;
        
        SET cantidad = (SELECT existencia FROM productos AS pro WHERE codproducto = NEW.codproducto);
        
        IF NEW.cantventa > cantidad THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cantidad insuficente para la venta';
		END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `iddevolucion` int(11) NOT NULL,
  `coddevolucion` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcaja` int(11) NOT NULL,
  `codproveedor` int(11) NOT NULL,
  `subtotald` float(12,2) NOT NULL,
  `ivad` int(2) NOT NULL,
  `totalivad` float(12,2) NOT NULL,
  `totald` float(12,2) NOT NULL,
  `fechadevolucion` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `iditems` int(11) NOT NULL,
  `coditems` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombreitems` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `costoitems` float(12,2) NOT NULL,
  `statusitems` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`iditems`, `coditems`, `nombreitems`, `costoitems`, `statusitems`) VALUES
(1, 'SDASDASD', 'SADASDASDAS', 12312.00, 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `codkardex` int(11) NOT NULL,
  `codproceso` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `codresponsable` int(11) NOT NULL,
  `codproducto` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `movimiento` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `entradas` int(5) NOT NULL,
  `salidas` int(5) NOT NULL,
  `stockactual` int(10) NOT NULL,
  `preciounit` float(12,2) NOT NULL,
  `costototal` float(12,2) NOT NULL,
  `documento` text COLLATE utf8_spanish_ci NOT NULL,
  `fechakardex` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`codkardex`, `codproceso`, `codresponsable`, `codproducto`, `movimiento`, `entradas`, `salidas`, `stockactual`, `preciounit`, `costototal`, `documento`, `fechakardex`) VALUES
(1, 'iyuU8KMLxf', 0, 'PAÑALES', 'ENTRADAS', 10, 0, 10, 2.50, 25.00, 'INVENTARIO INICIAL', '2020-11-16'),
(2, '2020-CAJA 2-V00001', 1, 'PAÑALES', 'SALIDAS', 0, 8, 7, 2000.00, 16000.00, 'VENTA - CONTADO - FACTURA: 2020-CAJA 2-V00001', '2020-11-18'),
(3, 'o4BIl5kXPj', 0, 'PRO01', 'ENTRADAS', 15, 0, 15, 8.00, 120.00, 'INVENTARIO INICIAL', '2020-11-26'),
(4, '90', 1, '566', 'ENTRADAS', 56, 0, 56, 5.00, 280.00, 'COMPRA - CONTADO - FACTURA: 90', '2020-11-26'),
(5, '10101010', 1, '101010', 'ENTRADAS', 100, 0, 100, 150.00, 15000.00, 'COMPRA - CONTADO - FACTURA: 10101010', '2020-11-26'),
(6, '2020-CAJA::3-V00001', 3, '101010', 'SALIDAS', 0, 20, 180, 150.00, 3000.00, 'VENTA - CONTADO - FACTURA: 2020-CAJA::3-V00001', '2020-11-26'),
(7, '2020-CAJA::3-V00002', 4, '101010', 'SALIDAS', 0, 180, 0, 150.00, 27000.00, 'VENTA - CONTADO - FACTURA: 2020-CAJA::3-V00002', '2020-11-26'),
(8, '2020-CAJA::3-V00003', 2, '566', 'SALIDAS', 0, 1, 7, 5.00, 5.00, 'VENTA - CONTADO - FACTURA: 2020-CAJA::3-V00003', '2020-11-26'),
(9, 'B0Cx5iRzpv', 0, '7840033004513', 'ENTRADAS', 10, 0, 10, 30000.00, 300000.00, 'INVENTARIO INICIAL', '2020-12-01'),
(10, '2020-CAJA::3-V00004', 6, '7840033004513', 'SALIDAS', 0, 10, 0, 30000.00, 300000.00, 'VENTA - CONTADO - FACTURA: 2020-CAJA::3-V00004', '2020-12-01'),
(11, '2020-CAJA 2-V00002', 6, '7840033004513', 'SALIDAS', 0, 2, 18, 30000.00, 60000.00, 'VENTA - CONTADO - FACTURA: 2020-CAJA 2-V00002', '2020-12-01'),
(12, '2020-CAJA 2-V00003', 6, '7840033004513', 'SALIDAS', 0, 1, 17, 30000.00, 30000.00, 'VENTA - CONTADO - FACTURA: 2020-CAJA 2-V00003', '2020-12-01'),
(13, '2020-CAJA 2-V00003', 6, 'PAÑALES', 'SALIDAS', 0, 1, 6, 2000.00, 2000.00, 'VENTA - CONTADO - FACTURA: 2020-CAJA 2-V00003', '2020-12-01'),
(14, '2020-CAJA::3-V00005', 3, 'PAÑALES', 'SALIDAS', 0, 1, 5, 2000.00, 2000.00, 'VENTA - CONTADO - FACTURA: 2020-CAJA::3-V00005', '2020-12-01'),
(15, '2020-CAJA::3-V00005', 3, '7840033004513', 'SALIDAS', 0, 1, 16, 30000.00, 30000.00, 'VENTA - CONTADO - FACTURA: 2020-CAJA::3-V00005', '2020-12-01'),
(16, '2020--V00001', 3, '7840033004513', 'SALIDAS', 0, 12, 4, 30000.00, 360000.00, 'VENTA - CONTADO - FACTURA: 2020--V00001', '2020-12-01'),
(17, '2020-CAJA::3-V00006', 3, '7840033004513', 'SALIDAS', 0, 1, 3, 30000.00, 30000.00, 'VENTA - CONTADO - FACTURA: 2020-CAJA::3-V00006', '2020-12-01'),
(18, '2020-CAJA::3-V00007', 7, '7840033004513', 'SALIDAS', 0, 1, 2, 30000.00, 30000.00, 'VENTA - CONTADO - FACTURA: 2020-CAJA::3-V00007', '2020-12-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tiempo` datetime DEFAULT NULL,
  `detalles` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `paginas` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`id`, `ip`, `tiempo`, `detalles`, `paginas`, `usuario`) VALUES
(1, '186.89.46.57', '2020-09-10 12:57:55', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '/SRPV/index.php', 'ADMINISTRADOR'),
(2, '186.89.57.3', '2020-10-01 03:25:05', 'Mozilla/5.0 (Windows NT 10.0; rv:81.0) Gecko/20100101 Firefox/81.0', '/SRPV/index.php', 'ADMINISTRADOR'),
(3, '186.89.57.3', '2020-10-01 03:27:40', 'Mozilla/5.0 (Windows NT 10.0; rv:81.0) Gecko/20100101 Firefox/81.0', '/SRPV/index.php', 'VENDEDOR'),
(4, '186.89.57.3', '2020-10-01 04:24:36', 'Mozilla/5.0 (Windows NT 10.0; rv:81.0) Gecko/20100101 Firefox/81.0', '/SRPV/index.php', 'ADMIN123'),
(5, '186.89.57.3', '2020-10-01 04:36:31', 'Mozilla/5.0 (Windows NT 10.0; rv:81.0) Gecko/20100101 Firefox/81.0', '/SRPV/index.php', 'ADMIN123'),
(6, '186.95.143.232', '2020-10-01 05:00:32', 'Mozilla/5.0 (Linux; Android 10; SAMSUNG SM-G9650) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/12.1 Chrome/79.0.3945.136 Mobile Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(7, '190.36.114.31', '2020-10-01 05:30:34', 'Mozilla/5.0 (Linux; Android 10; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.127 Mobile Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(8, '190.203.103.79', '2020-10-01 05:48:36', 'Mozilla/5.0 (Linux; Android 4.2.2; HUAWEI Y511-U251 Build/HUAWEIY511-U251) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.94 Mobile Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(9, '186.185.179.202', '2020-10-01 08:24:44', 'Mozilla/5.0 (Linux; Android 10; SAMSUNG SM-G9650) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/12.1 Chrome/79.0.3945.136 Mobile Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(10, '186.91.147.245', '2020-10-02 01:25:07', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(11, '186.89.63.198', '2020-10-14 10:45:50', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(12, '190.75.224.249', '2020-10-25 04:58:15', 'Mozilla/5.0 (Windows NT 10.0; rv:82.0) Gecko/20100101 Firefox/82.0', '/SRPV/index.php', 'VENDEDOR'),
(13, '190.75.245.139', '2020-11-06 07:57:01', 'Mozilla/5.0 (Linux; Android 10; SAMSUNG SM-G9650) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/12.1 Chrome/79.0.3945.136 Mobile Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(14, '186.91.131.22', '2020-11-09 10:18:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(15, '186.91.131.22', '2020-11-09 10:42:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(16, '186.91.131.22', '2020-11-09 11:46:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(17, '186.95.149.97', '2020-11-10 11:32:50', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(18, '190.203.124.135', '2020-11-10 04:03:42', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(19, '190.203.124.135', '2020-11-10 05:33:21', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(20, '190.203.124.135', '2020-11-10 10:06:46', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(21, '190.203.124.135', '2020-11-10 10:06:46', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(22, '190.203.124.135', '2020-11-11 12:40:04', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(23, '190.203.124.135', '2020-11-11 10:08:16', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(24, '190.203.124.135', '2020-11-11 10:08:16', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(25, '190.203.124.135', '2020-11-11 10:08:16', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(26, '190.203.124.135', '2020-11-11 10:08:17', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(27, '190.203.124.135', '2020-11-11 10:08:17', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(28, '190.203.124.135', '2020-11-11 10:08:17', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(29, '186.95.118.191', '2020-11-11 05:32:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(30, '190.203.98.149', '2020-11-12 10:01:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(31, '190.203.98.149', '2020-11-12 10:02:45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(32, '186.95.150.24', '2020-11-13 12:07:25', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(33, '186.95.150.24', '2020-11-13 12:07:25', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(34, '190.206.190.68', '2020-11-16 09:21:12', 'Mozilla/5.0 (Windows NT 10.0; rv:82.0) Gecko/20100101 Firefox/82.0', '/SRPV/index.php', 'ADMIN123'),
(35, '190.75.243.101', '2020-11-16 10:03:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(36, '190.75.243.101', '2020-11-16 10:08:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(37, '190.75.243.101', '2020-11-16 10:22:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(38, '190.75.243.101', '2020-11-16 10:29:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(39, '190.75.243.101', '2020-11-16 10:56:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(40, '190.75.243.101', '2020-11-16 11:05:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(41, '190.75.243.101', '2020-11-16 11:16:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(42, '190.75.243.101', '2020-11-16 11:17:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(43, '186.185.245.48', '2020-11-16 11:58:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(44, '186.95.113.91', '2020-11-16 12:09:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(45, '186.95.113.91', '2020-11-16 12:15:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(46, '186.95.113.91', '2020-11-16 02:16:15', 'Mozilla/5.0 (Linux; Android 10; SM-G9650) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Mobile Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(47, '186.95.113.91', '2020-11-16 02:16:20', 'Mozilla/5.0 (Linux; Android 10; SM-G9650) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Mobile Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(48, '186.95.113.91', '2020-11-16 02:20:06', 'Mozilla/5.0 (Linux; Android 9; moto g(6) play) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(49, '186.95.154.30', '2020-11-17 09:26:25', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(50, '186.95.154.30', '2020-11-17 08:36:31', 'Mozilla/5.0 (Linux; Android 10; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Mobile Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(51, '186.95.154.30', '2020-11-17 08:39:19', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(52, '186.95.154.30', '2020-11-17 08:40:02', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(53, '190.36.118.40', '2020-11-18 10:11:59', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(54, '190.36.118.40', '2020-11-18 10:24:31', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(55, '190.36.118.40', '2020-11-18 10:24:31', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(56, '190.36.118.40', '2020-11-18 10:31:31', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(57, '190.36.118.40', '2020-11-18 10:32:31', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(58, '190.36.118.40', '2020-11-18 10:38:29', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(59, '190.36.118.40', '2020-11-18 12:39:51', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(60, '190.36.118.40', '2020-11-18 02:05:40', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(61, '190.36.118.40', '2020-11-18 02:06:52', 'Mozilla/5.0 (Linux; Android 9; moto g(6) play) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(62, '186.89.43.246', '2020-11-21 01:05:42', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(63, '190.36.100.159', '2020-11-25 04:58:59', 'Mozilla/5.0 (Linux; Android 10; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Mobile Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(64, '190.36.100.159', '2020-11-25 05:00:14', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(65, '201.240.21.200', '2020-11-25 06:08:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(66, '201.240.21.200', '2020-11-25 06:44:39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(67, '181.198.131.73', '2020-11-25 07:29:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(68, '181.198.131.73', '2020-11-25 07:31:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(69, '190.233.151.25', '2020-11-25 09:05:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(70, '190.233.151.25', '2020-11-25 09:16:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(71, '190.233.151.25', '2020-11-25 11:45:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(72, '190.233.151.25', '2020-11-26 12:45:11', 'Mozilla/5.0 (Linux; Android 9; SM-A105M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Mobile Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(73, '190.233.151.25', '2020-11-26 12:45:48', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(74, '181.115.248.138', '2020-11-26 09:07:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(75, '181.115.248.138', '2020-11-26 09:07:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(76, '181.39.76.34', '2020-11-26 09:54:10', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 LightSpeed [FBAN/MessengerLiteForiOS;FBAV/291.2.0.30.111;FBBV/257403963;FBDV/iPhone9,2;FBMD/iPhone;FBSN/iOS;FBSV/13.5.1;FBSS/3;FBCR/;FBID/phone;FBLC/es;FBOP/0]', '/SRPV/index.php', 'ADMIN123'),
(77, '191.78.78.172', '2020-11-26 03:59:19', 'Mozilla/5.0 (Linux; Android 9; SM-G9600 Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/85.0.4183.127 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/285.0.0.17.119;]', '/SRPV/index.php', 'ADMIN123'),
(78, '191.78.78.172', '2020-11-26 04:20:34', 'Mozilla/5.0 (Linux; Android 9; SM-G9600 Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/85.0.4183.127 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/285.0.0.17.119;]', '/SRPV/index.php', 'ADMIN123'),
(79, '191.78.78.172', '2020-11-26 05:00:23', 'Mozilla/5.0 (Linux; Android 9; SM-G9600 Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/85.0.4183.127 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/285.0.0.17.119;]', '/SRPV/index.php', 'ADMIN123'),
(80, '191.78.78.172', '2020-11-26 05:25:55', 'Mozilla/5.0 (Linux; Android 9; SM-G9600 Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/85.0.4183.127 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/285.0.0.17.119;]', '/SRPV/index.php', 'ADMIN123'),
(81, '181.67.21.224', '2020-11-26 08:36:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(82, '190.232.205.28', '2020-11-27 11:14:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(83, '190.232.205.28', '2020-11-27 11:15:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/login.php', 'ADMIN123'),
(84, '181.67.35.51', '2020-11-27 11:31:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(85, '181.67.35.51', '2020-11-27 11:37:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(86, '190.238.55.108', '2020-11-29 10:46:25', 'Mozilla/5.0 (Linux; Android 10; JNY-LX2 Build/HUAWEIJNY-L22; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/282.0.0.10.119;]', '/SRPV/index.php', 'ADMIN123'),
(87, '181.33.167.32', '2020-12-01 02:37:33', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(88, '181.122.181.97', '2020-12-01 04:43:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(89, '181.122.181.97', '2020-12-01 05:08:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(90, '190.203.97.95', '2020-12-01 09:57:35', 'Mozilla/5.0 (Linux; Android 10; M2003J15SC Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/86.0.4240.198 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/291.2.0.22.114;]', '/SRPV/index.php', 'ADMIN123'),
(91, '186.169.157.116', '2020-12-01 11:31:10', 'Mozilla/5.0 (Linux; Android 10; SM-A605GN Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/87.0.4280.66 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/291.2.0.22.114;]', '/SRPV/index.php', 'ADMIN123'),
(92, '177.222.62.133', '2020-12-01 11:31:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(93, '177.222.62.133', '2020-12-01 11:43:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'VENDEDOR'),
(94, '177.222.62.133', '2020-12-01 11:44:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(95, '190.238.217.0', '2020-12-02 01:01:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(96, '200.68.158.74', '2020-12-02 09:57:23', 'Mozilla/5.0 (Linux; Android 10; SM-A750G Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/86.0.4240.198 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/291.2.0.22.114;]', '/SRPV/index.php', 'ADMIN123'),
(97, '190.36.104.12', '2020-12-02 03:30:23', 'Mozilla/5.0 (Linux; Android 10; M2003J15SC Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/86.0.4240.198 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/291.2.0.22.114;]', '/SRPV/index.php', 'ADMIN123'),
(98, '190.36.104.12', '2020-12-02 03:31:39', 'Mozilla/5.0 (Linux; Android 10; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Mobile Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(99, '190.36.104.12', '2020-12-02 03:32:02', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(100, '170.83.119.106', '2020-12-02 03:33:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(101, '93.67.74.198', '2020-12-02 03:38:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(102, '190.207.48.12', '2020-12-02 08:50:06', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '/SRPV/index.php', 'ADMIN123'),
(103, '190.203.115.41', '2020-12-03 01:06:31', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/SRPV/index.php', 'ADMIN123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `codpedido` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` int(11) NOT NULL,
  `fechapedido` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codalmacen` int(11) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `preciocompra` float(12,2) NOT NULL,
  `precioventa` float(12,2) NOT NULL,
  `existencia` int(15) NOT NULL,
  `stockminimo` int(5) NOT NULL,
  `codigobarra` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ubicacion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `statusproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codalmacen`, `codproducto`, `producto`, `codcategoria`, `preciocompra`, `precioventa`, `existencia`, `stockminimo`, `codigobarra`, `ubicacion`, `ivaproducto`, `statusproducto`) VALUES
(1, '001', 'SODA 300ML', 1, 2.00, 3.99, 1500, 2, '001', 'REFRIGERADORA', 'SI', 'ACTIVO'),
(2, 'PAÑALES', 'PAÑALES', 1, 2.00, 2000.00, 5, 1, 'PAÑALES', 'NEVERA', 'SI', 'ACTIVO'),
(3, 'PRO01', 'LECHE', 1, 4.00, 8.00, 15, 9, 'PRO01', 'AB', 'NO', 'ACTIVO'),
(4, '566', 'LECHED', 1, 56.00, 5.00, 7, 0, '566', 'SIN ASIGNACION', 'NO', 'ACTIVO'),
(5, '101010', 'RON', 1, 100.00, 150.00, 0, 0, '101010', 'SIN ASIGNACION', 'SI', 'ACTIVO'),
(6, '7840033004513', 'LIMPIADOR DE PANTALLAS', 1, 20000.00, 30000.00, 2, 5, '7840033004513', '', 'SI', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `codproveedor` int(11) NOT NULL,
  `ritproveedor` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomproveedor` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direcproveedor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfproveedor` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emailproveedor` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `contactoproveedor` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`codproveedor`, `ritproveedor`, `nomproveedor`, `direcproveedor`, `tlfproveedor`, `emailproveedor`, `contactoproveedor`) VALUES
(1, '5566', 'GHH', 'GHH', '(5555) 6666655', 'BAZG_18@GMAIL.COM', 'GGYYY');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retiroefectivo`
--

CREATE TABLE `retiroefectivo` (
  `codretiro` int(11) NOT NULL,
  `motivoretiro` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantretiro` float(12,2) NOT NULL,
  `fecharetiro` datetime NOT NULL,
  `codcaja` int(11) NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `retiroefectivo`
--

INSERT INTO `retiroefectivo` (`codretiro`, `motivoretiro`, `cantretiro`, `fecharetiro`, `codcaja`, `codigo`) VALUES
(1, 'JDJKSDJ', 30000.00, '2020-12-01 05:02:41', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idservicio` int(11) NOT NULL,
  `codservicio` varchar(30) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `codcaja` int(11) NOT NULL,
  `codcliente` int(11) NOT NULL,
  `subtotal` float(12,2) NOT NULL,
  `iva` int(5) NOT NULL,
  `totaliva` float(12,2) NOT NULL,
  `descuento` int(2) NOT NULL,
  `totaldescuento` float(12,2) NOT NULL,
  `totalpago` float(12,2) NOT NULL,
  `tipopago` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaservicio` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `codigo` int(11) NOT NULL,
  `cedula` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sexo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cargo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nivel` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `status` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`codigo`, `cedula`, `nombres`, `sexo`, `cargo`, `email`, `usuario`, `password`, `nivel`, `status`) VALUES
(1, '0000000000', 'ADMINISTRADOR PRINCIPAL', 'MASCULINO', 'ADMINISTRADOR', 'ADMINISTRADOR@GMAIL.COM', 'ADMINISTRADOR', 'ab3b31af882ca84dc79c137ea5a295f706b7a381', 'ADMINISTRADOR', 'ACTIVO'),
(2, '10101010', 'CHRISTIAN', 'MASCULINO', 'VENDEDOR', 'VENDEDOR@CORREO.COM', 'VENDEDOR', '3695be8839147c0c3fbe3b3a622c11406dac6580', 'VENDEDOR', 'ACTIVO'),
(3, '111111111', 'PRUEBA', 'MASCULINO', 'ADMINISTRADOR', 'CORREO@CORREO.COM', 'ADMIN123', 'ab3b31af882ca84dc79c137ea5a295f706b7a381', 'ADMINISTRADOR', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codserieve` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codautorizacionve` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcaja` int(11) NOT NULL,
  `codcliente` int(11) NOT NULL,
  `subtotalivasive` float(12,2) NOT NULL,
  `subtotalivanove` float(12,2) NOT NULL,
  `ivave` int(2) NOT NULL,
  `totalivave` float(12,2) NOT NULL,
  `descuentove` int(2) NOT NULL,
  `totaldescuentove` float(12,2) NOT NULL,
  `totalpago` float(12,2) NOT NULL,
  `totalpago2` float(12,2) NOT NULL,
  `tipopagove` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `formapagove` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montopagado` float(12,2) NOT NULL,
  `montodevuelto` float(12,2) NOT NULL,
  `fechavencecredito` date NOT NULL,
  `statusventa` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `fechaventa` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idventa`, `codventa`, `codserieve`, `codautorizacionve`, `codcaja`, `codcliente`, `subtotalivasive`, `subtotalivanove`, `ivave`, `totalivave`, `descuentove`, `totaldescuentove`, `totalpago`, `totalpago2`, `tipopagove`, `formapagove`, `montopagado`, `montodevuelto`, `fechavencecredito`, `statusventa`, `fechaventa`, `codigo`) VALUES
(14, '2020-CAJA 2-V00001', '18112020-CAJA 2-V00001', 'VAHXF-2020-CAJA 2-V00001', 2, 1, 16000.00, 0.00, 16, 2560.00, 0, 0.00, 18560.00, 2.00, 'CONTADO', 'EFECTIVO', 20000.00, 1440.00, '0000-00-00', 'PAGADA', '2020-11-18 10:35:55', 2),
(17, '2020-CAJA::3-V00001', '26112020-CAJA::3-V00001', 'VAHXF-2020-CAJA::3-V00001', 3, 3, 3000.00, 0.00, 16, 480.00, 10, 348.00, 3132.00, 100.00, 'CONTADO', 'EFECTIVO', 3400.00, -80.00, '0000-00-00', 'PAGADA', '2020-11-26 09:22:11', 3),
(18, '2020-CAJA::3-V00002', '26112020-CAJA::3-V00002', 'VAHXF-2020-CAJA::3-V00002', 3, 4, 27000.00, 0.00, 16, 4320.00, 0, 0.00, 31320.00, 100.00, 'CONTADO', 'EFECTIVO', 31320.00, 0.00, '0000-00-00', 'PAGADA', '2020-11-26 09:27:28', 3),
(19, '2020-CAJA::3-V00003', '26112020-CAJA::3-V00003', 'VAHXF-2020-CAJA::3-V00003', 3, 2, 0.00, 5.00, 16, 0.00, 10, 0.50, 4.50, 56.00, 'CONTADO', 'EFECTIVO', 10.00, 5.00, '0000-00-00', 'PAGADA', '2020-11-26 07:43:29', 3),
(20, '2020-CAJA::3-V00004', '01122020-CAJA::3-V00004', 'VAHXF-2020-CAJA::3-V00004', 3, 6, 300000.00, 0.00, 16, 48000.00, 10, 34800.00, 313200.00, 20000.00, 'CONTADO', 'EFECTIVO', 50000.00, -298000.00, '0000-00-00', 'PAGADA', '2020-12-01 05:59:13', 3),
(21, '2020-CAJA 2-V00002', '01122020-CAJA 2-V00002', 'VAHXF-2020-CAJA 2-V00002', 2, 6, 60000.00, 0.00, 16, 9600.00, 0, 0.00, 69600.00, 20000.00, 'CONTADO', 'EFECTIVO', 100000.00, 30400.00, '0000-00-00', 'PAGADA', '2020-12-01 06:12:51', 2),
(22, '2020-CAJA 2-V00003', '01122020-CAJA 2-V00002', 'VAHXF-2020-CAJA 2-V00003', 2, 6, 32000.00, 0.00, 16, 5120.00, 10, 3712.00, 33408.00, 20002.00, 'CONTADO', 'EFECTIVO', 50000.00, 15200.00, '0000-00-00', 'PAGADA', '2020-12-01 06:29:16', 2),
(23, '2020-CAJA::3-V00005', '01122020-CAJA::3-V00004', 'VAHXF-2020-CAJA::3-V00005', 3, 3, 32000.00, 0.00, 16, 5120.00, 0, 0.00, 37120.00, 20002.00, 'CONTADO', 'EFECTIVO', 300.00, 300.00, '0000-00-00', 'PAGADA', '2020-12-01 11:38:30', 3),
(24, '2020--V00001', '01122020--V00001', 'VAHXF-2020--V00001', 3, 3, 360000.00, 0.00, 16, 57600.00, 0, 0.00, 417600.00, 20000.00, 'CONTADO', 'EFECTIVO', 200000.00, -217600.00, '0000-00-00', 'PAGADA', '2020-12-01 11:39:42', 3),
(25, '2020-CAJA::3-V00006', '01122020-CAJA::3-V00004', 'VAHXF-2020-CAJA::3-V00006', 3, 3, 30000.00, 0.00, 16, 4800.00, 0, 0.00, 34800.00, 20000.00, 'CONTADO', 'EFECTIVO', 20.00, -34780.00, '0000-00-00', 'PAGADA', '2020-12-01 11:42:42', 3),
(27, '2020-CAJA::3-V00007', '02122020-CAJA::3-V00004', 'VAHXF-2020-CAJA::3-V00007', 3, 7, 30000.00, 0.00, 16, 4800.00, 0, 0.00, 34800.00, 20000.00, 'CONTADO', 'EFECTIVO', 140000.00, 800.00, '0000-00-00', 'PAGADA', '2020-12-02 12:00:16', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonoscreditos`
--
ALTER TABLE `abonoscreditos`
  ADD PRIMARY KEY (`codabono`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`codcaja`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`codcategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codcliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`codcompra`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detallecompras`
--
ALTER TABLE `detallecompras`
  ADD PRIMARY KEY (`coddetallecompra`);

--
-- Indices de la tabla `detalledevolucion`
--
ALTER TABLE `detalledevolucion`
  ADD PRIMARY KEY (`coddetalledevolucion`);

--
-- Indices de la tabla `detallepedidos`
--
ALTER TABLE `detallepedidos`
  ADD PRIMARY KEY (`coddetallepedido`);

--
-- Indices de la tabla `detalleservicios`
--
ALTER TABLE `detalleservicios`
  ADD PRIMARY KEY (`coddetalleservicio`);

--
-- Indices de la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  ADD PRIMARY KEY (`coddetalleventa`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`iddevolucion`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`iditems`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`codkardex`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`codpedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codalmacen`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`codproveedor`);

--
-- Indices de la tabla `retiroefectivo`
--
ALTER TABLE `retiroefectivo`
  ADD PRIMARY KEY (`codretiro`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idservicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonoscreditos`
--
ALTER TABLE `abonoscreditos`
  MODIFY `codabono` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `codcaja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `codcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detallecompras`
--
ALTER TABLE `detallecompras`
  MODIFY `coddetallecompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalledevolucion`
--
ALTER TABLE `detalledevolucion`
  MODIFY `coddetalledevolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallepedidos`
--
ALTER TABLE `detallepedidos`
  MODIFY `coddetallepedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalleservicios`
--
ALTER TABLE `detalleservicios`
  MODIFY `coddetalleservicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  MODIFY `coddetalleventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `iddevolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `iditems` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `codkardex` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `codalmacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `codproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `retiroefectivo`
--
ALTER TABLE `retiroefectivo`
  MODIFY `codretiro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idservicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
