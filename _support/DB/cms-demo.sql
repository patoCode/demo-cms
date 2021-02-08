-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-02-2021 a las 19:53:54
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comu`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_album`
--

CREATE TABLE `com_album` (
  `id_album` int(11) UNSIGNED NOT NULL,
  `path_imagen` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `album` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_album`
--

INSERT INTO `com_album` (`id_album`, `path_imagen`, `album`, `descripcion`, `id_usuario`) VALUES
(3, 'b66f0-3.jpg', 'Album 01', '<p>\r\n	Album 01</p>\r\n', 952);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_archivo`
--

CREATE TABLE `com_archivo` (
  `id_archivo` int(11) NOT NULL,
  `archivo` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `path_archivo` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `path_server` varchar(400) COLLATE utf8_spanish_ci NOT NULL,
  `id_publicacion` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_album` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_archivo`
--

INSERT INTO `com_archivo` (`id_archivo`, `archivo`, `path_archivo`, `fecha`, `path_server`, `id_publicacion`, `id_categoria`, `id_album`) VALUES
(1, 'Prueba de subida a cualquier categoria', '58694-my-logo.png', '2021-02-08 15:46:14', 'public/rrhh/files/', 0, 1, 0),
(2, 'Novedades file test', '9d52b-3.jpg', '2021-02-08 16:53:52', 'public/rrhh/files/', 0, 3, 0),
(3, 'Noticia 1', '10d7f-2.jpg', '2021-02-08 17:28:59', 'public/rrhh/files/', 0, 4, 0),
(4, 'da', '2fd3a-base-logo.png', '2021-02-08 18:13:18', 'public/rrhh/files/', 0, 5, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_cargo`
--

CREATE TABLE `com_cargo` (
  `id_cargo` int(11) NOT NULL,
  `cargo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ver` enum('si','no') COLLATE utf8_spanish_ci NOT NULL,
  `editar` enum('si','no') COLLATE utf8_spanish_ci NOT NULL,
  `crear` enum('si','no') COLLATE utf8_spanish_ci NOT NULL,
  `borrar` enum('si','no') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_cargo`
--

INSERT INTO `com_cargo` (`id_cargo`, `cargo`, `descripcion`, `ver`, `editar`, `crear`, `borrar`) VALUES
(1, 'Administrador', 'Administrador de la comunidad ENDE, tiene todos los privilegios, puede crear usuarios.', 'si', 'si', 'si', 'si'),
(2, 'Funcionario', 'Es el usuario común y corriente, no tiene acceso a nada de la administración', 'si', 'si', 'si', 'si'),
(3, 'Ingreso de personal', 'Rol de Recursos Humanos, puede insertar funcionarios', 'si', 'si', 'si', 'no'),
(4, 'RRHH', 'Para agregar avisos de recusrsos humanos', 'si', 'si', 'si', 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_categoria`
--

CREATE TABLE `com_categoria` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `icono` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` enum('activo','inactivo') COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_padre` int(11) DEFAULT 0,
  `in_home` enum('si','no') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'no',
  `sys_cod` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_categoria`
--

INSERT INTO `com_categoria` (`id_categoria`, `categoria`, `descripcion`, `icono`, `estado`, `id_padre`, `in_home`, `sys_cod`) VALUES
(1, 'Categoria 1', '<p>\n	Prueba de categoria 1</p>\n', 'fa', 'activo', 0, 'si', 'CA'),
(3, 'Novedades', '<p>\r\n	Categoria de novedades</p>\r\n', 'da', 'activo', 0, 'si', 'NO'),
(4, 'Noticias', '<p>\r\n	Avisos en general</p>\r\n', 'fa', 'activo', 0, 'si', 'NOT'),
(5, 'RRHH', '<p>\n	Recursos HUmanos</p>\n', 'da', 'activo', 0, 'si', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_encuesta`
--

CREATE TABLE `com_encuesta` (
  `id_encuesta` int(11) NOT NULL,
  `titulo` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` enum('activo','inactivo') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_encuesta`
--

INSERT INTO `com_encuesta` (`id_encuesta`, `titulo`, `descripcion`, `fecha`, `estado`) VALUES
(5, 'Te gusta esta intenat?', '<p>\r\n	Encuesta sobre los gustos de la intranet</p>\r\n', '2021-02-05', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_encuesta_opciones`
--

CREATE TABLE `com_encuesta_opciones` (
  `id_encuesta_opcion` int(11) NOT NULL,
  `id_encuesta` int(11) NOT NULL,
  `titulo` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `valor` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_encuesta_opciones`
--

INSERT INTO `com_encuesta_opciones` (`id_encuesta_opcion`, `id_encuesta`, `titulo`, `valor`) VALUES
(1, 5, 'Si', '0'),
(2, 5, 'No', '1'),
(3, 5, 'NR', '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_encuesta_usuario`
--

CREATE TABLE `com_encuesta_usuario` (
  `id_encuesta_usuario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_encuesta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_encuesta_usuario`
--

INSERT INTO `com_encuesta_usuario` (`id_encuesta_usuario`, `id_usuario`, `id_encuesta`) VALUES
(7, 952, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_encuesta_votos`
--

CREATE TABLE `com_encuesta_votos` (
  `id_encuesta_votos` int(11) NOT NULL,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_encuesta_opcion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_encuesta_votos`
--

INSERT INTO `com_encuesta_votos` (`id_encuesta_votos`, `id_encuesta`, `id_encuesta_opcion`) VALUES
(7, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_evento`
--

CREATE TABLE `com_evento` (
  `id` int(11) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `type` int(3) NOT NULL,
  `title` varchar(165) NOT NULL,
  `description` longtext NOT NULL,
  `link` varchar(300) NOT NULL,
  `color` varchar(150) NOT NULL,
  `rendering` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `com_evento`
--

INSERT INTO `com_evento` (`id`, `start`, `end`, `type`, `title`, `description`, `link`, `color`, `rendering`) VALUES
(1, '2021-02-08', '2021-02-08', 0, 'DEMO', '<p>\r\n	DEMOS DEL CMS</p>\r\n', '', '#0099e5', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_funcionario`
--

CREATE TABLE `com_funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nombres` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_pat` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_mat` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cumpleanio` date DEFAULT NULL,
  `telefono_fijo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `interno` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_ende` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_personal` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_personal_opc` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `profesion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cargo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidad_organizacional` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `jefe_inmediato` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `lugar_trabajo` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `path_foto` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_sangre` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` enum('activo','inactivo') COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_funcionario`
--

INSERT INTO `com_funcionario` (`id_funcionario`, `nombres`, `apellido_pat`, `apellido_mat`, `cumpleanio`, `telefono_fijo`, `celular`, `interno`, `email_ende`, `email_personal`, `email_personal_opc`, `profesion`, `cargo`, `unidad_organizacional`, `jefe_inmediato`, `lugar_trabajo`, `path_foto`, `tipo_sangre`, `estado`) VALUES
(7, 'Jose Ronald', 'Andia', 'Gil', '2021-02-08', '12345678', '77777777', '1845', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(14, 'Jose Luis', 'Carvallo', 'Caceres', '1958-04-22', '12345678', '77777777', '1530', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(18, 'Antonio', 'Encinas', 'Morato', '1951-06-12', '12345678', '77777777', '1242', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(19, 'Teresa Guadalupe', 'Escriva', 'Vargas', '1971-11-01', '12345678', '77777777', '1205', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'URHU-UNIDAD RECURSOS HUMANOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(20, 'Juan Carlos', 'Fuertes', 'Lazcano', '1964-10-06', '12345678', '77777777', '1216', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(26, 'Amalia Teresa', 'Machaca', 'Rodriguez', '1964-07-10', '12345678', '77777777', '1535', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(29, 'Felix Claudio', 'Meza', 'Mendieta', '1982-06-15', '12345678', '77777777', '1663', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(30, 'Felix', 'Mosquera', '.', '1953-11-23', '12345678', '77777777', '1211', 'funcionario@company.com', NULL, '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(31, 'Roberto', 'Peredo', 'Echazu', '1961-12-20', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'GDEX-GERENCIA NACIONAL DESARROLLO ESTRATEGICO Y EXPORTACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(32, 'Percy Willy', 'Ramirez', 'Espinoza', '1946-07-17', '12345678', '77777777', '1660', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(35, 'Zenon', 'Sanchez', 'Flores', '1970-10-25', '12345678', '77777777', '4272599', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(36, 'Felipe', 'Sanchez', 'Guzman', '1969-05-24', '12345678', '77777777', '1250', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DGFN-DEPARTAMENTO GESTION FINANCIERA Y NEGOCIOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(38, 'Estela Jacqueline Milka', 'Solorzano', 'Rocha', '1965-09-17', '12345678', '77777777', '1501', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'GOSE-GERENCIA NACIONAL OPERACION SISTEMAS ELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(39, 'Eddson Mirko', 'Udaeta', 'Orellana', '1973-09-25', '12345678', '77777777', '1210', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(40, 'Juan Carlos', 'Vargas', 'Cordova', '1965-05-29', '12345678', '77777777', '1509', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(41, 'Rolando Javier', 'Vera', 'Gonzales', '1964-05-23', '12345678', '77777777', '1230', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(42, 'Edgar', 'Yrady', '', '1948-08-09', '12345678', '77777777', '1600', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(44, 'Neida Jimena', 'Zurita', 'Porcel', '1977-02-04', '12345678', '77777777', '1251', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DGEM-DEPARTAMENTO GESTION DE EMPRESAS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(47, 'Wilson Jorge', 'Flores', 'Lopez', '1972-02-26', '12345678', '77777777', '1607', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(48, 'Veimar Jhimmy', 'Soliz', 'Poveda', '1977-10-10', '12345678', '77777777', '1341', 'funcionario@company.com', 'veimar.soliz@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(49, 'Mario Cesar', 'Ayma', 'Rodriguez', '1969-04-15', '12345678', '77777777', '1411', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMEX-UNIDAD MERCADO EXTERNO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(50, 'Daniel Henry', 'Ayaviri', 'Villegas', '1970-10-03', '12345678', '77777777', '1237', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(51, 'Fredi', 'Llallagua', 'Pedro', '1982-04-23', '12345678', '77777777', '1643', 'funcionario@company.com', 'fredi.llallagua@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(53, 'Susana Ximena', 'Castro', 'Guaman', '1973-08-11', '12345678', '77777777', '1625', 'funcionario@company.com', 'susana.castro@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(54, 'Sobeyda Tania', 'Claros', 'Heredia', '1981-07-22', '12345678', '77777777', '1620', 'funcionario@company.com', 'sclaros@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(60, 'Zobeida Lena', 'Saravia', 'Humerez', '1976-11-30', '12345678', '77777777', '1652', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(63, 'Marco Antonio', 'Escobar', 'Seleme', '1964-07-02', '12345678', '77777777', '1870', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(67, 'Jose Maria Salvador', 'Romay', 'Bortolini', '1980-10-02', '12345678', '77777777', '1830', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(69, 'Luis Emilio', 'Suarez', 'Amoretti', '1964-01-06', '12345678', '77777777', '1522', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(70, 'Beatriz Luisa', 'Aranibar', 'Chavez', '1964-06-14', '12345678', '77777777', '1212', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(71, 'Joaquin Gary', 'Aguilar', 'Cusicanqui', '1977-03-07', '12345678', '77777777', '1117', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(74, 'Enzo Mauricio', 'Vallejo', 'Beltran', '1965-07-04', '12345678', '77777777', '1360', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'GFYS-GERENCIA NACIONAL FILIALES Y SUBSIDIARIAS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(75, 'Jose Luis', 'Leaño', 'Padilla', '1950-06-30', '12345678', '77777777', '1236', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(76, 'Maria Grethel', 'Montaño', 'Rodriguez', '1971-09-12', '12345678', '77777777', '1201', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'GDEE-GERENCIA NACIONAL DESARROLLO EMPRESARIAL Y ECONOMIA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(77, 'Maritza Noemi', 'Siñaniz', 'Coba', '1971-10-17', '12345678', '77777777', '1645', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DGFN-DEPARTAMENTO GESTION FINANCIERA Y NEGOCIOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(78, 'Luz Cynthia', 'Zamora', 'Castañon', '1963-09-29', '12345678', '77777777', '1801', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'GFYS-GERENCIA NACIONAL FILIALES Y SUBSIDIARIAS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(90, 'Rene Francisco', 'Cabero', 'Calatayud', '0000-00-00', '12345678', '77777777', '1800', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DDME-DEPARTAMENTO DESARROLLO DE MERCADOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(91, 'Maria Telma', 'Soliz', 'Lopez', '1973-08-09', '12345678', '77777777', '1221', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DGFN-DEPARTAMENTO GESTION FINANCIERA Y NEGOCIOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(93, 'Grace Patricia', 'Claure', 'Aracena', '1978-03-16', '12345678', '77777777', '1856', 'funcionario@company.com', 'patricia.claure@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(96, 'Edgar Freddy', 'Caero', 'Ayala', '1975-03-08', '12345678', '77777777', '1500', 'funcionario@company.com', 'edgar.caero@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(98, 'Mercedes', 'Zambrana', 'Meneses', '1983-12-15', '12345678', '77777777', '1315', 'funcionario@company.com', 'mercedes.zambrana@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(99, 'Ana Maria', 'Villegas', 'Quispe', '1978-09-25', '12345678', '77777777', '1311', 'funcionario@company.com', 'ana.villegas@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(100, 'Ivanka Margarita', 'Herrera', 'Arteaga', '1968-03-11', '12345678', '77777777', '4511', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(101, 'Vidal', 'Copa', 'Lopez', '1964-04-22', '12345678', '77777777', '4515', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(102, 'Irineo Nestor', 'Apaza', 'Ticona', '1974-07-21', '12345678', '77777777', '4545', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(103, 'Jhimmy Sandro', 'Orellana', 'Gonzales', '1971-02-11', '12345678', '77777777', '1217', 'funcionario@company.com', 'jhimmy.orellana@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(108, 'Jose Luis', 'Delgadillo', 'Gonzales', '1964-09-26', '12345678', '77777777', '4526', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(110, 'Erick David', 'Parra', 'Flores', '1968-11-15', '12345678', '77777777', '4526', 'funcionario@company.com', 'erick.parra@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(111, 'Julio Cesar', 'Solis', 'Marquina', '1969-04-12', '12345678', '77777777', '4511', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(115, 'Rogelio', 'Huanquiri', 'Quispe', '1971-06-24', '12345678', '77777777', '4526', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(116, 'Efrain Omar', 'Calizaya', 'Chaca', '1971-05-06', '12345678', '77777777', '8422075', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(118, 'Javier', 'Garcia', 'Vargas', '1969-12-02', '12345678', '77777777', '1656', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(119, 'Jhonny Milton', 'Ortega', 'Vasquez', '1968-06-08', '12345678', '77777777', '4513', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(121, 'David Jorge', 'Carreño', 'Mercado', '1970-01-19', '12345678', '77777777', '4526', 'funcionario@company.com', 'david.carreno@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(122, 'Juan Ramiro', 'Flores', 'Rocha', '1968-06-27', '12345678', '77777777', '4526', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(123, 'Hernan', 'Baldiviezo', 'Aguilar', '1971-07-03', '12345678', '77777777', '4511', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(125, 'Yoni', 'Paniagua', 'Chambi', '1979-03-09', '12345678', '77777777', '4526', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(127, 'German', 'Cruz', 'Colque', '1963-09-24', '12345678', '77777777', '4511', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(129, 'Roberto', 'Escobar', 'Guarachi', '1970-06-08', '12345678', '77777777', '4505', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(132, 'Marco Antonio', 'Jimeno', 'Beltran', '1977-06-09', '12345678', '77777777', '4505', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(134, 'Jimmy Omar', 'Santander', 'Villarroel', '1984-08-15', '12345678', '77777777', '4511', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(137, 'Patricia Liliana', 'Claros', 'Rojas', '1973-10-12', '12345678', '77777777', '1875', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(140, 'Adalit Milton', 'Ponce', 'Gonzales', '1977-02-28', '12345678', '77777777', '1252', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DGFN-DEPARTAMENTO GESTION FINANCIERA Y NEGOCIOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(141, 'Claudia', 'Quiroga', 'Alba', '1980-05-10', '12345678', '77777777', '1256', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(145, 'Horacio Brayan', 'Brañez', 'Saavedra', '1982-10-16', '12345678', '77777777', '1832', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(146, 'Emigio', 'Notta', 'Saavedra', '1946-11-13', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(151, 'La Fuente Sergio Mauricio', 'Montaño', 'De', '1980-06-09', '12345678', '77777777', '1532', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(155, 'Jaime Ruben', 'Pardo', 'Molina', '1956-09-05', '12345678', '77777777', '2610', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(158, 'Gary Jose', 'Herbas', 'Camacho', '1961-11-29', '12345678', '77777777', '1684', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(165, 'Johnny Fernando', 'Cardenas', 'Cordova', '1964-04-30', '12345678', '77777777', '1254', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DGFN-DEPARTAMENTO GESTION FINANCIERA Y NEGOCIOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(167, 'Miriam Susana', 'Mejía', 'Serrano', '1976-04-01', '12345678', '77777777', '1682', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UCCO-UNIDAD COORDINACION CORPORATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(168, 'Aldo Gonzalo', 'Novillo', 'Muñoz', '1970-09-16', '12345678', '77777777', '1528', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(170, 'Anacleto', 'Rojas', 'Veizaga', '1982-07-13', '12345678', '77777777', '1695', 'funcionario@company.com', 'anacleto.rojas@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(190, 'Rosario', 'Baldelomar', 'Ferrufino', '1984-05-07', '12345678', '77777777', '', 'funcionario@company.com', 'rosariobaldelomar@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'Linea de Transmisi?n Santa Cruz-Beni', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(192, 'Osvaldo', 'Pardo', 'Triveño', '1990-08-05', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(196, 'Alfredo', 'Rodriguez', 'Villca', '1979-05-10', '12345678', '77777777', '4545', 'funcionario@company.com', 'alfredo.rodriguez@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(202, 'Gustavo Martin', 'Andrade', 'Davila', '1971-06-01', '12345678', '77777777', '4510', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(203, 'Jose Gustavo', 'Rojas', 'Escobar', '1975-01-12', '12345678', '77777777', '4515', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(206, 'Gualberto', 'Garcia', 'Arauco', '1975-07-11', '12345678', '77777777', '4511', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(209, 'David Jhon', 'Rocha', 'Echeverria', '1971-12-20', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(213, 'Marcelo Mauricio', 'Grandillert', 'Antezana', '1977-08-24', '12345678', '77777777', '1235', 'funcionario@company.com', 'marcelo.grandillert@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(218, 'Marco Antonio', 'Pozo', 'Heredia', '1978-01-23', '12345678', '77777777', '1834', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(221, 'Arturo Manuel', 'Yañez', 'Lizarazu', '1961-03-12', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(224, 'Mary Luz', 'Jaldin', 'Rodriguez', '1979-06-05', '12345678', '77777777', '1333', 'funcionario@company.com', 'mary.jaldin@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(243, 'Fabiola', 'Monasterio', 'Cuellar', '1977-01-22', '12345678', '77777777', '6220', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RDTD-REGIONAL DISTRIBUCION TRINIDAD', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(246, 'Erick Ciffrit', 'Rios', 'Rodriguez', '1975-07-23', '12345678', '77777777', '1707', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(252, 'Espiritu', 'Titiboco', 'Ymanareico', '1958-01-24', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RDTD-REGIONAL DISTRIBUCION TRINIDAD', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(260, 'Alex Ruven', 'Palomo', 'Poma', '1980-05-02', '12345678', '77777777', '4515', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(270, 'Adolfo Ivan', 'Bustillos', 'Vergara', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(271, 'Gerberth Cristian', 'Camacho', 'Teran', '1975-10-20', '12345678', '77777777', '4525', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(273, 'Raul Osvaldo', 'Medrano', 'Castellon', '0000-00-00', '12345678', '77777777', '1622', 'funcionario@company.com', 'raul.medrano@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(274, 'Guillermo Armando', 'Mercado', 'Aramayo', '1953-02-10', '12345678', '77777777', '4168', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(276, 'Jose Fernando', 'Parra', 'Moya', '1982-06-05', '12345678', '77777777', '1332', 'funcionario@company.com', 'jose.parra@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(290, 'Hernan Ricardo', 'Salazar', 'Aguilar', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', 'hernan.salazar@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(291, 'Jorge', 'Rodriguez', 'Amurrio', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', 'jorge.rodriguez@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(294, 'Edwin', 'Sola', 'Ramirez', '2009-12-17', '12345678', '77777777', '', 'funcionario@company.com', 'edwin.sola@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(305, 'Eyvert Roman', 'Rodriguez', 'Aguilar', '1978-01-28', '12345678', '77777777', '1552', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(326, 'Isidoro Ruben', 'Vargas', 'Ramos', '1964-04-04', '12345678', '77777777', '3109', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'CLPZ-COORDINACION LA PAZ', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(332, 'Daniela', 'Maldonado', 'Torrico', '1986-11-02', '12345678', '77777777', '1880', 'funcionario@company.com', 'daniela.maldonado@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(376, 'Ronald Ricardo', 'Coronel', 'Torrico', '1976-01-06', '12345678', '77777777', '1233', 'funcionario@company.com', 'ronald.coronel@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(401, 'Juan Javier', 'Quispe', 'Molina', '0000-00-00', '12345678', '77777777', '1448', 'funcionario@company.com', 'juan.quispe@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(408, 'Francisco', 'Vega', 'Segovia', '1965-08-13', '12345678', '77777777', '1431', 'funcionario@company.com', 'francisco.vega@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(412, 'Donato', 'Mitma', 'Choque', '1955-04-07', '12345678', '77777777', '1825', 'funcionario@company.com', 'donato.mitma@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(415, 'Carla Mariel', 'Valverde', 'Lopez', '1984-08-23', '12345678', '77777777', '', 'funcionario@company.com', 'carla.valverde@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DDME-DEPARTAMENTO DESARROLLO DE MERCADOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(431, 'Francisco Javier', 'Ramirez', 'Torrico', '1975-10-04', '12345678', '77777777', '1807', 'funcionario@company.com', 'francisco.ramirez@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(453, 'Osvaldo', 'Velarde', 'Sanabria', '1964-03-06', '12345678', '77777777', '1440', 'funcionario@company.com', 'osvaldo.velarde@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(455, 'Marco Antonio', 'Guzman', 'Hoffmann', '0000-00-00', '12345678', '77777777', '1837', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(466, 'Maria Blanca', 'Almanza', 'Cabrera', '1978-10-05', '12345678', '77777777', '1213', 'funcionario@company.com', 'blanca.almanza@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(514, 'Osvaldo Ramiro', 'Ferrufino', 'Veizaga', '0000-00-00', '12345678', '77777777', '1552', 'funcionario@company.com', 'osvaldo.ferrufino@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(519, 'Juan', 'Villarroel', 'Zambrana', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(549, 'Rene Cesar', 'Cordova', 'Salinas', '1964-06-17', '12345678', '77777777', '1606', 'funcionario@company.com', 'rene.cordova@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(574, 'Jorge', 'Baptista', 'Morales', '1974-08-31', '12345678', '77777777', '1611', 'funcionario@company.com', 'jorge.baptista@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(615, 'Enrique Alberto', 'Jurado', 'Quisbert', '1977-01-12', '12345678', '77777777', '4515', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(709, 'Daniela', 'Palomino', 'Arandia', '1981-05-25', '12345678', '77777777', '1624', 'funcionario@company.com', 'daniela.palomino@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(715, 'Hans Jurgen', 'Caceres', 'Moreira', '1976-09-17', '12345678', '77777777', '1245', 'funcionario@company.com', 'hans.caceres@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DGFN-DEPARTAMENTO GESTION FINANCIERA Y NEGOCIOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(730, 'Camilo', 'Molina', 'Ruiz', '1976-07-14', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(760, 'Juan David', 'Tapia', 'Velasquez', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(784, 'Reinaldo', 'Claure', 'Zurita', '1970-08-29', '12345678', '77777777', '1436', 'funcionario@company.com', 'reinaldo.claure@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(803, 'Freddy', 'Arnez', 'Guzmán', '1972-03-14', '12345678', '77777777', '1623', 'funcionario@company.com', 'freddy.arnez@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(809, 'Edgar Felipe', 'Rocha', 'Perez', '1964-05-26', '12345678', '77777777', '7111', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(846, 'Carola Liliana', 'Subieta', 'Tapia', '0000-00-00', '12345678', '77777777', '1603', 'funcionario@company.com', 'carola.subieta@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(858, 'Yoshijiro Shubert Lee', 'Ecuari', 'Cespedes', '1980-11-10', '12345678', '77777777', '', 'funcionario@company.com', 'shubert_lee@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(877, 'Maritza', 'Serrano', 'Gareca', '0000-00-00', '12345678', '77777777', '2601', 'funcionario@company.com', 'maritza.serrano@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(910, 'Wilma Viviana', 'Maldonado', 'Alba', '1970-01-25', '12345678', '77777777', '1446', 'funcionario@company.com', 'vivian.maldonado@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(917, 'Mayerlyn Florita', 'Carvajal', 'Castellon', '1986-02-26', '12345678', '77777777', '1857', 'funcionario@company.com', 'mayerlyn.carvajal@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(936, 'Lesly Marcela', 'Arispe', 'Paniagua', '1986-04-20', '12345678', '77777777', '1234', 'funcionario@company.com', 'lesly.arispe@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(942, 'German', 'Wieler', 'Llanos', '1945-01-21', '12345678', '77777777', '1813', 'funcionario@company.com', 'german.weiler@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(943, 'Gabriel Marcelo', 'Bellott', 'Rojas', '1980-07-22', '12345678', '77777777', '1572', 'funcionario@company.com', 'gabriel.bellot@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DDME-DEPARTAMENTO DESARROLLO DE MERCADOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(945, 'Luis Fernando', 'Sagarnaga', 'Pereyra', '1979-09-25', '12345678', '77777777', '1517', 'funcionario@company.com', 'fernando.sagarnaga@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(950, 'Iness Lineth', 'Espinoza', 'Rivera', '1977-10-19', '12345678', '77777777', '1781', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(956, 'Susana Vanessa', 'Velasco', 'Rios', '1987-04-07', '12345678', '77777777', '1625', 'funcionario@company.com', 'susana.velasco@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(970, 'Victor Hugo', 'Zubieta', 'Leigue', '0000-00-00', '12345678', '77777777', '1834', 'funcionario@company.com', 'victor.zubieta@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(986, 'Alvaro Pompeyo', 'Alba', 'Rivera', '1976-05-29', '12345678', '77777777', '', 'funcionario@company.com', 'aalba@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DDME-DEPARTAMENTO DESARROLLO DE MERCADOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(989, 'Waldo', 'Soto', 'Butron', '1970-03-10', '12345678', '77777777', '1811', 'funcionario@company.com', 'waldo.soto@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DDME-DEPARTAMENTO DESARROLLO DE MERCADOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(997, 'Luis Fernando', 'Rojas', 'Vega', '0000-00-00', '12345678', '77777777', '1871', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(998, 'Nereida Gabriela', 'Mercado', 'Garcia', '1974-12-27', '12345678', '77777777', '1511', 'funcionario@company.com', 'gabriela.mercado@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1015, 'Carlos', 'Copa', 'Cayo', '1970-03-28', '12345678', '77777777', '7113', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1026, 'Huáscar Inti', 'Medrano', 'Hervas', '1970-11-01', '12345678', '77777777', '1566', 'funcionario@company.com', 'huascar.medrano@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1030, 'Javier Lorenzo', 'Velasco', 'Zarate', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', 'javier.velasco@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1039, 'Maria Carola', 'Jimenez', 'Bascope', '1974-10-18', '12345678', '77777777', '', 'funcionario@company.com', 'macajb@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1082, 'Eugenio', 'Romero', 'Castillo', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1089, 'Edwin Edgar', 'Arandia', 'Rojas', '1954-05-02', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PREJ-PRESIDENCIA EJECUTIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1110, 'Jose Luis', 'Luna', 'Vasquez', '0000-00-00', '12345678', '77777777', '1872', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1121, 'Carlos Alberto', 'Delgado', 'Vera', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1129, 'Toribio', 'Trujillo', 'Lopez', '1975-04-16', '12345678', '77777777', '6510', 'funcionario@company.com', 'toribio.trujillo@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'SSIM-SISTEMA SAN IGNACIO DE MOXOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1136, 'Edward Antonio', 'Urquidi', 'Hinojosa', '1972-02-02', '12345678', '77777777', '1226', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1145, 'Juan David', 'Benavides', 'Ope', '1973-04-11', '12345678', '77777777', '4511', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1175, 'Juan Gabriel', 'Chavez', 'Navarro', '1987-06-26', '12345678', '77777777', '1812', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1199, 'Alvaro', 'Veizaga', 'Ibañez', '2010-07-09', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1204, 'Edgar', 'Castellon', 'Garcia', '1980-06-06', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1209, 'Milkos Ivan', 'Mansilla', 'Ricard', '1974-11-01', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1210, 'Jary', 'Barbery', 'Vargas', '1978-10-14', '12345678', '77777777', '6226', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1232, 'Alain', 'Alarcon', 'Rossell', '1977-06-07', '12345678', '77777777', '1336', 'funcionario@company.com', 'alain.alarcon@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1250, 'Alberto Sergio', 'Tejada', 'Ferrufino', '1957-08-30', '12345678', '77777777', '1100', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'VIPR-VICEPRESIDENCIA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1254, 'Rildo', 'Rivero', 'Rios', '1973-08-14', '12345678', '77777777', '6210', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RDTD-REGIONAL DISTRIBUCION TRINIDAD', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1259, 'Ricardo', 'Vargas', 'Sejas', '2010-08-30', '12345678', '77777777', '1834', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1274, 'Javier Roger', 'Suarez', 'Rocha', '1970-05-20', '12345678', '77777777', '1445', 'funcionario@company.com', 'javier.suarez@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1282, 'Susan', 'Pinto', 'Meneses', '1982-07-27', '12345678', '77777777', '1206', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'URHU-UNIDAD RECURSOS HUMANOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1291, 'Yassir Israel', 'Choque', 'Flores', '1975-02-28', '12345678', '77777777', '4526', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1301, 'Giovanna', 'Perez', 'Zurita', '2010-10-21', '12345678', '77777777', '', 'funcionario@company.com', 'giovanna.perez@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'URHU-UNIDAD RECURSOS HUMANOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1312, 'Hector Alejandro', 'Carrasco', 'Vasquez', '0000-00-00', '12345678', '77777777', '6515', 'funcionario@company.com', 'hcarrasco@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'SSIM-SISTEMA SAN IGNACIO DE MOXOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1320, 'Cristhian Daniel', 'Mercado', 'Ferrufino', '0000-00-00', '12345678', '77777777', '1119', 'funcionario@company.com', 'cristhian.mercado@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1351, 'Vladimir', 'Claros', 'Rocabado', '1986-01-29', '12345678', '77777777', '', 'funcionario@company.com', 'vladi_cr@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1353, 'Jorge', 'Chino', 'Rojas', '1983-08-12', '12345678', '77777777', '1900', 'funcionario@company.com', 'jorge.chino@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMEX-UNIDAD MERCADO EXTERNO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1374, 'Fernando Agustin', 'Lucas', 'Aponte', '1973-10-27', '12345678', '77777777', '1842', 'funcionario@company.com', 'fernando.lucas@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1375, 'Javier Rolando', 'Pardo', 'Iriarte', '1965-01-05', '12345678', '77777777', '1200', 'funcionario@company.com', 'javier.pardo@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'GDEE-GERENCIA NACIONAL DESARROLLO EMPRESARIAL Y ECONOMIA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1376, 'Rilda Tania', 'Villegas', 'Flores', '1973-02-26', '12345678', '77777777', '1843', 'funcionario@company.com', 'rilda.villegas@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1388, 'Edson Carlos', 'Ferreira', 'Espinoza', '1985-07-23', '12345678', '77777777', '1343', 'funcionario@company.com', 'edson.ferreira@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1390, 'Ariel', 'Ayaviri', 'Omonte', '0000-00-00', '12345678', '77777777', '1316', 'funcionario@company.com', 'aayaviri@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1411, 'Osvaldo Walter', 'Romero', 'Aro', '1986-10-13', '12345678', '77777777', '4513', 'funcionario@company.com', 'osvaldo.romero@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1418, 'Guillermo German', 'Pucho', 'Llanquechoque', '1979-02-10', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1419, 'Carpio Mariana Andrea', 'Maceres', 'Del', '1980-10-12', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1447, 'Selva Ruth', 'Rodriguez', 'Hirose', '0000-00-00', '12345678', '77777777', '4141', 'funcionario@company.com', 'selva.rodriguez@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1468, 'Brainer Humberto', 'Melgar', 'Vaca', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1470, 'Alvaro', 'Arauz', 'Lima', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', 'alvaro.arauz@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1475, 'Maria Monica', 'Miranda', 'Riveros', '0000-00-00', '12345678', '77777777', '4101', 'funcionario@company.com', 'monica.miranda@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1476, 'Luis Fernando', 'Teran', 'Guzman', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1477, 'Juan Ramiro', 'Ortiz', 'Villarroel', '1960-06-30', '12345678', '77777777', '1614', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1480, 'Dorian Vladimir', 'Pantoja', 'Rocha', '1969-11-16', '12345678', '77777777', '1803', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMEN-UNIDAD MERCADO ENERGETICO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1483, 'Oscar Enrrique', 'Muriel', 'Condori', '1971-04-18', '12345678', '77777777', '1705', 'funcionario@company.com', 'oscar.muriel@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1493, 'Rene Juan', 'Viraca', 'Ayca', '1974-09-05', '12345678', '77777777', '', 'funcionario@company.com', 'rene.viraca@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1552, 'Luis Fernando', 'Cruz', 'Bravo', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1589, 'Danitza Adriana', 'Helguero', 'Veizaga', '1987-02-21', '12345678', '77777777', '1338', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1603, 'Abel', 'Olmos', 'Oropeza', '1964-12-28', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1627, 'Henrry Arturo', 'Mendoza', 'Moscoso', '1977-11-03', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(1631, 'Litzi', 'Gutierrez', 'Acha', '1985-04-15', '12345678', '77777777', '1534', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7250, 'Juan Manuel', 'Montaño', 'Ugarte', '1983-01-25', '12345678', '77777777', '6240', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RDTD-REGIONAL DISTRIBUCION TRINIDAD', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo');
INSERT INTO `com_funcionario` (`id_funcionario`, `nombres`, `apellido_pat`, `apellido_mat`, `cumpleanio`, `telefono_fijo`, `celular`, `interno`, `email_ende`, `email_personal`, `email_personal_opc`, `profesion`, `cargo`, `unidad_organizacional`, `jefe_inmediato`, `lugar_trabajo`, `path_foto`, `tipo_sangre`, `estado`) VALUES
(7253, 'Jairo Daniel', 'Vargas', 'Vargas', '1980-02-02', '12345678', '77777777', '1659', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7264, 'Ruben', 'Condori', 'Alejo', '0000-00-00', '12345678', '77777777', '1834', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7274, 'Nicolas Edgar', 'Oros', 'Fernandez', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7278, 'Oscar Guido', 'Ferrel', 'Camacho', '1962-12-22', '12345678', '77777777', '1526', 'funcionario@company.com', 'oscar.ferrel@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7289, 'Felix Deibyd', 'Villarroel', 'Zurita', '1970-05-18', '12345678', '77777777', '1432', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7309, 'Ilse Jhanneth', 'Pardo', 'Cespedes', '1977-10-19', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7317, 'Jhonny', 'Espada', 'Espada', '0000-00-00', '12345678', '77777777', '1537', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7319, 'Sara Alejandra', 'Jauregui', 'Jines', '1984-07-16', '12345678', '77777777', '1118', 'funcionario@company.com', 'sara.jauregui@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7422, 'Ivan Jose', 'Rivero', 'Portugal', '2011-07-07', '12345678', '77777777', '1115', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7445, 'Mauricio Cristhiam', 'Gonzales', 'Lopez', '1980-08-24', '12345678', '77777777', '1243', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7463, 'Ismael', 'Flores', 'Torrico', '1986-09-02', '12345678', '77777777', '4511', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7488, 'Carmen', 'Liendo', '', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7493, 'Luis Felipe', 'Quispe', 'Aricoma', '1964-05-01', '12345678', '77777777', '', 'funcionario@company.com', 'luis.quispe@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7496, 'Manuel Antonio', 'Diaz', 'Pantoja', '1983-12-27', '12345678', '77777777', '1447', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMEN-UNIDAD MERCADO ENERGETICO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7500, 'Veronica Ruth', 'Guarachi', 'Condori', '1983-05-26', '12345678', '77777777', '3111', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'CLPZ-COORDINACION LA PAZ', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7516, 'Jorge Arturo', 'Iporre', 'Salguero', '1960-09-25', '12345678', '77777777', '1000', 'funcionario@company.com', 'jorge.iporre@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PREJ-PRESIDENCIA EJECUTIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7519, 'Huascar Abelardo', 'Vallejo', 'Torrico', '1974-04-18', '12345678', '77777777', '1508', 'funcionario@company.com', 'huascar.vallejo@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7520, 'Jorge Yusett', 'Borda', 'Montaño', '1976-03-02', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7533, 'Yerko Alex', 'Carvajal', 'Herbas', '1970-07-09', '12345678', '77777777', '1441', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7556, 'Yussela Nevenka', 'Villazon', 'Vargas', '0000-00-00', '12345678', '77777777', '1521', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7591, 'Ruben', 'Cayo', 'Lancea', '1981-11-19', '12345678', '77777777', '4525', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7599, 'Susana Alejandra', 'Kolbe', 'Arce', '1982-09-29', '12345678', '77777777', '1533', 'funcionario@company.com', 'susana.kolbe@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7605, 'Marvin Vicente', 'Beramendi', 'Orellana', '1974-08-18', '12345678', '77777777', '1524', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7614, 'Dario', 'Vasquez', 'Flores', '1988-07-06', '12345678', '77777777', '4526', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7633, 'Edwin', 'Cespedez', 'Amurrio', '1974-02-14', '12345678', '77777777', '1711', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7830, 'Freddy', 'Rivero', 'Cardona', '0000-00-00', '12345678', '77777777', '6516', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'SSIM-SISTEMA SAN IGNACIO DE MOXOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7870, 'Esteban', 'Grandy', 'Choque', '0000-00-00', '12345678', '77777777', '1506', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7875, 'Eduardo', 'Ferrufino', 'Olmos', '1987-03-09', '12345678', '77777777', '4515', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7896, 'Ramiro', 'Paco', 'Escobar', '1974-05-11', '12345678', '77777777', '1654', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7902, 'Reynaldo Nestor', 'Rivera', 'Marca', '1970-02-26', '12345678', '77777777', '1835', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7970, 'Eduardo', 'Acosta', 'Rodriguez', '0000-00-00', '12345678', '77777777', '1651', 'funcionario@company.com', 'eduardo.acosta@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7971, 'Rimer', 'Claros', 'Montaño', '1983-07-27', '12345678', '77777777', '', 'funcionario@company.com', 'rimer.claros@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(7999, 'Juvenal', 'Gomez', 'Espinoza', '1984-05-07', '12345678', '77777777', '1836', 'funcionario@company.com', 'juvenal.gomez@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8081, 'Maria Lidia', 'Montenegro', 'Guagama', '1987-05-18', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8102, 'Faviola', 'Marpartida', 'Machado', '1987-07-22', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8136, 'Daniela Alejandra', 'Zavaleta', 'Mercado', '1984-08-17', '12345678', '77777777', '1849', 'funcionario@company.com', 'daniela.zavaleta@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8226, 'Francisco Adolfo', 'Perez', 'Aramayo', '1963-04-27', '12345678', '77777777', '1275', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8237, 'Roxana', 'Vargas', 'Mercado', '1984-10-10', '12345678', '77777777', '1111', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8239, 'Marlene', 'Alconz', 'Benavidez', '1967-05-11', '12345678', '77777777', '1108', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8245, 'Ricardo Augusto', 'Angulo', 'Reynaga', '1951-06-20', '12345678', '77777777', '1265', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8305, 'Rafael Ismael', 'Santillan', 'Flores', '1968-06-17', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8309, 'Jose Manuel', 'Uzquiano', 'Alcoreza', '1975-03-23', '12345678', '77777777', '3110', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'CLPZ-COORDINACION LA PAZ', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8374, 'Abraham Abdon', 'Inca', 'Nina', '0000-00-00', '12345678', '77777777', '1834', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8378, 'Graciela', 'Luna', 'Ramirez', '1981-09-24', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8406, 'Mercedes', 'Mamio', 'Castro', '1977-08-03', '12345678', '77777777', '6515', 'funcionario@company.com', 'mercedes.mamio@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'SSIM-SISTEMA SAN IGNACIO DE MOXOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8407, 'Rosalia', 'Limaica', 'Javivi', '1988-07-15', '12345678', '77777777', '6517', 'funcionario@company.com', 'rosalia.limaica@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'SSIM-SISTEMA SAN IGNACIO DE MOXOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8421, 'Arminda', 'Villazon', 'Morales', '1973-05-28', '12345678', '77777777', '1140', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UAIN-UNIDAD AUDITORIA INTERNA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8424, 'Daniel Gustavo', 'Villarroel', 'Camacho', '0000-00-00', '12345678', '77777777', '1882', 'funcionario@company.com', 'daniel.villarroel@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8425, 'Pedro Romulo', 'Ramos', 'Sullcani', '0000-00-00', '12345678', '77777777', '1883', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8437, 'Monica', 'Landivar', 'Villagomez', '1978-07-04', '12345678', '77777777', '1848', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8451, 'Jaime Rodrigo', 'Luna', 'Ovando', '1980-06-29', '12345678', '77777777', '1110', 'funcionario@company.com', 'jaime.luna@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8476, 'Jose Claudio', 'Montecinos', 'Villarroel', '0000-00-00', '12345678', '77777777', '1140', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UAIN-UNIDAD AUDITORIA INTERNA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8477, 'Zulma', 'Vigabriel', 'Ojeda', '0000-00-00', '12345678', '77777777', '1140', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UAIN-UNIDAD AUDITORIA INTERNA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8492, 'Jose', 'Ferrufino', 'Quinteros', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8501, 'Nikhy Jeahson', 'Leon', 'Avila', '1970-04-23', '12345678', '77777777', '1448', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8503, 'Ronald Christian', 'Gomez', 'Iporre', '1979-08-16', '12345678', '77777777', '4520', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8506, 'Delsen', 'Joaniquina', 'Bustillos', '1967-12-23', '12345678', '77777777', '4515', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8518, 'Ricardo Enrique', 'Ramos', 'Moscoso', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8607, 'Israel Jose', 'Chacon', 'Roca', '0000-00-00', '12345678', '77777777', '1884', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8617, 'Marcos Andres', 'Crespo', 'Monroy', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8654, 'Flavia Antonieta', 'Alarcon', 'Alarcon', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8662, 'Ariel', 'Gutierrez', 'Guzman', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8673, 'Marcelo', 'Treviño', 'Saravia', '0000-00-00', '12345678', '77777777', '1214', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8683, 'Wilfredo', 'Valdez', 'Benitez', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8697, 'Marco Antonio', 'Rossel', 'Zapata', '1982-01-16', '12345678', '77777777', '', 'funcionario@company.com', 'marco.rossel@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8714, 'Ramiro Fernando', 'Lozada', 'Gonzales', '0000-00-00', '12345678', '77777777', '1507', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8726, 'Maximo Rafael', 'Guzman', 'Murillo', '1977-02-07', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8740, 'Deisy Susy', 'Palenque', 'Aliendre', '1968-03-09', '12345678', '77777777', '1627', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8744, 'Vivian Clareth', 'Bejarano', 'Arteaga', '0000-00-00', '12345678', '77777777', '1847', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8748, 'Filimon', 'Jaramillo', 'Soruco', '1985-08-11', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8749, 'Caterine Suzanne', 'Oliver', 'Terrazas', '1988-08-07', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8751, 'Gina Andrea', 'Vaca', 'Ysita', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8753, 'Miguel Antonio', 'Liañez', 'Amblo', '1973-07-01', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8754, 'Marco Antonio', 'Flores', 'Juaniquina', '1966-07-26', '12345678', '77777777', '', 'funcionario@company.com', 'antonio.flores@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8762, 'Jhonny Osvaldo', 'Ayala', 'Camacho', '1958-11-17', '12345678', '77777777', '', 'funcionario@company.com', 'jhonny_ayala@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8780, 'Jhonny Hernan', 'Molina', 'Terceros', '1970-09-06', '12345678', '77777777', '1438', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8811, 'Luis Carlos', 'Orellana', 'Montaño', '1970-11-12', '12345678', '77777777', '1443', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8824, 'Elmer', 'Velasquez', 'Ovando', '1988-07-04', '12345678', '77777777', '1313', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8826, 'Sergio', 'Callau', 'Medrano', '1989-11-19', '12345678', '77777777', '', 'funcionario@company.com', 'sergio.callau@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8855, 'Reyna Clotilde', 'Heredia', 'Arnez', '0000-00-00', '12345678', '77777777', '1219', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8856, 'Fresia Roxana', 'Segovia', 'Balderrama', '1968-05-01', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8857, 'Olivia Carmen', 'Lobo', 'Muñoz', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8863, 'Lijeron Rosa Jaqueline', 'Garcia', 'De', '1965-08-29', '12345678', '77777777', '1001', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PREJ-PRESIDENCIA EJECUTIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8893, 'Edward Reinaldo', 'Villarroel', 'Aramayo', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8894, 'Miguel', 'Guaman', 'Vargas', '1981-07-05', '12345678', '77777777', '', 'funcionario@company.com', 'miguel.guaman@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8895, 'Jhovanka Cristina', 'Pacheco', 'Zaconeta', '1967-08-28', '12345678', '77777777', '1871', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8896, 'Rene Jose', 'Montaño', 'Camacho', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8897, 'Marina', 'Vargas', 'Mamani', '0000-00-00', '12345678', '77777777', '1231', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8900, 'Danny Miguel', 'Revilla', 'Vargas', '0000-00-00', '12345678', '77777777', '1888', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8912, 'Milenka Vanessa', 'Balderrama', 'Rivero', '0000-00-00', '12345678', '77777777', '1207', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'URHU-UNIDAD RECURSOS HUMANOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8923, 'Jacqueline', 'Andia', 'Berazain', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8937, 'Juan Pablo', 'Suntura', 'Mendoza', '1980-10-20', '12345678', '77777777', '1317', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8953, 'Javier Nelson', 'Cespedes', 'Ramirez', '1962-08-06', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8959, 'Edwin Roberto', 'Saldias', 'Delgado', '1964-06-08', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PREJ-PRESIDENCIA EJECUTIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8971, 'Marcos Henry', 'Delgado', 'Vargas', '1976-10-16', '12345678', '77777777', '1247', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DGFN-DEPARTAMENTO GESTION FINANCIERA Y NEGOCIOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(8987, 'Luis Antonio', 'Chavarria', 'Tejada', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9043, 'Lopez Cristina Jacqueline', 'Soria', 'Galvarro', '0000-00-00', '12345678', '77777777', '1277', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9044, 'Jimmy', 'Santillan', 'Montaño', '1982-01-06', '12345678', '77777777', 'TDE', 'funcionario@company.com', 'jimmy.santillan@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9090, 'Ruth Felisa', 'Cary', 'Cruz', '1972-06-09', '12345678', '77777777', '', 'funcionario@company.com', 'ruth_cary@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9098, 'Angelica', 'Zambrana', 'Monduela', '0000-00-00', '12345678', '77777777', '1278', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9111, 'Carlos', 'Acosta', 'Callau', '0000-00-00', '12345678', '77777777', '1871', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9112, 'Cesar Augusto', 'Iriarte', 'Reque', '0000-00-00', '12345678', '77777777', '1881', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9119, 'Mariana Patricia', 'Muñoz', 'Collazos', '1970-12-06', '12345678', '77777777', '1101', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'URHU-UNIDAD RECURSOS HUMANOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9180, 'Janet Rosario', 'Rojas', 'Rivera', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9183, 'Eulogio', 'Berna', 'Delgado', '1979-03-11', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9184, 'Jhedy Wilver', 'Huayca', 'Colque', '0000-00-00', '12345678', '77777777', '7110', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9194, 'Katia Sandra', 'Navia', 'Bascope', '0000-00-00', '12345678', '77777777', '1301', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9200, 'Daniel Marcelo', 'Solis', 'Salazar', '1979-10-10', '12345678', '77777777', '1612', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9203, 'Javier Bernardo', 'Rivero', 'Chavez', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9231, 'Lilian', 'Saavedra', 'Acosta', '0000-00-00', '12345678', '77777777', '1831', 'funcionario@company.com', 'lilian.saavedra@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9241, 'Gilka Wara', 'Aneyba', 'Ivanovic', '1967-10-28', '12345678', '77777777', '1106', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PREJ-PRESIDENCIA EJECUTIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9244, 'Roberto Carlos', 'Morales', 'Michel', '0000-00-00', '12345678', '77777777', '1518', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9249, 'Boris Rolando', 'Rojas', 'Romero', '1983-11-18', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9257, 'Jorge Reynaldo', 'Patton', 'Toledo', '1967-03-12', '12345678', '77777777', '1838', 'funcionario@company.com', 'jorge.patton@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9272, 'Enrique', 'Orias', 'Salazar', '1978-07-15', '12345678', '77777777', '', 'funcionario@company.com', 'enrique.orias@sende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9280, 'Hjalmar Eberth', 'Villarroel', 'Hidalgo', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9341, 'Jimmy Pablo', 'Escobar', 'Montaño', '0000-00-00', '12345678', '77777777', '1839', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9344, 'Jovanna Virginia', 'Mansilla', 'Angulo', '1990-07-26', '12345678', '77777777', '1846', 'funcionario@company.com', 'jovannamansilla@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9348, 'Viviana', 'Velarde', 'Espinoza', '1972-11-15', '12345678', '77777777', '1215', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9349, 'Victor Hugo', 'Salazar', 'Perez', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DGEM-DEPARTAMENTO GESTION DE EMPRESAS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9364, 'Katheryne', 'Herrera', 'Andrade', '1980-06-08', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9369, 'Santos Marcelino', 'Huanca', 'Acho', '1987-04-06', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9379, 'Freddy', 'Zurita', 'Lopez', '0000-00-00', '12345678', '77777777', '1886', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9401, 'Natalia Fabiola', 'Medrano', 'Cambara', '1989-05-18', '12345678', '77777777', '1318', 'funcionario@company.com', 'natalia.medrano@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9406, 'Richard Ruben', 'Quiroz', 'Zubieta', '1976-05-27', '12345678', '77777777', '', 'funcionario@company.com', 'richard.quiroz@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9413, 'Cecilia Carolina', 'Escobar', 'Mollo', '1985-07-09', '12345678', '77777777', '1608', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9422, 'Alan Wilson', 'Garcia', 'Garcia', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9427, 'Richard Jhony', 'Covarrubias', 'Castellon', '1976-01-06', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9433, 'Jose Julio', 'Soruco', 'Aparicio', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9438, 'Henry', 'Siacara', 'Cardenas', '0000-00-00', '12345678', '77777777', '1140', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UAIN-UNIDAD AUDITORIA INTERNA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9445, 'Carpio Ciro Vladimir', 'Ledezma', 'Del', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9451, 'Guilberth Antonio', 'Lopez', 'Pinedo', '2013-06-03', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9463, 'Enrique Steven', 'Ayala', 'Poma', '1979-05-24', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9486, 'Jorge Rolando', 'Rea', 'Vaca', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9487, 'Manuel', 'Pachuri', 'Limpias', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9488, 'Fabial Adilis', 'Casupa', 'Cespedes', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UECO-UNIDAD EXPANSION DE LA COBERTURA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9492, 'Karla Cecilia', 'Encinas', 'Santiago', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9523, 'Angelica Maria', 'Albarracin', 'Pendola', '1974-08-08', '12345678', '77777777', '1844', 'funcionario@company.com', 'angelica.albarracin@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9542, 'Isabel Jimena', 'Flores', 'Montaño', '0000-00-00', '12345678', '77777777', '1219', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9543, 'Martha Neizy', 'Valda', 'Ayala', '0000-00-00', '12345678', '77777777', '1219', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9548, 'Jose Luis', 'Zurita', 'Villarpando', '1984-11-28', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9563, 'Alfonso', 'Encinas', 'Ramirez', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9566, 'Isabel Andrea', 'Ortiz', 'Jimenez', '0000-00-00', '12345678', '77777777', '1889', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9568, 'Luis Fernando', 'Arce', 'Duran', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9569, 'Richard', 'Vale', 'Arce', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9605, 'Luis Valentin', 'Patzi', 'Condorino', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9614, 'Juan Carlos', 'Numbela', 'Flores', '1965-07-02', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9617, 'Olivier Fernando', 'Burgos', 'Condori', '1984-07-11', '12345678', '77777777', '', 'funcionario@company.com', 'olivier.burgos@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9649, 'Hans Werner', 'Richter', 'Carrasco', '1990-02-21', '12345678', '77777777', '1442', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9703, 'Asunta Alejandra', 'Duran', 'Teco', '1990-08-15', '12345678', '77777777', '6515', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'SSIM-SISTEMA SAN IGNACIO DE MOXOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9708, 'Sandro Marcelo', 'Siñaniz', 'Diaz', '1973-01-22', '12345678', '77777777', '', 'funcionario@company.com', 'sandro.sinaniz@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9710, 'Raquel Milenka', 'Garcia', 'D Rpic', '1986-09-06', '12345678', '77777777', '1258', 'funcionario@company.com', 'raquel.garcia@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9712, 'Mariela', 'Bascope', 'Zarate', '1987-04-01', '12345678', '77777777', '', 'funcionario@company.com', 'mariela.bascope@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9716, 'Cintia Mabel', 'Carvajal', 'Luna', '1982-01-04', '12345678', '77777777', '1877', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9721, 'Ana Lia', 'Cortez', 'Alvarez', '1970-12-29', '12345678', '77777777', '1209', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'URHU-UNIDAD RECURSOS HUMANOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9726, 'Alexander', 'Alé', 'Baldivieso', '2013-06-11', '12345678', '77777777', '1877', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PGLC-PROYECTO GEOTERMICO LAGUNA COLORADA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9733, 'Medina Karen Sharlyn', 'Gutierrez', 'Doria', '1985-07-17', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9742, 'Noelia', 'Orellana', 'Salazar', '1987-01-16', '12345678', '77777777', '', 'funcionario@company.com', 'noelia.orellana@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DGFN-DEPARTAMENTO GESTION FINANCIERA Y NEGOCIOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9774, 'Patricia Rita', 'Pizarro', 'Delgado', '1965-06-19', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9776, 'Juan Diego', 'Murillo', 'Arnez', '1987-07-01', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9782, 'Americo', 'Fiorilo', 'Lozada', '1980-11-30', '12345678', '77777777', '1300', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9783, 'David', 'Gamboa', 'Quispe', '1962-03-29', '12345678', '77777777', '1539', 'funcionario@company.com', 'david.gamboa@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9796, 'Cesar Antonio', 'Patiño', 'Reyes', '1984-12-12', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9812, 'Lorenzo Antonio', 'Castro', 'Portales', '1958-08-10', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9814, 'Wilber', 'Taraune', 'Cayo', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9821, 'Ramiro Andres', 'Sanchez', 'Lopez', '1969-05-18', '12345678', '77777777', '1013', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UCCO-UNIDAD COORDINACION CORPORATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9864, 'Vladimir Milton', 'Gomez', 'Vidal', '1976-02-18', '12345678', '77777777', '1449', 'funcionario@company.com', 'vladimir.gomez@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(9956, 'Maria Patricia Melina', 'Ortiz', 'Santa', '1980-04-18', '12345678', '77777777', '', 'funcionario@company.com', 'osmpatty@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'URHU-UNIDAD RECURSOS HUMANOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10005, 'Melany Rocio', 'Pantoja', 'Crespo', '1985-11-02', '12345678', '77777777', '1140', 'funcionario@company.com', 'melany.pantoja@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UAIN-UNIDAD AUDITORIA INTERNA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10251, 'Roxana', 'Mosqueira', 'Parada', '1956-09-06', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10314, 'Erik Marcelo', 'Cardenas', 'Cabero', '1976-10-12', '12345678', '77777777', '1140', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UAIN-UNIDAD AUDITORIA INTERNA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10320, 'Rilver Guery', 'Choquechambi', 'Catorceno', '1977-09-05', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10326, 'Wilder Edwin', 'Terceros', 'Lopez', '1976-12-12', '12345678', '77777777', '1215', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10327, 'Javier', 'Lazarte', 'Montaño', '1976-07-15', '12345678', '77777777', '1839', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10328, 'Rolando', 'Salguero', '.', '1977-08-12', '12345678', '77777777', '1534', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10335, 'Pedro', 'Ramirez', 'Ilaquita', '1980-12-01', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10358, 'Juan Jose', 'Parraga', 'Paravicini', '1970-06-21', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10363, 'Jose Miguel', 'Arze', 'Mena', '1989-08-23', '12345678', '77777777', '1644', 'funcionario@company.com', 'miguel.arze@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10364, 'Pamela', 'Sanabria', 'Villarroel', '1987-02-24', '12345678', '77777777', '', 'funcionario@company.com', 'pamela.sanabria@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10367, 'Vladimir Gaston', 'Arancibia', 'Camacho', '1962-06-01', '12345678', '77777777', '1120', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PREJ-PRESIDENCIA EJECUTIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10368, 'Jorge Daniel', 'Claros', 'Choque', '1983-12-03', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10377, 'Rolando', 'Limpias', 'Alvarez', '1978-11-16', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10379, 'Robert', 'Lurici', 'Siviora', '1988-05-04', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10380, 'Yordy', 'Rocha', 'Crespo', '1994-03-06', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10382, 'Layoner', 'Ubano', 'Bate', '1978-01-03', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10399, 'Daniel Vladimir', 'Franco', 'Campos', '1988-08-14', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10401, 'Javier Luis', 'Quiroz', 'Vargas', '1972-01-09', '12345678', '77777777', '', 'funcionario@company.com', 'javier.quiroz@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10402, 'Maria Janeth', 'Quinteros', 'Licona', '1976-11-16', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'PREJ-PRESIDENCIA EJECUTIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo');
INSERT INTO `com_funcionario` (`id_funcionario`, `nombres`, `apellido_pat`, `apellido_mat`, `cumpleanio`, `telefono_fijo`, `celular`, `interno`, `email_ende`, `email_personal`, `email_personal_opc`, `profesion`, `cargo`, `unidad_organizacional`, `jefe_inmediato`, `lugar_trabajo`, `path_foto`, `tipo_sangre`, `estado`) VALUES
(10413, 'Noelia Leslie', 'Sanzetenea', 'Ramirez', '1985-04-06', '12345678', '77777777', '1601', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10448, 'Luis Alberto', 'Vargas', 'Astroña', '1984-11-29', '12345678', '77777777', '1334', 'funcionario@company.com', 'alberto.vargas@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10453, 'Omar Roberto', 'Zambrana', 'Vilar', '1971-02-23', '12345678', '77777777', '1344', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN-UNIDAD TECNOLOGIAS DE INFORMACION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10454, 'Javier Jimmy', 'Caceres', 'Foronda', '1967-01-24', '12345678', '77777777', '1219', 'funcionario@company.com', 'javier.caceres@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10512, 'Cecilia Sofia', 'Nuñez', 'Medina', '1988-10-21', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10513, 'Mark', 'Griffiths', 'Echalar', '1991-02-25', '12345678', '77777777', '', 'funcionario@company.com', 'mark.griffiths@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10514, 'Liz Karen', 'Montecinos', 'Rivero', '2014-12-18', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10515, 'Juan Veimar', 'Vasquez', 'Bazoalto', '1981-02-13', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UESI-UNIDAD EXPANSION DEL SISTEMA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10519, 'Arturo Eliot', 'Adriazola', 'Gallardo', '1978-06-30', '12345678', '77777777', '', 'funcionario@company.com', 'arturo.adriazola@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10520, 'Juan Pablo', 'Abularach', 'Hinojosa', '1978-04-21', '12345678', '77777777', '', 'funcionario@company.com', 'juan.abularach@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10549, 'Vladimir', 'Rocha', 'Corrales', '1986-10-07', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10554, 'Alejandra', 'Ontiveros', 'Olguin', '1986-01-09', '12345678', '77777777', '1279', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10557, 'Nasaya', 'Rodriguez', 'Siles', '1988-11-28', '12345678', '77777777', '1232', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10559, 'Sergio', 'Sanchez', 'Sanchez', '1981-05-04', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10560, 'Gary Zagir', 'Guiteras', 'Madde', '1981-10-26', '12345678', '77777777', '', 'funcionario@company.com', 'gary.guiteras@endeb.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10564, 'Roberto Ariel', 'Garcia', 'Loayza', '1973-07-31', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10566, 'Silvia Margaret', 'Villarroel', 'Vasquez', '1982-04-17', '12345678', '77777777', '1836', 'funcionario@company.com', 'silvia.villarroel@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10567, 'Elba Monica', 'Albarracin', 'Monje', '1966-12-22', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10572, 'Raul Orlando', 'Chavarria', 'Ondarza', '1981-07-10', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10575, 'Marcelo', 'Paz', 'Blanco', '1982-04-25', '12345678', '77777777', '1831', 'funcionario@company.com', 'marcelo.paz@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10589, 'Daniel', 'Arispe', '', '1960-12-11', '12345678', '77777777', '', 'funcionario@company.com', 'daniel.arispe@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10601, 'Walter', 'Chura', 'Chura', '1990-12-11', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'USIN-UNIDAD SISTEMA INTERCONECTADO', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10617, 'Carpio Helen Tatiana', 'Choque', 'Del', '1978-02-21', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10641, 'Luis Francisco', 'Mamani', 'Tintaya', '1982-08-25', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10647, 'Ana Luz', 'Camacho', 'Espinoza', '1974-08-25', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'GOSE-GERENCIA NACIONAL OPERACION SISTEMAS ELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10650, 'Guillermo', 'Morales', 'Rainoff', '1957-05-05', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'GOSE-GERENCIA NACIONAL OPERACION SISTEMAS ELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10655, 'Romny Geri', 'Soliz', 'Tapia', '1978-11-19', '12345678', '77777777', '1219', 'funcionario@company.com', 'gery_so@yahoo.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEEM-DEPARTAMENTO ECONOMIA EMPRESARIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10662, 'Justina', 'Garcia', 'Mamani', '1976-05-28', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10693, 'Diego Armando', 'Vargas', 'Miranda', '1984-12-03', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DGFN-DEPARTAMENTO GESTION FINANCIERA Y NEGOCIOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10699, 'Danny', 'Rodriguez', 'Sandoval', '1979-09-06', '12345678', '77777777', '', 'funcionario@company.com', 'dannyrodriguez.s@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPH-DEPARTAMENTO EJECUCION PROYECTOS HIDROELECTRICOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10701, 'Edwin', 'Cruz', 'Huanca', '1989-07-17', '12345678', '77777777', '', 'funcionario@company.com', 'edwin.cruz@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10702, 'Vannia Nedda', 'Novillo', 'Beltran', '1984-04-21', '12345678', '77777777', '', 'funcionario@company.com', 'vannia.novillo@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DDME-DEPARTAMENTO DESARROLLO DE MERCADOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10703, 'Victor Hugo', 'Sanabria', 'Coca', '1979-09-20', '12345678', '77777777', '', 'funcionario@company.com', 'victor.sanabria@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UAIN-UNIDAD AUDITORIA INTERNA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10742, 'Marco Antonio', 'Daza', 'Butron', '1968-05-12', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10743, 'Maria Cristina', 'Quiroz', 'Medrano', '1971-06-15', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DGFN-DEPARTAMENTO GESTION FINANCIERA Y NEGOCIOS', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10744, 'Roberto Carlos', 'Caceres', 'Garcia', '0000-00-00', '12345678', '77777777', '6215', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'EDEL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10761, 'Cain', 'Achimo', 'Navi', '1984-02-02', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'RCBJ-REGIONAL COBIJA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10764, 'Reynaldo', 'Pinaya', 'Guzman', '1979-02-27', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10767, 'Oscar Alex', 'Claure', 'Vidaurre', '1976-08-18', '12345678', '77777777', '', 'funcionario@company.com', 'oscar.claure@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10768, 'Miguel Angel', 'Achucarro', 'Rodriguez', '1970-07-11', '12345678', '77777777', '', 'funcionario@company.com', 'miguel.achucarro@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10770, 'Oscar German', 'Estrada', 'Alvarez', '1970-09-25', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10775, 'Wily Cornelio', 'Arispe', 'Meruvia', '1963-09-16', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UAIN-UNIDAD AUDITORIA INTERNA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10785, 'Claudia', 'Vargas', 'Aguilar', '1990-06-01', '12345678', '77777777', '', 'funcionario@company.com', 'claudia.vargas@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10786, 'Ricardo', 'Cuellar', 'Iva', '1974-12-15', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10788, 'Jhonn Asir', 'Valle', 'Aparicio', '1984-01-15', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT-DPTO. EJECUCION PROYECTOS TRANSMISION', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10797, 'Carlota Cecilia', 'Rivero', 'Guzman', '1976-11-25', '12345678', '77777777', '', 'funcionario@company.com', 'cecita_rg@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'DEPT', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10815, 'Andrea Elizabet', 'Vargas', 'Zeballos', '1989-05-18', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10830, 'Vladimir', 'Serna', 'Revollo', '1961-12-20', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'GERENCIA NACIONAL DE DESARROLLO ESTRATEGICO Y EXPORTACI?N', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10845, 'Daniela Miriam', 'Quintela', 'Noguer', '1978-09-15', '12345678', '77777777', '', 'funcionario@company.com', 'daniela.quintela@ende.bo', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10933, 'Melissa Adriana', 'Veizaga', 'Camacho', '1990-02-11', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'GNDEE', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10934, 'Lindsay Nadya', 'Lopez', 'Almaraz', '1989-01-29', '12345678', '77777777', '', 'funcionario@company.com', 'linds_29018@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10937, 'Carlos Alberto', 'Salazar', 'Dominguez', '1974-08-05', '12345678', '77777777', '', 'funcionario@company.com', 'calbert44@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10938, 'Ederson', 'Taboada', 'Alvez', '1987-02-23', '12345678', '77777777', '', 'funcionario@company.com', 'ederson_taboada@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10987, 'Abdul Fredy', 'Dominguez', 'Aguada', '1991-06-13', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(10989, 'Israel', 'Terceros', 'Delgadillo', '1990-05-02', '12345678', '77777777', '', 'funcionario@company.com', 'isra_t1d2@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11033, 'Brisa Fernanda', 'Roman', 'Acha', '1989-08-21', '12345678', '77777777', '', 'funcionario@company.com', 'bri_roman@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'Hidroelectrico Misicuni', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11040, 'Wilson', 'Villa', 'Tarqui', '1987-05-12', '12345678', '77777777', '', 'funcionario@company.com', 'wilsonsennin@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11080, 'Coralia Valeria', 'Garcia', 'Cruz', '1970-10-14', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UJUR-UNIDAD JURIDICA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11089, 'Maximo', 'Quispe', 'Miranda', '1961-11-18', '12345678', '77777777', '', 'funcionario@company.com', 'maximoquispe@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11104, 'Lavinia', 'Montero', 'Lazarte', '1979-09-15', '12345678', '77777777', '', 'funcionario@company.com', 'lavisytamontero@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11105, 'Paola Karen', 'Beltran', 'Mercado', '1990-07-15', '12345678', '77777777', '', 'funcionario@company.com', 'pao.pbm@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM-UNIDAD ADMINISTRATIVA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11108, 'Marcial', 'Rodriguez', 'Ustariz', '1991-06-12', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11109, 'Gerson Javier', 'Quino', 'Chamaca', '1992-12-10', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11110, 'Daniel', 'Quispe', 'Justo', '1984-08-15', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11148, 'Maira', 'Muñoz', 'Ortega', '1981-01-03', '12345678', '77777777', '', 'funcionario@company.com', 'mai_mu?oz@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11149, 'Cristian Rodrigo', 'De Los Rios', 'Espada', '1987-11-21', '12345678', '77777777', '', 'funcionario@company.com', 'cris_delosrios@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11150, 'Freddy', 'Yucra', 'Perez', '1980-03-18', '12345678', '77777777', '', 'funcionario@company.com', 'freddyyucra@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11220, 'Luis Felipe', 'Choque', 'Antezana', '1988-05-21', '12345678', '77777777', '', 'funcionario@company.com', 'loord_dark@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11221, 'Saul Job', 'Altamirano', 'Azurduy', '1973-04-26', '12345678', '77777777', '', 'funcionario@company.com', 'jobaltamirano@yahoo.es', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11222, 'Gonzalo Alejandro', 'Flores', 'Mendez', '1980-12-07', '12345678', '77777777', '', 'funcionario@company.com', 'alejandrofloresmendez@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UMGS-UNIDAD MEDIO AMBIENTE, GESTION SOCIAL Y SEG. INDUSTRIAL', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11223, 'Gabriel', 'Lazo', 'Velasco', '1987-10-15', '12345678', '77777777', '', 'funcionario@company.com', 'gabinocuate@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11246, 'Miguel Angel', 'Muruchi', 'Coca', '1985-04-16', '12345678', '77777777', '', 'funcionario@company.com', 'miguelangel-mur@hotmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11299, 'Jose', '', 'Saa', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', ''),
(11300, 'Gabriela', 'Lima', 'Montaño', '0000-00-00', '12345678', '77777777', '', 'funcionario@company.com', 'gabriela.slm@live.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM - Unidad Administrativa', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11301, 'Maria Leticia', 'Mamani', 'Mora', '1993-05-31', '12345678', '77777777', '', 'funcionario@company.com', 'lety1993.mlmm@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'VICEPRESIDENCIA', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11302, 'Eva', 'Chambi', 'Choquehuanca', '1987-01-17', '12345678', '77777777', '', 'funcionario@company.com', '', '-', 'Profesion Funcionario', 'CARGO ACTUAL', '', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11303, 'Daysi', 'Montaño', 'Perez', '1969-07-12', '12345678', '77777777', '1231', 'funcionario@company.com', 'daysimontano1@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UADM - Unidad Administrativa', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11304, 'Jose Luis', 'Iño', 'Quisbert', '1988-01-04', '12345678', '77777777', '', 'funcionario@company.com', 'jlbadboy@outlook.es', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'Regional Cobija', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11305, 'Juan Marcos', 'Iguay', 'Gonzales', '1976-08-03', '12345678', '77777777', '', 'funcionario@company.com', 'marcos.iguay@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'Ejecuci?n Proyectos Hidroelectricos', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11306, 'Denis', 'Rodriguez', 'Mendoza', '1990-05-13', '12345678', '77777777', '', 'funcionario@company.com', 'denis.rodriguez@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'UTIN', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11307, 'Jose Manuel', 'Torrico', 'Coronel', '1968-04-22', '12345678', '77777777', '', 'funcionario@company.com', 'jmtorricoronmr@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'VIPR', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11308, 'Grover Americo', 'Caero', 'Perez', '1979-02-02', '12345678', '77777777', '', 'funcionario@company.com', 'grovercaero@gmail.com', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'VIPR', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo'),
(11309, 'Johnny Manolo', 'Banda', 'Luna', '1978-03-14', '12345678', '77777777', '', 'funcionario@company.com', 'johnnybandaluna@yahoo.es', '-', 'Profesion Funcionario', 'CARGO ACTUAL', 'Vicepresidencia', 'JEFE INMEDIATO', 'LUGAR TRABAJO', '', '-', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_imagen`
--

CREATE TABLE `com_imagen` (
  `id_imagen` int(11) NOT NULL,
  `imagen` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_log`
--

CREATE TABLE `com_log` (
  `id_log` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `categoria` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `accion` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `detalle_accion` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_accion` date DEFAULT NULL,
  `hora_accion` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_log`
--

INSERT INTO `com_log` (`id_log`, `id_usuario`, `nombre_usuario`, `categoria`, `accion`, `detalle_accion`, `fecha_accion`, `hora_accion`) VALUES
(1, 952, 'denis.rodriguez', 'login', 'Ingreso', 'Login Exitóso', '2021-02-08', '13:41:47'),
(2, 952, 'denis.rodriguez', 'login', 'Ingreso', 'Login Exitóso', '2021-02-08', '14:42:13'),
(3, 952, 'denis.rodriguez', 'login', 'Ingreso', 'Login Exitóso', '2021-02-08', '14:44:18'),
(4, 952, 'denis.rodriguez', 'login', 'Ingreso', 'Login Exitóso', '2021-02-08', '14:47:47'),
(5, 952, 'denis.rodriguez', 'logout', 'Salida', 'Salida', '2021-02-08', '14:53:07'),
(6, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '14:53:09'),
(7, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '14:53:20'),
(8, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '14:53:55'),
(9, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '14:53:56'),
(10, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '14:53:58'),
(11, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '14:53:58'),
(12, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '14:53:59'),
(13, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '14:54:00'),
(14, 952, 'denis.rodriguez', 'login', 'Ingreso', 'Login Exitóso', '2021-02-08', '14:55:27'),
(15, 952, 'denis.rodriguez', 'Administrar/evento', 'Insert', 'Inserción en tabla com_evento', '2021-02-08', '15:00:01'),
(16, 952, 'denis.rodriguez', 'Administrar/categoria', 'Insert', 'Inserción en tabla com_categoria', '2021-02-08', '15:31:55'),
(17, 952, 'denis.rodriguez', 'Administrar/archivo', 'Insert', 'Inserción en tabla com_archivo', '2021-02-08', '15:46:36'),
(18, 952, 'denis.rodriguez', 'Administrar/mensaje', 'Insert', 'Inserción en tabla com_mensaje', '2021-02-08', '15:50:13'),
(19, 952, 'denis.rodriguez', 'logout', 'Salida', 'Salida', '2021-02-08', '16:13:03'),
(20, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:14:28'),
(21, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:14:30'),
(22, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:14:31'),
(23, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:14:33'),
(24, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:14:57'),
(25, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:15:00'),
(26, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:15:21'),
(27, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:15:23'),
(28, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:15:24'),
(29, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:15:42'),
(30, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:16:44'),
(31, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:16:44'),
(32, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:16:45'),
(33, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:16:47'),
(34, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '16:18:31'),
(35, 952, 'denis.rodriguez', 'login', 'Ingreso', 'Login Exitóso', '2021-02-08', '16:18:37'),
(36, 952, 'denis.rodriguez', 'logout', 'Salida', 'Salida', '2021-02-08', '16:21:47'),
(37, 952, 'denis.rodriguez', 'login', 'Ingreso', 'Login Exitóso', '2021-02-08', '16:21:56'),
(38, 952, 'denis.rodriguez', 'Administrar/categoria', 'Insert', 'Inserción en tabla com_categoria', '2021-02-08', '16:53:04'),
(39, 952, 'denis.rodriguez', 'Administrar/categoria', 'Insert', 'Inserción en tabla com_categoria', '2021-02-08', '16:53:39'),
(40, 952, 'denis.rodriguez', 'Administrar/archivo', 'Insert', 'Inserción en tabla com_archivo', '2021-02-08', '16:54:26'),
(41, 952, 'denis.rodriguez', 'Administrar/categoria', 'Insert', 'Inserción en tabla com_categoria', '2021-02-08', '17:28:49'),
(42, 952, 'denis.rodriguez', 'Administrar/archivo', 'Insert', 'Inserción en tabla com_archivo', '2021-02-08', '17:29:12'),
(43, 952, 'denis.rodriguez', 'Administrar/categoria', 'Delete', 'Eliminación del registro con ID: 2 en la tabla com_categoria', '2021-02-08', '17:29:23'),
(44, 952, 'denis.rodriguez', 'Administrar/categoria', 'Update', 'Update del registro con ID: 4, en la tabla com_categoria, datos antes del: categoria=>Noticias##descripcion=><p>\r\n	Avisos en general</p>\r\n##icono=>fa##estado=>activo##id_padre=>0##in_home=>si##tabla=>com_categoria##categoria_=>Administrar/categoria##', '2021-02-08', '17:29:32'),
(45, 952, 'denis.rodriguez', 'Administrar/album', 'Insert', 'Inserción en tabla com_album', '2021-02-08', '17:33:51'),
(46, 952, 'denis.rodriguez', 'Administrar/encuesta', 'Update', 'Update del registro con ID: 5, en la tabla com_encuesta, datos antes del: titulo=>Te gusta esta intenat?##descripcion=><p>\r\n	Encuesta sobre los gustos de la intranet</p>\r\n##estado=>activo##tabla=>com_encuesta##categoria_=>Administrar/encuesta##', '2021-02-08', '17:37:31'),
(47, 952, 'denis.rodriguez', 'Administrar/opciones', 'Insert', 'Inserción en tabla com_encuesta_opciones', '2021-02-08', '17:37:44'),
(48, 952, 'denis.rodriguez', 'Administrar/opciones', 'Insert', 'Inserción en tabla com_encuesta_opciones', '2021-02-08', '17:37:53'),
(49, 952, 'denis.rodriguez', 'Administrar/opciones', 'Insert', 'Inserción en tabla com_encuesta_opciones', '2021-02-08', '17:38:00'),
(50, 952, 'denis.rodriguez', 'login', 'Ingreso', 'Login Exitóso', '2021-02-08', '17:52:46'),
(51, 952, 'denis.rodriguez', 'Administrar/categoria', 'Insert', 'Inserción en tabla com_categoria', '2021-02-08', '18:13:14'),
(52, 952, 'denis.rodriguez', 'Administrar/archivo', 'Insert', 'Inserción en tabla com_archivo', '2021-02-08', '18:13:28'),
(53, 952, 'denis.rodriguez', 'logout', 'Salida', 'Salida', '2021-02-08', '18:14:54'),
(54, 952, 'denis.rodriguez', 'login', 'Ingreso', 'Login Exitóso', '2021-02-08', '18:14:55'),
(55, 952, 'denis.rodriguez', 'logout', 'Salida', 'Salida', '2021-02-08', '18:14:57'),
(56, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '18:14:58'),
(57, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '18:14:59'),
(58, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '18:14:59'),
(59, NULL, NULL, 'logout', 'Salida', 'Salida', '2021-02-08', '18:14:59'),
(60, 952, 'denis.rodriguez', 'login', 'Ingreso', 'Login Exitóso', '2021-02-08', '18:15:06'),
(61, 952, 'denis.rodriguez', 'logout', 'Salida', 'Salida', '2021-02-08', '18:22:11'),
(62, 952, 'denis.rodriguez', 'login', 'Ingreso', 'Login Exitóso', '2021-02-08', '18:22:12'),
(63, 952, 'denis.rodriguez', 'Administrar/roles', 'Delete', 'Eliminación del registro con ID: 5 en la tabla com_cargo', '2021-02-08', '18:22:25'),
(64, 952, 'denis.rodriguez', 'Administrar/archivo', 'Delete', 'Eliminación del registro con ID: 6 en la tabla com_archivo', '2021-02-08', '19:52:19'),
(65, 952, 'denis.rodriguez', 'Administrar/archivo', 'Delete', 'Eliminación del registro con ID: 7 en la tabla com_archivo', '2021-02-08', '19:52:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_mensaje`
--

CREATE TABLE `com_mensaje` (
  `id_mensaje` int(11) NOT NULL,
  `mensaje` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `autor` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_mensaje`
--

INSERT INTO `com_mensaje` (`id_mensaje`, `mensaje`, `autor`, `fecha`) VALUES
(1, '<p>\n	LA fe puede mover monta&ntilde;as</p>\n', 'Steve Jobs', '2021-02-08 10:50:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_privilegio`
--

CREATE TABLE `com_privilegio` (
  `id_privilegio` int(11) NOT NULL,
  `privilegio` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `acceso` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `icono_class` varchar(200) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'fa fa-cog'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_privilegio`
--

INSERT INTO `com_privilegio` (`id_privilegio`, `privilegio`, `acceso`, `icono_class`) VALUES
(2, 'Archivos', 'Administrar/archivo', 'fa fa-file'),
(3, 'Funcionarios', 'Administrar/funcionario', 'fa fa-users'),
(4, 'Pensamiento del Día', 'Administrar/mensaje', 'fa fa-comments-o'),
(5, 'Usuarios', 'Administrar/usuario', 'fa fa-user-plus'),
(6, 'Roles', 'Administrar/roles', 'fa fa-shield'),
(7, 'Privilegios', 'Administrar/privilegios', 'fa fa-key'),
(9, 'Subir Música', 'Administrar/multimedia/1', 'fa fa-music'),
(10, 'Subir Video', 'Administrar/multimedia/2', 'fa fa-video-camera'),
(12, 'Crear Album', 'Administrar/album', 'fa fa-camera-retro'),
(13, 'Agregar Eventos', 'Administrar/eventos', 'fa fa-calendar'),
(14, 'Crear Encuesta', 'Administrar/encuestas', 'fa fa-bar-chart'),
(15, 'Categorias', 'Administrar/categoria', 'fa fa-cog');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_publicacion`
--

CREATE TABLE `com_publicacion` (
  `id_publicacion` int(11) NOT NULL,
  `titulo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `destacada` enum('si','no') COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `path_file` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `path_image` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_tipo_publicacion` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_sistema`
--

CREATE TABLE `com_sistema` (
  `id_sistema` int(11) NOT NULL,
  `sistema` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `icono` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `link` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_sistema`
--

INSERT INTO `com_sistema` (`id_sistema`, `sistema`, `icono`, `link`) VALUES
(1, 'Sistema A', NULL, '#'),
(2, 'Sistema B', NULL, '#'),
(3, 'Sistema C', NULL, '#');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_tipo_publicacion`
--

CREATE TABLE `com_tipo_publicacion` (
  `id_tipo_publicacion` int(11) NOT NULL,
  `tipo_publicacion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `com_usuario`
--

CREATE TABLE `com_usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `fecha_ultima_modificacion` datetime DEFAULT NULL,
  `fecha_expiracion` date DEFAULT NULL,
  `estado` enum('activo','inactivo') COLLATE utf8_spanish_ci DEFAULT NULL,
  `login_local` enum('ldap','local') COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `com_usuario`
--

INSERT INTO `com_usuario` (`id_usuario`, `usuario`, `password`, `fecha_registro`, `fecha_ultima_modificacion`, `fecha_expiracion`, `estado`, `login_local`, `id_cargo`, `id_funcionario`) VALUES
(952, 'denis.rodriguez', 'b09164404492dfbc9c6884d393af94c4', '2015-05-26 00:00:00', NULL, NULL, 'activo', 'local', 1, 11306);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `example_1`
--

CREATE TABLE `example_1` (
  `id` int(11) NOT NULL,
  `url` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `example_2`
--

CREATE TABLE `example_2` (
  `id` int(11) NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `example_2`
--

INSERT INTO `example_2` (`id`, `url`, `priority`) VALUES
(172, 'eb4f-51.jpg', NULL),
(173, 'ac84-52.jpg', NULL),
(176, '7ad8-63.jpg', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `example_3`
--

CREATE TABLE `example_3` (
  `id` int(11) NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `example_3`
--

INSERT INTO `example_3` (`id`, `url`, `category_id`, `priority`) VALUES
(172, 'a48d-88.jpg', 22, NULL),
(173, '5e32-89.jpg', 22, NULL),
(174, '7628-90.jpg', 22, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `example_4`
--

CREATE TABLE `example_4` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `example_4`
--

INSERT INTO `example_4` (`id`, `title`, `url`, `priority`) VALUES
(172, 'My house!', 'eb4f-51.jpg', 1),
(173, 'Some flowers', 'ac84-52.jpg', 3),
(176, 'My garden!', '7ad8-63.jpg', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegio_cargo`
--

CREATE TABLE `privilegio_cargo` (
  `id_privilegio_cargo` int(11) NOT NULL,
  `id_privilegio` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `privilegio_cargo`
--

INSERT INTO `privilegio_cargo` (`id_privilegio_cargo`, `id_privilegio`, `id_cargo`) VALUES
(2, 2, 1),
(5, 3, 1),
(9, 4, 3),
(20, 11, 1),
(21, 4, 1),
(22, 7, 1),
(23, 6, 1),
(24, 9, 1),
(25, 10, 1),
(26, 5, 1),
(29, 11, 4),
(30, 4, 4),
(31, 9, 4),
(32, 10, 4),
(33, 12, 1),
(34, 13, 1),
(35, 14, 1),
(36, 15, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `com_album`
--
ALTER TABLE `com_album`
  ADD PRIMARY KEY (`id_album`);

--
-- Indices de la tabla `com_archivo`
--
ALTER TABLE `com_archivo`
  ADD PRIMARY KEY (`id_archivo`);

--
-- Indices de la tabla `com_cargo`
--
ALTER TABLE `com_cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `com_categoria`
--
ALTER TABLE `com_categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `com_encuesta`
--
ALTER TABLE `com_encuesta`
  ADD PRIMARY KEY (`id_encuesta`),
  ADD UNIQUE KEY `id_encuesta_UNIQUE` (`id_encuesta`);

--
-- Indices de la tabla `com_encuesta_opciones`
--
ALTER TABLE `com_encuesta_opciones`
  ADD PRIMARY KEY (`id_encuesta_opcion`),
  ADD UNIQUE KEY `id_encuesta_opcion_UNIQUE` (`id_encuesta_opcion`),
  ADD KEY `fk_com_encuesta_opciones_com_encuesta1_idx` (`id_encuesta`);

--
-- Indices de la tabla `com_encuesta_usuario`
--
ALTER TABLE `com_encuesta_usuario`
  ADD PRIMARY KEY (`id_encuesta_usuario`);

--
-- Indices de la tabla `com_encuesta_votos`
--
ALTER TABLE `com_encuesta_votos`
  ADD PRIMARY KEY (`id_encuesta_votos`);

--
-- Indices de la tabla `com_evento`
--
ALTER TABLE `com_evento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `com_funcionario`
--
ALTER TABLE `com_funcionario`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Indices de la tabla `com_imagen`
--
ALTER TABLE `com_imagen`
  ADD PRIMARY KEY (`id_imagen`);

--
-- Indices de la tabla `com_log`
--
ALTER TABLE `com_log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indices de la tabla `com_mensaje`
--
ALTER TABLE `com_mensaje`
  ADD PRIMARY KEY (`id_mensaje`);

--
-- Indices de la tabla `com_privilegio`
--
ALTER TABLE `com_privilegio`
  ADD PRIMARY KEY (`id_privilegio`);

--
-- Indices de la tabla `com_publicacion`
--
ALTER TABLE `com_publicacion`
  ADD PRIMARY KEY (`id_publicacion`,`id_tipo_publicacion`,`id_categoria`);

--
-- Indices de la tabla `com_sistema`
--
ALTER TABLE `com_sistema`
  ADD PRIMARY KEY (`id_sistema`);

--
-- Indices de la tabla `com_tipo_publicacion`
--
ALTER TABLE `com_tipo_publicacion`
  ADD PRIMARY KEY (`id_tipo_publicacion`);

--
-- Indices de la tabla `com_usuario`
--
ALTER TABLE `com_usuario`
  ADD PRIMARY KEY (`id_usuario`,`id_cargo`);

--
-- Indices de la tabla `example_1`
--
ALTER TABLE `example_1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `example_2`
--
ALTER TABLE `example_2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `example_3`
--
ALTER TABLE `example_3`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `example_4`
--
ALTER TABLE `example_4`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `privilegio_cargo`
--
ALTER TABLE `privilegio_cargo`
  ADD PRIMARY KEY (`id_privilegio_cargo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `com_album`
--
ALTER TABLE `com_album`
  MODIFY `id_album` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `com_archivo`
--
ALTER TABLE `com_archivo`
  MODIFY `id_archivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `com_cargo`
--
ALTER TABLE `com_cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `com_categoria`
--
ALTER TABLE `com_categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `com_encuesta`
--
ALTER TABLE `com_encuesta`
  MODIFY `id_encuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `com_encuesta_opciones`
--
ALTER TABLE `com_encuesta_opciones`
  MODIFY `id_encuesta_opcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `com_encuesta_usuario`
--
ALTER TABLE `com_encuesta_usuario`
  MODIFY `id_encuesta_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `com_encuesta_votos`
--
ALTER TABLE `com_encuesta_votos`
  MODIFY `id_encuesta_votos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `com_evento`
--
ALTER TABLE `com_evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `com_funcionario`
--
ALTER TABLE `com_funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11310;

--
-- AUTO_INCREMENT de la tabla `com_imagen`
--
ALTER TABLE `com_imagen`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `com_log`
--
ALTER TABLE `com_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `com_mensaje`
--
ALTER TABLE `com_mensaje`
  MODIFY `id_mensaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `com_privilegio`
--
ALTER TABLE `com_privilegio`
  MODIFY `id_privilegio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `com_publicacion`
--
ALTER TABLE `com_publicacion`
  MODIFY `id_publicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `com_sistema`
--
ALTER TABLE `com_sistema`
  MODIFY `id_sistema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `com_tipo_publicacion`
--
ALTER TABLE `com_tipo_publicacion`
  MODIFY `id_tipo_publicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `com_usuario`
--
ALTER TABLE `com_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=955;

--
-- AUTO_INCREMENT de la tabla `example_1`
--
ALTER TABLE `example_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT de la tabla `example_2`
--
ALTER TABLE `example_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT de la tabla `example_3`
--
ALTER TABLE `example_3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT de la tabla `example_4`
--
ALTER TABLE `example_4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT de la tabla `privilegio_cargo`
--
ALTER TABLE `privilegio_cargo`
  MODIFY `id_privilegio_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `com_encuesta_opciones`
--
ALTER TABLE `com_encuesta_opciones`
  ADD CONSTRAINT `fk_com_encuesta_opciones_com_encuesta1` FOREIGN KEY (`id_encuesta`) REFERENCES `com_encuesta` (`id_encuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
