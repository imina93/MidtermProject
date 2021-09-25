-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema kitchntabldb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `kitchntabldb` ;

-- -----------------------------------------------------
-- Schema kitchntabldb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kitchntabldb` DEFAULT CHARACTER SET utf8 ;
USE `kitchntabldb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NOT NULL,
  `role` VARCHAR(45) NULL,
  `email` VARCHAR(145) NULL,
  `image_url` VARCHAR(1000) NULL,
  `biography` TEXT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe` ;

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `instructions` TEXT NULL,
  `calories` INT NULL,
  `chef_rating` INT NULL,
  `category` VARCHAR(45) NULL,
  `serving_size` VARCHAR(50) NULL,
  `cook_time_in_minutes` INT NULL,
  `prep_time_in_minutes` INT NULL,
  `user_id` INT NOT NULL,
  `image` VARCHAR(500) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_recipe_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cookbook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cookbook` ;

CREATE TABLE IF NOT EXISTS `cookbook` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  `description` TEXT NULL,
  `image` VARCHAR(1000) NULL,
  `created_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cookbook_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_cookbook_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ingredient` ;

CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cookbook_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cookbook_rating` ;

CREATE TABLE IF NOT EXISTS `cookbook_rating` (
  `cookbook_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating` INT NULL,
  `rating_date` DATETIME NULL,
  `rating_comment` VARCHAR(200) NULL,
  PRIMARY KEY (`cookbook_id`, `user_id`),
  INDEX `fk_cookbook_rating_cookbook1_idx` (`cookbook_id` ASC),
  INDEX `fk_cookbook_rating_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_cookbook_rating_cookbook1`
    FOREIGN KEY (`cookbook_id`)
    REFERENCES `cookbook` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cookbook_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cookbook_has_recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cookbook_has_recipe` ;

