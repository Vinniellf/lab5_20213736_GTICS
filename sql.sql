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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sedes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Sedes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Sedes` (
  `idSedes` INT NOT NULL,
  `nombreSede` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSedes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profesionales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Profesionales` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Profesionales` (
  `idProfesionales` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
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
ENGINE = InnoDB;

CREATE INDEX `fk_Profesionales_Areas_idx` ON `mydb`.`Profesionales` (`idArea` ASC) VISIBLE;

CREATE INDEX `fk_Profesionales_Sedes1_idx` ON `mydb`.`Profesionales` (`idSede` ASC) VISIBLE;


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
ENGINE = InnoDB;

CREATE INDEX `fk_Fechas_Profesionales1_idx` ON `mydb`.`Fechas` (`idProfesional` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Pacientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pacientes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pacientes` (
  `idPacientes` INT NOT NULL AUTO_INCREMENT,
  `nombrePaciente` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  `Edad` INT NULL,
  `Pacientescol` VARCHAR(45) NULL,
  PRIMARY KEY (`idPacientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Riesgos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Riesgos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Riesgos` (
  `idRiesgos` INT NOT NULL,
  `Bajo` INT NOT NULL,
  `Moderado` INT NOT NULL,
  `Alto` INT NOT NULL,
  `Muy Alto` INT NOT NULL,
  PRIMARY KEY (`idRiesgos`))
ENGINE = InnoDB;


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

CREATE INDEX `fk_Citas_Areas1_idx` ON `mydb`.`Citas` (`idArea` ASC) VISIBLE;

CREATE INDEX `fk_Citas_Sedes1_idx` ON `mydb`.`Citas` (`idSede` ASC) VISIBLE;

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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Recursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Recursos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Recursos` (
  `idRecursos` INT NOT NULL,
  PRIMARY KEY (`idRecursos`))
ENGINE = InnoDB;


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
ENGINE = InnoDB;

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
ENGINE = InnoDB;

CREATE INDEX `fk_Canciones_Recursos1_idx` ON `mydb`.`Canciones` (`idRecurso` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
