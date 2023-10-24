-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `id_cliente` INT NOT NULL,
  `regiao` VARCHAR(45) NULL DEFAULT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  `cidade` VARCHAR(45) NULL DEFAULT NULL,
  `telefone` VARCHAR(45) NULL DEFAULT NULL,
  `celular` VARCHAR(45) NULL DEFAULT NULL,
  `sexo` CHAR(1) NULL DEFAULT NULL,
  `cep` CHAR(9) NULL DEFAULT NULL,
  `data_nasc` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`montadora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`montadora` (
  `id_montadora` INT NOT NULL,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `pais_origem` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_montadora`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`modelo` (
  `id_modelo` INT NOT NULL,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `montadora_id_montadora` INT NOT NULL,
  PRIMARY KEY (`id_modelo`),
  INDEX `fk_modelo_montadora_idx` (`montadora_id_montadora` ASC) VISIBLE,
  CONSTRAINT `fk_modelo_montadora`
    FOREIGN KEY (`montadora_id_montadora`)
    REFERENCES `mydb`.`montadora` (`id_montadora`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`carro` (
  `id_carro` INT NOT NULL,
  `cor` VARCHAR(45) NULL DEFAULT NULL,
  `valor_compra` DOUBLE NULL DEFAULT NULL,
  `data_compra` DATE NULL DEFAULT NULL,
  `modelo_id_modelo` INT NOT NULL,
  `cliente_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_carro`),
  INDEX `fk_carro_modelo1_idx` (`modelo_id_modelo` ASC) VISIBLE,
  INDEX `fk_carro_cliente1_idx` (`cliente_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_carro_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `mydb`.`cliente` (`id_cliente`),
  CONSTRAINT `fk_carro_modelo1`
    FOREIGN KEY (`modelo_id_modelo`)
    REFERENCES `mydb`.`modelo` (`id_modelo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`seguro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`seguro` (
  `id_seguro` INT NOT NULL,
  `valor_segurado` DOUBLE NULL DEFAULT NULL,
  `premio` DOUBLE NULL DEFAULT NULL,
  `ano_vigencia` INT NULL DEFAULT NULL,
  `carro_id_carro` INT NOT NULL,
  PRIMARY KEY (`id_seguro`),
  INDEX `fk_seguro_carro1_idx` (`carro_id_carro` ASC) VISIBLE,
  CONSTRAINT `fk_seguro_carro1`
    FOREIGN KEY (`carro_id_carro`)
    REFERENCES `mydb`.`carro` (`id_carro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`sinistro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sinistro` (
  `id_sinistro` INT NOT NULL,
  `data_sinistro` DATE NULL DEFAULT NULL,
  `valor` DOUBLE NULL DEFAULT NULL,
  `carro_id_carro` INT NOT NULL,
  PRIMARY KEY (`id_sinistro`),
  INDEX `fk_sinistro_carro1_idx` (`carro_id_carro` ASC) VISIBLE,
  CONSTRAINT `fk_sinistro_carro1`
    FOREIGN KEY (`carro_id_carro`)
    REFERENCES `mydb`.`carro` (`id_carro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