CREATE TABLE IF NOT EXISTS `cookbook_has_recipe` (
  `cookbook_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`cookbook_id`, `recipe_id`),
  INDEX `fk_cookbook_has_recipe_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_cookbook_has_recipe_cookbook1_idx` (`cookbook_id` ASC),
  CONSTRAINT `fk_cookbook_has_recipe_cookbook1`
    FOREIGN KEY (`cookbook_id`)
    REFERENCES `cookbook` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cookbook_has_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(300) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cookbook_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cookbook_has_category` ;

CREATE TABLE IF NOT EXISTS `cookbook_has_category` (
  `cookbook_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`cookbook_id`, `category_id`),
  INDEX `fk_cookbook_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_cookbook_has_category_cookbook1_idx` (`cookbook_id` ASC),
  CONSTRAINT `fk_cookbook_has_category_cookbook1`
    FOREIGN KEY (`cookbook_id`)
    REFERENCES `cookbook` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cookbook_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_ingredient` ;

CREATE TABLE IF NOT EXISTS `recipe_ingredient` (
  `recipe_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  `amount` VARCHAR(100) NULL,
  `preparation` VARCHAR(150) NULL,
  PRIMARY KEY (`recipe_id`, `ingredient_id`),
  INDEX `fk_recipe_has_ingredient_ingredient1_idx` (`ingredient_id` ASC),
  INDEX `fk_recipe_has_ingredient_recipe1_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_recipe_has_ingredient_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_has_category` ;

CREATE TABLE IF NOT EXISTS `recipe_has_category` (
  `recipe_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`recipe_id`, `category_id`),
  INDEX `fk_recipe_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_recipe_has_category_recipe1_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_recipe_has_category_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_rating` ;

CREATE TABLE IF NOT EXISTS `recipe_rating` (
  `recipe_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `rating_date` DATETIME NULL,
  `rating_comment` VARCHAR(200) NULL,
  PRIMARY KEY (`recipe_id`, `user_id`),
  INDEX `fk_recipe_rating_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_recipe_rating_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_recipe_rating_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_image` ;

CREATE TABLE IF NOT EXISTS `recipe_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(1000) NULL,
  `recipe_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_images_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_recipe_image_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_recipe_images_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_image_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_comment` ;

CREATE TABLE IF NOT EXISTS `recipe_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment_text` TEXT NULL,
  `comment_date` DATETIME NULL,
  `recipe_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_comment_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_recipe_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_recipe_comment_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO Ramsay@localhost;
 DROP USER Ramsay@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'Ramsay'@'localhost' IDENTIFIED BY 'Gordon';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'Ramsay'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `kitchntabldb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (1, 'admin', 'sd30midterm', 1, 'admin', 'admin@admin.com', 'https://cdn-icons-png.flaticon.com/512/184/184514.png', 'I was born in 1900.', 'Gary', 'Bussey');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (2, 'mgeller', 'friends', 1, NULL, 'mgeller@friends.com', 'https://static.wikia.nocookie.net/friends/images/2/2f/Monica_Geller-Bing_Season_10.png/revision/latest/scale-to-width-down/618?cb=20180426182234', 'I am the head chef at Javu, a Manhattan upscale eatery.', 'Monica', 'Geller');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (3, 'rgeller', 'friends', 1, NULL, 'rgeller@friends.com', 'https://static.wikia.nocookie.net/friends/images/0/0b/RossGeller.jpg/revision/latest/scale-to-width-down/634?cb=20180424154547', 'I am a professor and paleontologist.', 'Ross ', 'Geller');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (4, 'rgreene', 'friends', 1, NULL, 'rgreene@friends.com', 'https://static.wikia.nocookie.net/friends/images/f/f7/Rachel_Greene.jpg/revision/latest/scale-to-width-down/518?cb=20180426182043', 'I am a fashion executive.', 'Rachel', 'Greene');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (5, 'pbuffay', 'friends', 1, NULL, 'pbuffay@friends.com', 'https://static.wikia.nocookie.net/friends/images/3/30/PhoebeBuffay.jpg/revision/latest/scale-to-width-down/584?cb=20180426182547', 'I am an artist', 'Phoebe', 'Buffay');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (6, 'jtribbiani', 'friends', 1, NULL, 'jtribbiani@friends.com', 'https://static.wikia.nocookie.net/friends/images/f/f5/JoeyTribbiani.jpg/revision/latest/scale-to-width-down/870?cb=20180424154245', 'I am an actor who play Drake Romoray', 'Joey', 'Tribbiani');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (7, 'cbing', 'friends', 1, NULL, 'cbing@friends.com', 'https://static.wikia.nocookie.net/friends/images/f/f5/JoeyTribbiani.jpg/revision/latest/scale-to-width-down/870?cb=20180424154245', 'I am an advertising executive', 'Chandler', 'Bing');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (8, 'ckelly', 'iasip', 1, NULL, 'ckelly@iasip.com', 'https://static.wikia.nocookie.net/itsalwayssunny/images/7/78/Charlie_Kelly.jpg/revision/latest/scale-to-width-down/1000?cb=20171214035211', 'I am a janitor at Paddy\'s pub', 'Charlie', 'Kelly');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (9, 'dreynolds', 'iasip', 1, NULL, 'dreynolds@iasip.com', 'https://static.wikia.nocookie.net/itsalwayssunny/images/5/51/Dennis_%283%29.jpg/revision/latest/scale-to-width-down/490?cb=20110812033321', 'Co-owner of Paddy\'s Pub.', 'Dennis', 'Reynolds');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (10, 'deereynolds', 'iasip', 1, NULL, 'deereynolds@iasip.com', 'https://static.wikia.nocookie.net/itsalwayssunny/images/9/9f/Dee_Reynolds.jpg/revision/latest/scale-to-width-down/1000?cb=20171214035415', 'Bartender at Paddy\'s Pub', 'Dee', 'Reynolds');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `kitchntabldb`;
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (1, 'Peanut butter and jelly sandwich', '1. seriously?', 400, 5, 'sandwich', '1', 1, 1, 1, 'https://cdn-icons-png.flaticon.com/512/184/184514.png', 'basic american staple');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cookbook`
-- -----------------------------------------------------
START TRANSACTION;
USE `kitchntabldb`;
INSERT INTO `cookbook` (`id`, `name`, `user_id`, `description`, `image`, `created_date`, `last_update`) VALUES (1, 'My grandmas recipes', 1, 'a collection of my grandmas best recipes.', 'https://cdn-icons-png.flaticon.com/512/184/184514.png', '2019-08-20 01:25:25', '2019-10-21 01:25:25');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `kitchntabldb`;
INSERT INTO `ingredient` (`id`, `name`) VALUES (1, 'peanut butter');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cookbook_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `kitchntabldb`;
INSERT INTO `cookbook_rating` (`cookbook_id`, `user_id`, `rating`, `rating_date`, `rating_comment`) VALUES (1, 1, 3, '2019-10-21 01:25:25', 'its ok.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `kitchntabldb`;
INSERT INTO `category` (`id`, `name`, `description`) VALUES (1, 'Kid Friendly', 'perfect for kids');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `kitchntabldb`;
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `preparation`) VALUES (1, 1, '1 tablespoon', 'put on tablespoon');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `kitchntabldb`;
INSERT INTO `recipe_rating` (`recipe_id`, `user_id`, `rating`, `rating_date`, `rating_comment`) VALUES (1, 1, 1, '2019-09-21 01:25:25', 'gross.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `kitchntabldb`;
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`, `user_id`) VALUES (1, 'https://cdn-icons-png.flaticon.com/512/184/184514.png', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `kitchntabldb`;
INSERT INTO `recipe_comment` (`id`, `comment_text`, `comment_date`, `recipe_id`, `user_id`) VALUES (1, 'gross.', '2021-08-21 01:25:25', 1, 1);

COMMIT;

