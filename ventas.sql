-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para ventas
CREATE DATABASE IF NOT EXISTS `ventas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ventas`;

-- Volcando estructura para tabla ventas.abonoscreditos
CREATE TABLE IF NOT EXISTS `abonoscreditos` (
  `codabono` int(11) NOT NULL AUTO_INCREMENT,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` int(11) NOT NULL,
  `montoabono` float(12,2) NOT NULL,
  `fechaabono` datetime NOT NULL,
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`codabono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.abonoscreditos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `abonoscreditos` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonoscreditos` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.cajas
CREATE TABLE IF NOT EXISTS `cajas` (
  `codcaja` int(11) NOT NULL AUTO_INCREMENT,
  `nrocaja` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombrecaja` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`codcaja`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.cajas: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
INSERT INTO `cajas` (`codcaja`, `nrocaja`, `nombrecaja`, `codigo`) VALUES
	(1, 'CAJA::1', 'CAJA::1', 1);
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `codcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nomcategoria` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.categorias: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`codcategoria`, `nomcategoria`) VALUES
	(1, 'LACTEOS'),
	(2, 'ELECTRINICOS');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `codcliente` int(11) NOT NULL AUTO_INCREMENT,
  `cedcliente` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomcliente` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfcliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emailcliente` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.clientes: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`codcliente`, `cedcliente`, `nomcliente`, `direccliente`, `tlfcliente`, `emailcliente`) VALUES
	(1, '01010101', 'CLIENTE RANDOM', 'MICHELENA', '(4444) 33355', 'RANDOM@CORREO.COM');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.compras
