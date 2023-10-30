-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema film_rental
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema film_rental
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `film_rental` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `film_rental` ;

-- -----------------------------------------------------
-- Table `film_rental`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `film_rental`.`actors` (
  `actor_id` INT NOT NULL,
  `full_name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `film_rental`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `film_rental`.`categories` (
  `category_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `film_rental`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `film_rental`.`languages` (
  `language_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `film_rental`.`films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `film_rental`.`films` (
  `film_id` INT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` TEXT NULL DEFAULT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `fk_category_id INT_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_language_id INT_idx` (`language_id` ASC) VISIBLE,
  CONSTRAINT `category_id INT`
    FOREIGN KEY (`category_id`)
    REFERENCES `film_rental`.`categories` (`category_id`),
  CONSTRAINT `language_id INT`
    FOREIGN KEY (`language_id`)
    REFERENCES `film_rental`.`languages` (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `film_rental`.`af_mn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `film_rental`.`af_mn` (
  `actor_id` INT NULL DEFAULT NULL,
  `film_id` INT NULL DEFAULT NULL,
  INDEX `actor_id INT_idx` (`actor_id` ASC) VISIBLE,
  INDEX `film_id INT_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `actor_id INT`
    FOREIGN KEY (`actor_id`)
    REFERENCES `film_rental`.`actors` (`actor_id`),
  CONSTRAINT `film_id INT`
    FOREIGN KEY (`film_id`)
    REFERENCES `film_rental`.`films` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `film_rental`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `film_rental`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NULL DEFAULT NULL,
  `store_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `film_id INT_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_id INT`
    FOREIGN KEY (`film_id`)
    REFERENCES `film_rental`.`films` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `film_rental`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `film_rental`.`rental` (
  `rental_id` INT NOT NULL,
  `inventory_id` INT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  `rental_date` DATETIME NULL DEFAULT NULL,
  `return_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `fk_inventory_id_INT_idx` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `inventory_id_INT`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `film_rental`.`inventory` (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
