# Arquivo SQL com as instruções de criação de todas as tabelas

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
-- Table `departaments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `departaments` (
  `id` INT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `preco` DECIMAL(7,2) NOT NULL,
  `qtdEstoque` INT NOT NULL,
  `disponivel` INT NOT NULL,
  `destaque` INT NOT NULL,
  `deptid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_departaments1_idx` (`deptid` ASC) VISIBLE,
  CONSTRAINT `fk_products_departaments1`
    FOREIGN KEY (`deptid`)
    REFERENCES `departaments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `request_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `request_status` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customers` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `e-mail` VARCHAR(50) NOT NULL,
  `whatsapp` VARCHAR(14) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `requests` (
  `id` INT NOT NULL,
  `data` DATETIME NOT NULL,
  `customerid` INT NOT NULL,
  `statusid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_requests_request_status1_idx` (`statusid` ASC) VISIBLE,
  INDEX `fk_requests_customers1_idx` (`customerid` ASC) VISIBLE,
  CONSTRAINT `fk_requests_request_status1`
    FOREIGN KEY (`statusid`)
    REFERENCES `request_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requests_customers1`
    FOREIGN KEY (`customerid`)
    REFERENCES `customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `requests_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `requests_products` (
  `requestid` INT NOT NULL,
  `productid` INT NOT NULL,
  `individualvalue` DECIMAL(7,2) NOT NULL,
  `quantity` INT NOT NULL,
  `totalvalue` DECIMAL(7,2) NOT NULL,
  INDEX `fk_requests_products_products2_idx` (`productid` ASC) VISIBLE,
  INDEX `fk_requests_products_requests1_idx` (`requestid` ASC) VISIBLE,
  CONSTRAINT `fk_requests_products_products2`
    FOREIGN KEY (`productid`)
    REFERENCES `products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requests_products_requests1`
    FOREIGN KEY (`requestid`)
    REFERENCES `requests` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adresses_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adresses_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cities` (
  `id` INT NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adresses` (
  `id` INT NOT NULL,
  `addresstypeid` INT NOT NULL,
  `logradourotype` VARCHAR(10) NOT NULL,
  `logradouro` VARCHAR(50) NOT NULL,
  `number` INT NOT NULL,
  `complement` VARCHAR(45) NOT NULL,
  `district` VARCHAR(50) NOT NULL,
  `cep` INT NOT NULL,
  `cityid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_address_type1_idx` (`addresstypeid` ASC) VISIBLE,
  INDEX `fk_adresses_cities1_idx` (`cityid` ASC) VISIBLE,
  CONSTRAINT `fk_address_address_type1`
    FOREIGN KEY (`addresstypeid`)
    REFERENCES `adresses_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_adresses_cities1`
    FOREIGN KEY (`cityid`)
    REFERENCES `cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adresses_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adresses_customer` (
  `customerid` INT NOT NULL,
  `addressid` INT NOT NULL,
  INDEX `fk_address_customer_customers1_idx` (`customerid` ASC) VISIBLE,
  INDEX `fk_address_customer_address1_idx` (`addressid` ASC) VISIBLE,
  CONSTRAINT `fk_address_customer_customers1`
    FOREIGN KEY (`customerid`)
    REFERENCES `customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_customer_address1`
    FOREIGN KEY (`addressid`)
    REFERENCES `adresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;