CREATE TABLE IF NOT EXISTS `compras` (
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
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`codcompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.compras: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.configuracion
CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `ivas` float(12,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.configuracion: 0 rows
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.detallecompras
CREATE TABLE IF NOT EXISTS `detallecompras` (
  `coddetallecompra` int(11) NOT NULL AUTO_INCREMENT,
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
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`coddetallecompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.detallecompras: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detallecompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallecompras` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.detalledevolucion
CREATE TABLE IF NOT EXISTS `detalledevolucion` (
  `coddetalledevolucion` int(11) NOT NULL AUTO_INCREMENT,
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
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`coddetalledevolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.detalledevolucion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalledevolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalledevolucion` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.detallepedidos
CREATE TABLE IF NOT EXISTS `detallepedidos` (
  `coddetallepedido` int(11) NOT NULL AUTO_INCREMENT,
  `codpedido` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `cantpedido` int(5) NOT NULL,
  `fechadetallepedido` datetime NOT NULL,
  PRIMARY KEY (`coddetallepedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.detallepedidos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detallepedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepedidos` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.detalleservicios
CREATE TABLE IF NOT EXISTS `detalleservicios` (
  `coddetalleservicio` int(11) NOT NULL AUTO_INCREMENT,
  `codservicio` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` int(11) NOT NULL,
  `coditems` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantservicio` int(5) NOT NULL,
  `precioservicio` float(12,2) NOT NULL,
  `importe` float(12,2) NOT NULL,
  `fechadetalleservicio` datetime NOT NULL,
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`coddetalleservicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.detalleservicios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalleservicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleservicios` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.detalleventas
CREATE TABLE IF NOT EXISTS `detalleventas` (
  `coddetalleventa` int(11) NOT NULL AUTO_INCREMENT,
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
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`coddetalleventa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.detalleventas: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `detalleventas` DISABLE KEYS */;
INSERT INTO `detalleventas` (`coddetalleventa`, `codventa`, `codcliente`, `codproducto`, `producto`, `codcategoria`, `cantventa`, `preciocompra`, `precioventa`, `ivaproducto`, `importe`, `importe2`, `fechadetalleventa`, `codigo`) VALUES
	(1, '2021-CAJA::1-V00001', 1, 'ELC-0001', 'LAPTOP ACER A3000', 2, 10, 400.00, 1200.00, 'SI', 12000.00, 4000.00, '2021-01-17 06:48:32', 1);
/*!40000 ALTER TABLE `detalleventas` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.devoluciones
CREATE TABLE IF NOT EXISTS `devoluciones` (
  `iddevolucion` int(11) NOT NULL AUTO_INCREMENT,
  `coddevolucion` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcaja` int(11) NOT NULL,
  `codproveedor` int(11) NOT NULL,
  `subtotald` float(12,2) NOT NULL,
  `ivad` int(2) NOT NULL,
  `totalivad` float(12,2) NOT NULL,
  `totald` float(12,2) NOT NULL,
  `fechadevolucion` datetime NOT NULL,
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`iddevolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.devoluciones: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `devoluciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `devoluciones` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.items
CREATE TABLE IF NOT EXISTS `items` (
  `iditems` int(11) NOT NULL AUTO_INCREMENT,
  `coditems` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombreitems` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `costoitems` float(12,2) NOT NULL,
  `statusitems` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`iditems`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.kardex
CREATE TABLE IF NOT EXISTS `kardex` (
  `codkardex` int(11) NOT NULL AUTO_INCREMENT,
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
  `fechakardex` date NOT NULL,
  PRIMARY KEY (`codkardex`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla ventas.kardex: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
INSERT INTO `kardex` (`codkardex`, `codproceso`, `codresponsable`, `codproducto`, `movimiento`, `entradas`, `salidas`, `stockactual`, `preciounit`, `costototal`, `documento`, `fechakardex`) VALUES
	(1, '2021-CAJA::1-V00001', 1, 'ELC-0001', 'SALIDAS', 0, 10, 40, 1200.00, 12000.00, 'VENTA - CONTADO - FACTURA: 2021-CAJA::1-V00001', '2021-01-17');
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.log
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tiempo` datetime DEFAULT NULL,
  `detalles` text CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `paginas` text CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.log: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` (`id`, `ip`, `tiempo`, `detalles`, `paginas`, `usuario`) VALUES
	(1, '192.168.0.100', '2021-01-18 09:25:36', 'Mozilla/5.0 (Linux; Android 10; SM-A305G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', '/elbarbas/index.php', 'ADMINISTRADOR');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `codpedido` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` int(11) NOT NULL,
  `fechapedido` datetime NOT NULL,
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`codpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.pedidos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `codalmacen` int(11) NOT NULL AUTO_INCREMENT,
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
  `statusproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codalmacen`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.productos: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`codalmacen`, `codproducto`, `producto`, `codcategoria`, `preciocompra`, `precioventa`, `existencia`, `stockminimo`, `codigobarra`, `ubicacion`, `ivaproducto`, `statusproducto`) VALUES
	(1, 'ELC-0001', 'LAPTOP ACER A3000', 2, 400.00, 1200.00, 40, 10, 'ELC-0001', 'VINTRINA A', 'SI', 'ACTIVO');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `codproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `ritproveedor` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomproveedor` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direcproveedor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfproveedor` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emailproveedor` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `contactoproveedor` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.proveedores: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;

-- Volcando estructura para procedimiento ventas.reset_box
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `reset_box`()
BEGIN
	DECLARE _id_box INT;
	SET _id_box = (SELECT codigo FROM usuarios ORDER BY codigo DESC LIMIT 1);
	IF _id_box = 0 THEN
    	SET _id_box = 1;
     END IF;
     
    INSERT INTO cajas VALUES (NULL,concat('CAJA::',_id_box),concat('CAJA::',_id_box),_id_box);		
END//
DELIMITER ;

-- Volcando estructura para tabla ventas.retiroefectivo
CREATE TABLE IF NOT EXISTS `retiroefectivo` (
  `codretiro` int(11) NOT NULL AUTO_INCREMENT,
  `motivoretiro` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantretiro` float(12,2) NOT NULL,
  `fecharetiro` datetime NOT NULL,
  `codcaja` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`codretiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.retiroefectivo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `retiroefectivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `retiroefectivo` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
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
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`idservicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.servicios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sexo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cargo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nivel` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `status` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.usuarios: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`codigo`, `cedula`, `nombres`, `sexo`, `cargo`, `email`, `usuario`, `password`, `nivel`, `status`) VALUES
	(1, '01010101', 'JOHN DOE', 'MASCULINO', 'GERENTE DE VENTAS', 'JOHN@CORREO.COM', 'ADMINISTRADOR', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', 'ADMINISTRADOR', 'ACTIVO');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
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
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`idventa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ventas.ventas: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` (`idventa`, `codventa`, `codserieve`, `codautorizacionve`, `codcaja`, `codcliente`, `subtotalivasive`, `subtotalivanove`, `ivave`, `totalivave`, `descuentove`, `totaldescuentove`, `totalpago`, `totalpago2`, `tipopagove`, `formapagove`, `montopagado`, `montodevuelto`, `fechavencecredito`, `statusventa`, `fechaventa`, `codigo`) VALUES
	(3, '2021-CAJA::1-V00001', '17012021-CAJA::1-V00001', 'VAHXF-2021-CAJA::1-V00001', 1, 1, 12000.00, 0.00, 0, 0.00, 0, 0.00, 12000.00, 400.00, 'CONTADO', 'EFECTIVO', 100000.00, 4000.00, '0000-00-00', 'PAGADA', '2021-01-17 06:48:32', 1);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
