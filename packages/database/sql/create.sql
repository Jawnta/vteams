-- MySQL Script generated by MySQL Workbench
-- Tue Nov 29 18:02:47 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vteams
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `vteams` ;

-- -----------------------------------------------------
-- Schema vteams
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vteams` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `vteams` ;

-- -----------------------------------------------------
-- Table `vteams`.`admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vteams`.`admin` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `vteams`.`admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vteams`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vteams`.`user` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `vteams`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `phone_number` INT NULL,
  `email` VARCHAR(45) NULL,
  `register_date` DATETIME NULL,
  `social_security` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `credit` FLOAT NULL,
  `token` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vteams`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vteams`.`city` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `vteams`.`city` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vteams`.`scooter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vteams`.`scooter` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `vteams`.`scooter` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `available` TINYINT NULL,
  `enabled` TINYINT NULL,
  `charge` INT NULL,
  `last_serviced` DATETIME NULL,
  `first_used` DATETIME NULL,
  `distance_traveled` FLOAT NULL,
  `last_position` POINT NULL,
  `is_charging` TINYINT NULL,
  `city_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `scooter_city_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `scooter_city`
    FOREIGN KEY (`city_id`)
    REFERENCES `vteams`.`city` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vteams`.`parking_zone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vteams`.`parking_zone` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `vteams`.`parking_zone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city_id` INT NULL,
  `area` POLYGON NULL,
  PRIMARY KEY (`id`),
  INDEX `parking_zone_city_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `parking_zone_city`
    FOREIGN KEY (`city_id`)
    REFERENCES `vteams`.`city` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vteams`.`charging_zone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vteams`.`charging_zone` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `vteams`.`charging_zone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `parking_zone_id` INT NULL,
  `area` POLYGON NULL,
  PRIMARY KEY (`id`),
  INDEX `charging_zone_parking_zone_idx` (`parking_zone_id` ASC) VISIBLE,
  CONSTRAINT `charging_zone_parking_zone`
    FOREIGN KEY (`parking_zone_id`)
    REFERENCES `vteams`.`parking_zone` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vteams`.`charging_station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vteams`.`charging_station` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `vteams`.`charging_station` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `charging_zone_id` INT NULL,
  `position` POINT NULL,
  `occupied` TINYINT NULL,
  `scooter_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `charging_station_charging_zone_idx` (`charging_zone_id` ASC) VISIBLE,
  INDEX `charging_station_bike_idx` (`scooter_id` ASC) VISIBLE,
  CONSTRAINT `charging_station_charging_zone`
    FOREIGN KEY (`charging_zone_id`)
    REFERENCES `vteams`.`charging_zone` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `charging_station_scooter`
    FOREIGN KEY (`scooter_id`)
    REFERENCES `vteams`.`scooter` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vteams`.`trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vteams`.`trip` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `vteams`.`trip` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `scooter_id` INT NULL,
  `distance` FLOAT NULL,
  `completed` TINYINT NULL,
  `start_position` POINT NULL,
  `stop_position` POINT NULL,
  `start_time` DATETIME NULL,
  `stop_time` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `trip_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `trip_bike_idx` (`scooter_id` ASC) VISIBLE,
  CONSTRAINT `trip_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `vteams`.`user` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `trip_scooter`
    FOREIGN KEY (`scooter_id`)
    REFERENCES `vteams`.`scooter` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vteams`.`invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vteams`.`invoice` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `vteams`.`invoice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `trip_id` INT NULL,
  `status` VARCHAR(45) NULL,
  `amount` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `invoice_trip_idx` (`trip_id` ASC) VISIBLE,
  CONSTRAINT `invoice_trip`
    FOREIGN KEY (`trip_id`)
    REFERENCES `vteams`.`trip` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vteams`.`scooter_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vteams`.`scooter_log` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `vteams`.`scooter_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `scooter_id` INT NULL,
  `speed` INT NULL,
  `position` POINT NULL,
  `status` VARCHAR(20) NULL,
  `timestamp` DATETIME NULL,
  `charge` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `bike_log_bike_idx` (`scooter_id` ASC) VISIBLE,
  CONSTRAINT `scooter_log_scooter`
    FOREIGN KEY (`scooter_id`)
    REFERENCES `vteams`.`scooter` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vteams`.`maintenance_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vteams`.`maintenance_log` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `vteams`.`maintenance_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `scooter_id` INT NULL,
  `timestamp` DATETIME NULL,
  `event` VARCHAR(50) NULL,
  `invoked_by` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  INDEX `maintenance_log_bike_idx` (`scooter_id` ASC) VISIBLE,
  CONSTRAINT `maintenance_log_scooter`
    FOREIGN KEY (`scooter_id`)
    REFERENCES `vteams`.`scooter` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
