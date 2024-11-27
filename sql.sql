-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Areas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Areas` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Areas` (
  `idAreas` INT NOT NULL,
  `nombreArea` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAreas`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `Areas` WRITE;
/*!40000 ALTER TABLE `Areas` DISABLE KEYS */;
INSERT INTO `Areas` VALUES (1,'Psiquiatría'),(2,'Neurología'),(3,'Psicología'),(4,'Terapia Ocupacional');
/*!40000 ALTER TABLE `Areas` ENABLE KEYS */;
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `mydb`.`Sedes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Sedes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Sedes` (
  `idSedes` INT NOT NULL,
  `nombreSede` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSedes`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `Sedes` WRITE;
/*!40000 ALTER TABLE `Sedes` DISABLE KEYS */;
INSERT INTO `Sedes` VALUES (1,'San Martín'),(2,'Lima'),(3,'Arequipa'),(4,'Trujillo'), (5,'Ayacucho');
/*!40000 ALTER TABLE `Sedes` ENABLE KEYS */;
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `mydb`.`Profesionales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Profesionales` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Profesionales` (
  `idProfesionales` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(500) NOT NULL,
  `descripcionProfesional` VARCHAR(90) NOT NULL,
  `idArea` INT NOT NULL,
  `idSede` INT NOT NULL,
  PRIMARY KEY (`idProfesionales`),
  CONSTRAINT `fk_Profesionales_Areas`
    FOREIGN KEY (`idArea`)
    REFERENCES `mydb`.`Areas` (`idAreas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profesionales_Sedes1`
    FOREIGN KEY (`idSede`)
    REFERENCES `mydb`.`Sedes` (`idSedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb3;

CREATE INDEX `fk_Profesionales_Areas_idx` ON `mydb`.`Profesionales` (`idArea` ASC) VISIBLE;

CREATE INDEX `fk_Profesionales_Sedes1_idx` ON `mydb`.`Profesionales` (`idSede` ASC) VISIBLE;

LOCK TABLES `Profesionales` WRITE;
INSERT INTO Profesionales (idProfesionales, nombre, imagen, descripcionProfesional, idArea, idSede)
VALUES
-- Psiquiatras
(1, 'Leonardo Campos', 'https://th.bing.com/th/id/OIP.IVwf85npYYUcwRp4EIhqDgHaJm?w=144&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7', 'Especialista en psiquiatría general', 1, 2),
(2, 'Ronald Boyer', 'https://i.pinimg.com/236x/08/25/6a/08256aea7bc09b4f1371a037df90e0c9--bug-bite-itch-medical-sites.jpg', 'Psiquiatra con enfoque en terapia cognitiva', 1, 4),
(3, 'Karla Pezo', 'https://th.bing.com/th/id/OIP.WZuFeD-_Btx-rRmknaI_9AHaHa?rs=1&pid=ImgDetMain', 'Psiquiatra infantil y adolescente', 1, 3),

-- Neurólogos
(4, 'Mayra Gonzales', 'https://th.bing.com/th/id/OIP.EATN0CU-zxYo9jGMl8-dbwHaHa?w=770&h=770&rs=1&pid=ImgDetMain', 'Neuróloga especialista en enfermedades neurodegenerativas', 2, 1),
(5, 'Franco Lazo', 'https://th.bing.com/th/id/OIP.ZZsFHtmjIW_AOcGg0RPFHwHaIm?w=323&h=375&rs=1&pid=ImgDetMain', 'Neurólogo experto en trastornos del movimiento', 2, 5),

-- Psicólogos
(6, 'Víctor Guerra', 'https://www.hght.com/wp-content/uploads/hgh-doctors-in-dallas.jpg', 'Psicólogo clínico con especialidad en trastornos de ansiedad', 3, 2),
(7, 'Paolo Valiente', 'https://th.bing.com/th/id/OIP.V7FNkBb_OU3XpSNU0cA0sgHaHa?w=500&h=500&rs=1&pid=ImgDetMain', 'Psicólogo enfocado en terapias conductuales', 3, 3),
(8, 'Alonso Llanos', 'https://th.bing.com/th/id/OIP.ewdZioc5suAUep7_1DVwtwHaI5?w=499&h=600&rs=1&pid=ImgDetMain', 'Psicólogo con enfoque en salud mental juvenil', 3, 5),

-- Terapeutas
(9, 'Diego Torres', 'https://www.woundssolutions.org/wp-content/uploads/2017/02/team-3-370x439.png', 'Terapeuta ocupacional especializado en rehabilitación física', 4, 1),
(10, 'Piero Mendoza', 'https://image.freepik.com/free-photo/doctor-smiling-with-stethoscope_1154-36.jpg', 'Terapeuta ocupacional con enfoque en desarrollo infantil', 4, 2),
(11, 'Hellen Aranda', 'https://assets-uninove.nyc3.digitaloceanspaces.com/Enfermagem-550px.JPG?mtime=20201027124437&focal=none', 'Terapeuta ocupacional con experiencia en integración sensorial', 4, 4);


/*!40000 ALTER TABLE `Profesionales` ENABLE KEYS */;
UNLOCK TABLES;
-- -----------------------------------------------------
-- Table `mydb`.`Fechas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fechas` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Fechas` (
  `idFechas` INT NOT NULL,
  `fechaDisponibilidad` DATE NOT NULL,
  `idProfesional` INT NOT NULL,
  PRIMARY KEY (`idFechas`, `idProfesional`),
  CONSTRAINT `fk_Fechas_Profesionales1`
    FOREIGN KEY (`idProfesional`)
    REFERENCES `mydb`.`Profesionales` (`idProfesionales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB  DEFAULT CHARSET=utf8mb3;

CREATE INDEX `fk_Fechas_Profesionales1_idx` ON `mydb`.`Fechas` (`idProfesional` ASC) VISIBLE;

LOCK TABLES `Fechas` WRITE;
/*!40000 ALTER TABLE `Fechas` DISABLE KEYS */;
INSERT INTO Fechas (idFechas, fechaDisponibilidad, idProfesional)
VALUES
-- Fechas para los Psiquiatras
(1, '2023-10-05', 1), -- Leonardo Campos
(2, '2023-11-20', 2), -- Ronald Boyer
(3, '2023-12-15', 3), -- Karla Pezo

-- Fechas para los Neurólogos
(4, '2023-10-25', 4), -- Mayra Gonzales
(5, '2023-11-10', 5), -- Franco Lazo

-- Fechas para los Psicólogos
(6, '2023-12-01', 6), -- Víctor Guerra
(7, '2023-12-05', 7), -- Paolo Valiente
(8, '2023-11-28', 8), -- Alonso Llanos

-- Fechas para los Terapeutas
(9, '2023-11-15', 9), -- Diego Torres
(10, '2023-12-10', 10), -- Piero Mendoza
(11, '2023-12-20', 11); -- Hellen Aranda
/*!40000 ALTER TABLE `Fechas` ENABLE KEYS */;
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `mydb`.`Pacientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pacientes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pacientes` (
  `idPacientes` INT NOT NULL AUTO_INCREMENT,
  `nombrePaciente` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  `Edad` INT NULL,
  `apellidoPacientes` VARCHAR(45) NULL,
  PRIMARY KEY (`idPacientes`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Riesgos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Riesgos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Riesgos` (
  `idRiesgos` INT NOT NULL,
  `nameRiesgo` VARCHAR(30),
  PRIMARY KEY (`idRiesgos`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `Riesgos` WRITE;
/*!40000 ALTER TABLE `Riesgos` DISABLE KEYS */;
INSERT INTO `Riesgos` VALUES (1,'Bajo'),(2,'Moderado'),(3,'Alto'),(4,'Muy alto');
/*!40000 ALTER TABLE `Riesgos` ENABLE KEYS */;
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `mydb`.`Citas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Citas` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Citas` (
  `idCitas` INT NOT NULL AUTO_INCREMENT,
  `motivoConsulta` VARCHAR(45) NOT NULL,
  `idPaciente` INT NOT NULL,
  `idArea` INT NOT NULL,
  `idProfesional` INT NOT NULL,
  `idSede` INT NOT NULL,
  `idFechaConsulta` INT NOT NULL,
  `idRiesgo` INT NOT NULL,
  `precio` DECIMAL NULL,
  `Citascol` VARCHAR(45) NULL,
  PRIMARY KEY (`idCitas`),
  CONSTRAINT `fk_Citas_Fechas1`
    FOREIGN KEY (`idFechaConsulta` , `idProfesional`)
    REFERENCES `mydb`.`Fechas` (`idFechas` , `idProfesional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Areas1`
    FOREIGN KEY (`idArea`)
    REFERENCES `mydb`.`Areas` (`idAreas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Sedes1`
    FOREIGN KEY (`idSede`)
    REFERENCES `mydb`.`Sedes` (`idSedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Pacientes1`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `mydb`.`Pacientes` (`idPacientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Riesgos1`
    FOREIGN KEY (`idRiesgo`)
    REFERENCES `mydb`.`Riesgos` (`idRiesgos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;	

CREATE INDEX `fk_Citas_Fechas1_idx` ON `mydb`.`Citas` (`idFechaConsulta` ASC, `idProfesional` ASC) VISIBLE;

CREATE INDEX `fk_Citas_Pacientes1_idx` ON `mydb`.`Citas` (`idPaciente` ASC) VISIBLE;

CREATE INDEX `fk_Citas_Riesgos1_idx` ON `mydb`.`Citas` (`idRiesgo` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Foro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Foro` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Foro` (
  `idForo` INT NOT NULL,
  `comentario` VARCHAR(45) NOT NULL,
  `nombrePersona` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idForo`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Recursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Recursos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Recursos` (
  `idRecursos` INT NOT NULL,
  PRIMARY KEY (`idRecursos`))
ENGINE = InnoDB  DEFAULT CHARSET=utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Frases`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Frases` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Frases` (
  `idFrases` INT NOT NULL,
  `frase` VARCHAR(45) NULL,
  `idRecurso` INT NOT NULL,
  PRIMARY KEY (`idFrases`, `idRecurso`),
  CONSTRAINT `fk_Frases_Recursos1`
    FOREIGN KEY (`idRecurso`)
    REFERENCES `mydb`.`Recursos` (`idRecursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb3;

CREATE INDEX `fk_Frases_Recursos1_idx` ON `mydb`.`Frases` (`idRecurso` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Canciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Canciones` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Canciones` (
  `idCanciones` INT NOT NULL,
  `nombreCancion` VARCHAR(45) NOT NULL,
  `tipoCancion` INT NOT NULL,
  `idRecurso` INT NOT NULL,
  PRIMARY KEY (`idCanciones`, `idRecurso`),
  CONSTRAINT `fk_Canciones_Recursos1`
    FOREIGN KEY (`idRecurso`)
    REFERENCES `mydb`.`Recursos` (`idRecursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb3;

CREATE INDEX `fk_Canciones_Recursos1_idx` ON `mydb`.`Canciones` (`idRecurso` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
