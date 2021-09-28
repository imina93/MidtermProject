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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (2, 'mgeller', 'friends', 2, 'user', 'mgeller@friends.com', 'https://static.wikia.nocookie.net/friends/images/2/2f/Monica_Geller-Bing_Season_10.png/revision/latest/scale-to-width-down/618?cb=20180426182234', 'I am the head chef at Javu, a Manhattan upscale eatery.', 'Monica', 'Geller');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (3, 'rgeller', 'friends', 2, 'user', 'rgeller@friends.com', 'https://static.wikia.nocookie.net/friends/images/0/0b/RossGeller.jpg/revision/latest/scale-to-width-down/634?cb=20180424154547', 'I am a professor and paleontologist.', 'Ross ', 'Geller');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (4, 'rgreene', 'friends', 2, 'user', 'rgreene@friends.com', 'https://static.wikia.nocookie.net/friends/images/f/f7/Rachel_Greene.jpg/revision/latest/scale-to-width-down/518?cb=20180426182043', 'I am a fashion executive.', 'Rachel', 'Greene');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (5, 'pbuffay', 'friends', 2, 'user', 'pbuffay@friends.com', 'https://static.wikia.nocookie.net/friends/images/3/30/PhoebeBuffay.jpg/revision/latest/scale-to-width-down/584?cb=20180426182547', 'I am an artist', 'Phoebe', 'Buffay');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (6, 'jtribbiani', 'friends', 2, 'user', 'jtribbiani@friends.com', 'https://static.wikia.nocookie.net/friends/images/f/f5/JoeyTribbiani.jpg/revision/latest/scale-to-width-down/870?cb=20180424154245', 'I am an actor who play Drake Romoray', 'Joey', 'Tribbiani');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (7, 'cbing', 'friends', 2, 'user', 'cbing@friends.com', 'https://static.wikia.nocookie.net/friends/images/f/f5/JoeyTribbiani.jpg/revision/latest/scale-to-width-down/870?cb=20180424154245', 'I am an advertising executive', 'Chandler', 'Bing');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (8, 'ckelly', 'iasip', 2, 'user', 'ckelly@iasip.com', 'https://static.wikia.nocookie.net/itsalwayssunny/images/7/78/Charlie_Kelly.jpg/revision/latest/scale-to-width-down/1000?cb=20171214035211', 'I am a janitor at Paddy\'s pub', 'Charlie', 'Kelly');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (9, 'dreynolds', 'iasip', 2, 'user', 'dreynolds@iasip.com', 'https://static.wikia.nocookie.net/itsalwayssunny/images/5/51/Dennis_%283%29.jpg/revision/latest/scale-to-width-down/490?cb=20110812033321', 'Co-owner of Paddy\'s Pub.', 'Dennis', 'Reynolds');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (10, 'deereynolds', 'iasip', 2, 'user', 'deereynolds@iasip.com', 'https://static.wikia.nocookie.net/itsalwayssunny/images/9/9f/Dee_Reynolds.jpg/revision/latest/scale-to-width-down/1000?cb=20171214035415', 'Bartender at Paddy\'s Pub', 'Dee', 'Reynolds');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (11, 'thewaitress', 'iasip', 2, 'user', 'thewaitress@iasip.com', 'https://static.wikia.nocookie.net/itsalwayssunny/images/8/86/S7_The_Waitress.png/revision/latest/scale-to-width-down/502?cb=20200425214307', 'I am a waitress at various restaurants in the city', 'Nikki', 'Potnick');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (12, 'rmcdonald', 'iasip', 2, 'user', 'mac@iasip.com', 'https://static.wikia.nocookie.net/itsalwayssunny/images/d/dc/Square-Mac-Cheesy.jpg/revision/latest/scale-to-width-down/230?cb=20110925014455', 'I am co-owner of Paddys pub', 'Ronald', 'McDonald');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `image_url`, `biography`, `first_name`, `last_name`) VALUES (13, 'freynolds', 'iasip', 2, 'user', 'freynolds@iasip.com', 'https://static.wikia.nocookie.net/itsalwayssunny/images/7/72/Frank_Reynolds.jpg/revision/latest/scale-to-width-down/1000?cb=20171214035424', 'I own several sweat shops in Vietnam.', 'Frank', 'Reynolds');

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
INSERT INTO `ingredient` (`id`, `name`) VALUES (2, 'olive oil');
INSERT INTO `ingredient` (`id`, `name`) VALUES (3, 'all purpose flour');
INSERT INTO `ingredient` (`id`, `name`) VALUES (4, 'unsalted butter');
INSERT INTO `ingredient` (`id`, `name`) VALUES (5, 'chicken');
INSERT INTO `ingredient` (`id`, `name`) VALUES (6, 'sugar');
INSERT INTO `ingredient` (`id`, `name`) VALUES (7, 'salt');
INSERT INTO `ingredient` (`id`, `name`) VALUES (8, 'egg');
INSERT INTO `ingredient` (`id`, `name`) VALUES (9, 'rice');
INSERT INTO `ingredient` (`id`, `name`) VALUES (10, 'vegetable oil');
INSERT INTO `ingredient` (`id`, `name`) VALUES (11, 'pork (ground)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (12, 'beef (ground)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (13, 'cheese');
INSERT INTO `ingredient` (`id`, `name`) VALUES (14, 'garlic');
INSERT INTO `ingredient` (`id`, `name`) VALUES (15, 'orange');
INSERT INTO `ingredient` (`id`, `name`) VALUES (16, 'turkey');
INSERT INTO `ingredient` (`id`, `name`) VALUES (17, 'onion');
INSERT INTO `ingredient` (`id`, `name`) VALUES (18, 'corn');
INSERT INTO `ingredient` (`id`, `name`) VALUES (19, 'whole milk');
INSERT INTO `ingredient` (`id`, `name`) VALUES (20, 'mayonnaise');
INSERT INTO `ingredient` (`id`, `name`) VALUES (21, 'chiles');
INSERT INTO `ingredient` (`id`, `name`) VALUES (22, 'almonds');
INSERT INTO `ingredient` (`id`, `name`) VALUES (23, 'bacon');
INSERT INTO `ingredient` (`id`, `name`) VALUES (24, 'mushrooms');
INSERT INTO `ingredient` (`id`, `name`) VALUES (25, 'coconut');
INSERT INTO `ingredient` (`id`, `name`) VALUES (26, 'beets');
INSERT INTO `ingredient` (`id`, `name`) VALUES (27, 'strawberries');
INSERT INTO `ingredient` (`id`, `name`) VALUES (28, 'fennel');
INSERT INTO `ingredient` (`id`, `name`) VALUES (29, 'lamb');
INSERT INTO `ingredient` (`id`, `name`) VALUES (30, 'apple');
INSERT INTO `ingredient` (`id`, `name`) VALUES (31, 'shrimp');
INSERT INTO `ingredient` (`id`, `name`) VALUES (32, 'black beans');
INSERT INTO `ingredient` (`id`, `name`) VALUES (33, 'pinto beans');
INSERT INTO `ingredient` (`id`, `name`) VALUES (34, 'kidney beans');
INSERT INTO `ingredient` (`id`, `name`) VALUES (35, 'chickpeas');
INSERT INTO `ingredient` (`id`, `name`) VALUES (36, 'lentils');
INSERT INTO `ingredient` (`id`, `name`) VALUES (37, 'refried beans');
INSERT INTO `ingredient` (`id`, `name`) VALUES (38, 'brown rice');
INSERT INTO `ingredient` (`id`, `name`) VALUES (39, 'white rice');
INSERT INTO `ingredient` (`id`, `name`) VALUES (40, 'wild rice');
INSERT INTO `ingredient` (`id`, `name`) VALUES (41, 'spaghetti');
INSERT INTO `ingredient` (`id`, `name`) VALUES (42, 'fettuccini');
INSERT INTO `ingredient` (`id`, `name`) VALUES (43, 'penne');
INSERT INTO `ingredient` (`id`, `name`) VALUES (44, 'bowtie pasta');
INSERT INTO `ingredient` (`id`, `name`) VALUES (45, 'ramen noodles');
INSERT INTO `ingredient` (`id`, `name`) VALUES (46, 'egg noodles');
INSERT INTO `ingredient` (`id`, `name`) VALUES (47, 'couscous');
INSERT INTO `ingredient` (`id`, `name`) VALUES (48, 'orzo');
INSERT INTO `ingredient` (`id`, `name`) VALUES (49, 'cornmeal');
INSERT INTO `ingredient` (`id`, `name`) VALUES (50, 'whole wheat crackers');
INSERT INTO `ingredient` (`id`, `name`) VALUES (51, 'whole wheat bread');
INSERT INTO `ingredient` (`id`, `name`) VALUES (52, 'multigrain bread');
INSERT INTO `ingredient` (`id`, `name`) VALUES (53, 'white bread');
INSERT INTO `ingredient` (`id`, `name`) VALUES (54, 'rye bread');
INSERT INTO `ingredient` (`id`, `name`) VALUES (55, 'bread crumbs');
INSERT INTO `ingredient` (`id`, `name`) VALUES (56, 'panko bread crumbs');
INSERT INTO `ingredient` (`id`, `name`) VALUES (57, 'croutons');
INSERT INTO `ingredient` (`id`, `name`) VALUES (58, 'tomato');
INSERT INTO `ingredient` (`id`, `name`) VALUES (59, 'pickle');
INSERT INTO `ingredient` (`id`, `name`) VALUES (60, 'salsa (mild)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (61, 'salsa (medium)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (62, 'salsa (hot)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (63, 'green beans');
INSERT INTO `ingredient` (`id`, `name`) VALUES (64, 'applesauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (65, 'raisins');
INSERT INTO `ingredient` (`id`, `name`) VALUES (66, 'dates');
INSERT INTO `ingredient` (`id`, `name`) VALUES (67, 'marinara sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (68, 'pizza sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (69, 'tomato sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (70, 'chicken broth');
INSERT INTO `ingredient` (`id`, `name`) VALUES (71, 'chicken bouillon');
INSERT INTO `ingredient` (`id`, `name`) VALUES (72, 'beef broth');
INSERT INTO `ingredient` (`id`, `name`) VALUES (73, 'beef bouillon');
INSERT INTO `ingredient` (`id`, `name`) VALUES (74, 'bone broth');
INSERT INTO `ingredient` (`id`, `name`) VALUES (75, 'tuna (fresh)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (76, 'tuna (canned)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (77, 'salmon (fresh)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (78, 'clams (minced)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (79, 'tomatos (diced)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (80, 'tomatos (sliced)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (81, 'evaporated milk');
INSERT INTO `ingredient` (`id`, `name`) VALUES (82, 'apple cider vinegar');
INSERT INTO `ingredient` (`id`, `name`) VALUES (83, 'white vinegar');
INSERT INTO `ingredient` (`id`, `name`) VALUES (84, 'balsimic vinegar');
INSERT INTO `ingredient` (`id`, `name`) VALUES (85, 'chedder cheese');
INSERT INTO `ingredient` (`id`, `name`) VALUES (86, ' mozzarella cheese');
INSERT INTO `ingredient` (`id`, `name`) VALUES (87, 'swiss cheese');
INSERT INTO `ingredient` (`id`, `name`) VALUES (88, 'monterey jack cheese');
INSERT INTO `ingredient` (`id`, `name`) VALUES (89, 'cottage cheese');
INSERT INTO `ingredient` (`id`, `name`) VALUES (90, 'parmesan cheese');
INSERT INTO `ingredient` (`id`, `name`) VALUES (91, 'sour cream');
INSERT INTO `ingredient` (`id`, `name`) VALUES (92, 'cream cheese');
INSERT INTO `ingredient` (`id`, `name`) VALUES (93, 'flour tortilla');
INSERT INTO `ingredient` (`id`, `name`) VALUES (94, 'corn tortilla');
INSERT INTO `ingredient` (`id`, `name`) VALUES (95, 'Worcestershire sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (96, 'soy sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (97, 'teriyaki sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (98, 'chili sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (99, 'ketchup');
INSERT INTO `ingredient` (`id`, `name`) VALUES (100, 'yellow mustard');
INSERT INTO `ingredient` (`id`, `name`) VALUES (101, 'spicy mustard');
INSERT INTO `ingredient` (`id`, `name`) VALUES (102, 'dijon mustard');
INSERT INTO `ingredient` (`id`, `name`) VALUES (103, 'water');
INSERT INTO `ingredient` (`id`, `name`) VALUES (104, 'green pepper');
INSERT INTO `ingredient` (`id`, `name`) VALUES (105, 'yello pepper');
INSERT INTO `ingredient` (`id`, `name`) VALUES (106, 'red pepper');
INSERT INTO `ingredient` (`id`, `name`) VALUES (107, 'brown sugar');
INSERT INTO `ingredient` (`id`, `name`) VALUES (108, 'baking soda');
INSERT INTO `ingredient` (`id`, `name`) VALUES (109, 'baking powder');
INSERT INTO `ingredient` (`id`, `name`) VALUES (110, 'cocoa powder');
INSERT INTO `ingredient` (`id`, `name`) VALUES (111, 'cream of tartar');
INSERT INTO `ingredient` (`id`, `name`) VALUES (112, 'peanut oil');
INSERT INTO `ingredient` (`id`, `name`) VALUES (113, 'coconut oil');
INSERT INTO `ingredient` (`id`, `name`) VALUES (114, 'sea salt');
INSERT INTO `ingredient` (`id`, `name`) VALUES (115, 'basil');
INSERT INTO `ingredient` (`id`, `name`) VALUES (116, 'oregano');
INSERT INTO `ingredient` (`id`, `name`) VALUES (117, 'parsley');
INSERT INTO `ingredient` (`id`, `name`) VALUES (118, 'garlic powder');
INSERT INTO `ingredient` (`id`, `name`) VALUES (119, 'onion powder');
INSERT INTO `ingredient` (`id`, `name`) VALUES (120, ' cinnamon stick');
INSERT INTO `ingredient` (`id`, `name`) VALUES (121, 'cinnamon powder');
INSERT INTO `ingredient` (`id`, `name`) VALUES (122, 'nutmeg');
INSERT INTO `ingredient` (`id`, `name`) VALUES (123, 'cumin');
INSERT INTO `ingredient` (`id`, `name`) VALUES (124, 'thyme');
INSERT INTO `ingredient` (`id`, `name`) VALUES (125, 'real vanilla extract');
INSERT INTO `ingredient` (`id`, `name`) VALUES (126, 'almond extract');
INSERT INTO `ingredient` (`id`, `name`) VALUES (127, 'maple extract');
INSERT INTO `ingredient` (`id`, `name`) VALUES (128, 'mint extract');
INSERT INTO `ingredient` (`id`, `name`) VALUES (129, 'mint leaves');
INSERT INTO `ingredient` (`id`, `name`) VALUES (130, 'orange extract');
INSERT INTO `ingredient` (`id`, `name`) VALUES (131, 'rum extract');
INSERT INTO `ingredient` (`id`, `name`) VALUES (132, 'almond flour');
INSERT INTO `ingredient` (`id`, `name`) VALUES (133, 'almond meal');
INSERT INTO `ingredient` (`id`, `name`) VALUES (134, 'chia seeds');
INSERT INTO `ingredient` (`id`, `name`) VALUES (135, 'jalepeno');
INSERT INTO `ingredient` (`id`, `name`) VALUES (136, 'black olives');
INSERT INTO `ingredient` (`id`, `name`) VALUES (137, 'pumpkin seeds');
INSERT INTO `ingredient` (`id`, `name`) VALUES (138, 'sunflower seeds');
INSERT INTO `ingredient` (`id`, `name`) VALUES (139, 'macadamia nuts');
INSERT INTO `ingredient` (`id`, `name`) VALUES (140, 'walnuts');
INSERT INTO `ingredient` (`id`, `name`) VALUES (141, 'pine nuts');
INSERT INTO `ingredient` (`id`, `name`) VALUES (142, 'cashews');
INSERT INTO `ingredient` (`id`, `name`) VALUES (143, 'pecans');
INSERT INTO `ingredient` (`id`, `name`) VALUES (144, 'nut butter');
INSERT INTO `ingredient` (`id`, `name`) VALUES (145, 'salted butter');
INSERT INTO `ingredient` (`id`, `name`) VALUES (146, 'artichoke');
INSERT INTO `ingredient` (`id`, `name`) VALUES (147, 'artichoke hearts');
INSERT INTO `ingredient` (`id`, `name`) VALUES (148, 'pumpkin');
INSERT INTO `ingredient` (`id`, `name`) VALUES (149, 'alfredo sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (150, 'pesto sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (151, 'feta cheese');
INSERT INTO `ingredient` (`id`, `name`) VALUES (152, 'greek yogurt');
INSERT INTO `ingredient` (`id`, `name`) VALUES (153, 'cottage cheese');
INSERT INTO `ingredient` (`id`, `name`) VALUES (154, 'plain yogurt');
INSERT INTO `ingredient` (`id`, `name`) VALUES (155, 'whipping cream');
INSERT INTO `ingredient` (`id`, `name`) VALUES (156, 'chicken breasts');
INSERT INTO `ingredient` (`id`, `name`) VALUES (157, 'sliced pepperoni');
INSERT INTO `ingredient` (`id`, `name`) VALUES (158, 'beef hot dogs');
INSERT INTO `ingredient` (`id`, `name`) VALUES (159, 'hot dogs');
INSERT INTO `ingredient` (`id`, `name`) VALUES (160, 'grapes');
INSERT INTO `ingredient` (`id`, `name`) VALUES (161, 'grape tomatos');
INSERT INTO `ingredient` (`id`, `name`) VALUES (162, 'cucumber');
INSERT INTO `ingredient` (`id`, `name`) VALUES (163, 'zucchini');
INSERT INTO `ingredient` (`id`, `name`) VALUES (164, 'cauliflower');
INSERT INTO `ingredient` (`id`, `name`) VALUES (165, 'spinach');
INSERT INTO `ingredient` (`id`, `name`) VALUES (166, 'iceberg lettuce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (167, 'romaine lettuce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (168, 'lemon juice');
INSERT INTO `ingredient` (`id`, `name`) VALUES (169, 'green olives');
INSERT INTO `ingredient` (`id`, `name`) VALUES (170, 'coconut milk');
INSERT INTO `ingredient` (`id`, `name`) VALUES (171, 'relish');
INSERT INTO `ingredient` (`id`, `name`) VALUES (172, 'brussel sprouts');
INSERT INTO `ingredient` (`id`, `name`) VALUES (173, 'ginger root');
INSERT INTO `ingredient` (`id`, `name`) VALUES (174, 'lime juice');
INSERT INTO `ingredient` (`id`, `name`) VALUES (175, 'blueberries');
INSERT INTO `ingredient` (`id`, `name`) VALUES (176, 'strawberries');
INSERT INTO `ingredient` (`id`, `name`) VALUES (177, 'bbq sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (178, 'flank steak');
INSERT INTO `ingredient` (`id`, `name`) VALUES (179, 'skirt steak');
INSERT INTO `ingredient` (`id`, `name`) VALUES (180, 'ribeye steak');
INSERT INTO `ingredient` (`id`, `name`) VALUES (181, 'tilapia');
INSERT INTO `ingredient` (`id`, `name`) VALUES (182, 'raspberries');
INSERT INTO `ingredient` (`id`, `name`) VALUES (183, 'cherries');
INSERT INTO `ingredient` (`id`, `name`) VALUES (184, 'apricot');
INSERT INTO `ingredient` (`id`, `name`) VALUES (185, 'blackberries');
INSERT INTO `ingredient` (`id`, `name`) VALUES (186, 'vanilla bean (whole)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (187, 'vanilla ice cream');
INSERT INTO `ingredient` (`id`, `name`) VALUES (188, 'chocolate ice cream');
INSERT INTO `ingredient` (`id`, `name`) VALUES (189, 'coffee (ground)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (190, 'black tea');
INSERT INTO `ingredient` (`id`, `name`) VALUES (191, 'green tea');
INSERT INTO `ingredient` (`id`, `name`) VALUES (192, 'herbal tea');
INSERT INTO `ingredient` (`id`, `name`) VALUES (193, 'pear');
INSERT INTO `ingredient` (`id`, `name`) VALUES (194, 'bananas');
INSERT INTO `ingredient` (`id`, `name`) VALUES (195, 'kiwi');
INSERT INTO `ingredient` (`id`, `name`) VALUES (196, 'acorn squash');
INSERT INTO `ingredient` (`id`, `name`) VALUES (197, 'arugula');
INSERT INTO `ingredient` (`id`, `name`) VALUES (198, 'avocado');
INSERT INTO `ingredient` (`id`, `name`) VALUES (199, 'bok choy');
INSERT INTO `ingredient` (`id`, `name`) VALUES (200, 'cabbage');
INSERT INTO `ingredient` (`id`, `name`) VALUES (201, 'celery');
INSERT INTO `ingredient` (`id`, `name`) VALUES (202, 'collard greens');
INSERT INTO `ingredient` (`id`, `name`) VALUES (203, 'eggplant');
INSERT INTO `ingredient` (`id`, `name`) VALUES (204, 'kale');
INSERT INTO `ingredient` (`id`, `name`) VALUES (205, 'leeks');
INSERT INTO `ingredient` (`id`, `name`) VALUES (206, 'peas');
INSERT INTO `ingredient` (`id`, `name`) VALUES (207, 'potato');
INSERT INTO `ingredient` (`id`, `name`) VALUES (208, 'radish');
INSERT INTO `ingredient` (`id`, `name`) VALUES (209, 'shallots');
INSERT INTO `ingredient` (`id`, `name`) VALUES (210, 'spaghetti squash');
INSERT INTO `ingredient` (`id`, `name`) VALUES (211, 'sprouts');
INSERT INTO `ingredient` (`id`, `name`) VALUES (212, 'sweet potato');
INSERT INTO `ingredient` (`id`, `name`) VALUES (213, 'swiss chard');
INSERT INTO `ingredient` (`id`, `name`) VALUES (214, 'turnip');
INSERT INTO `ingredient` (`id`, `name`) VALUES (215, 'watercress');
INSERT INTO `ingredient` (`id`, `name`) VALUES (216, 'yellow squash');
INSERT INTO `ingredient` (`id`, `name`) VALUES (217, 'cranberries');
INSERT INTO `ingredient` (`id`, `name`) VALUES (218, 'figs');
INSERT INTO `ingredient` (`id`, `name`) VALUES (219, 'grapefruit');
INSERT INTO `ingredient` (`id`, `name`) VALUES (220, 'guava');
INSERT INTO `ingredient` (`id`, `name`) VALUES (221, 'lemon');
INSERT INTO `ingredient` (`id`, `name`) VALUES (222, 'lime');
INSERT INTO `ingredient` (`id`, `name`) VALUES (223, 'mango');
INSERT INTO `ingredient` (`id`, `name`) VALUES (224, 'nectarine');
INSERT INTO `ingredient` (`id`, `name`) VALUES (225, 'papaya');
INSERT INTO `ingredient` (`id`, `name`) VALUES (226, 'passion fruit');
INSERT INTO `ingredient` (`id`, `name`) VALUES (227, 'peach (whole)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (228, 'peaches (canned)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (229, 'persimmon');
INSERT INTO `ingredient` (`id`, `name`) VALUES (230, 'pineapple');
INSERT INTO `ingredient` (`id`, `name`) VALUES (231, 'plantains');
INSERT INTO `ingredient` (`id`, `name`) VALUES (232, 'plum');
INSERT INTO `ingredient` (`id`, `name`) VALUES (233, 'pomegranate');
INSERT INTO `ingredient` (`id`, `name`) VALUES (234, 'tangerine');
INSERT INTO `ingredient` (`id`, `name`) VALUES (235, 'watermelon');
INSERT INTO `ingredient` (`id`, `name`) VALUES (236, 'bison');
INSERT INTO `ingredient` (`id`, `name`) VALUES (237, 'duck');
INSERT INTO `ingredient` (`id`, `name`) VALUES (238, 'turkey');
INSERT INTO `ingredient` (`id`, `name`) VALUES (239, 'ghee');
INSERT INTO `ingredient` (`id`, `name`) VALUES (240, 'sesame oil');
INSERT INTO `ingredient` (`id`, `name`) VALUES (241, 'brazil nuts');
INSERT INTO `ingredient` (`id`, `name`) VALUES (242, 'hazelnuts');
INSERT INTO `ingredient` (`id`, `name`) VALUES (243, 'club soda');
INSERT INTO `ingredient` (`id`, `name`) VALUES (244, 'rum');
INSERT INTO `ingredient` (`id`, `name`) VALUES (245, 'vodka');
INSERT INTO `ingredient` (`id`, `name`) VALUES (246, 'whiskey');
INSERT INTO `ingredient` (`id`, `name`) VALUES (247, 'gin');
INSERT INTO `ingredient` (`id`, `name`) VALUES (248, 'beer');
INSERT INTO `ingredient` (`id`, `name`) VALUES (249, 'tequila');
INSERT INTO `ingredient` (`id`, `name`) VALUES (250, 'brandy');
INSERT INTO `ingredient` (`id`, `name`) VALUES (251, 'red wine');
INSERT INTO `ingredient` (`id`, `name`) VALUES (252, 'white wine');
INSERT INTO `ingredient` (`id`, `name`) VALUES (253, 'sake');
INSERT INTO `ingredient` (`id`, `name`) VALUES (254, 'soju');
INSERT INTO `ingredient` (`id`, `name`) VALUES (255, 'kombucha');
INSERT INTO `ingredient` (`id`, `name`) VALUES (256, 'mineral water');
INSERT INTO `ingredient` (`id`, `name`) VALUES (257, 'almond butter');
INSERT INTO `ingredient` (`id`, `name`) VALUES (258, 'arrowroot powder');
INSERT INTO `ingredient` (`id`, `name`) VALUES (259, 'cacao');
INSERT INTO `ingredient` (`id`, `name`) VALUES (260, 'curry paste');
INSERT INTO `ingredient` (`id`, `name`) VALUES (261, 'fish sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (262, 'hot sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (263, 'nutritional yeast');
INSERT INTO `ingredient` (`id`, `name`) VALUES (264, 'sardines');
INSERT INTO `ingredient` (`id`, `name`) VALUES (265, 'tahini');
INSERT INTO `ingredient` (`id`, `name`) VALUES (266, 'tapioca pudding');
INSERT INTO `ingredient` (`id`, `name`) VALUES (267, 'tapioca flour');
INSERT INTO `ingredient` (`id`, `name`) VALUES (268, 'unflavored gelatin');
INSERT INTO `ingredient` (`id`, `name`) VALUES (269, 'sea bass');
INSERT INTO `ingredient` (`id`, `name`) VALUES (270, 'trout');
INSERT INTO `ingredient` (`id`, `name`) VALUES (271, 'cod filet');
INSERT INTO `ingredient` (`id`, `name`) VALUES (272, 'oregano');
INSERT INTO `ingredient` (`id`, `name`) VALUES (273, 'paprika');
INSERT INTO `ingredient` (`id`, `name`) VALUES (274, 'quinoa');
INSERT INTO `ingredient` (`id`, `name`) VALUES (275, 'purslane');
INSERT INTO `ingredient` (`id`, `name`) VALUES (276, 'orange peel (grated)');
INSERT INTO `ingredient` (`id`, `name`) VALUES (277, 'oatmeal');
INSERT INTO `ingredient` (`id`, `name`) VALUES (278, 'yams');
INSERT INTO `ingredient` (`id`, `name`) VALUES (279, 'spearmint');
INSERT INTO `ingredient` (`id`, `name`) VALUES (280, 'honey');
INSERT INTO `ingredient` (`id`, `name`) VALUES (281, 'xanthan gum');
INSERT INTO `ingredient` (`id`, `name`) VALUES (282, 'palm sugar');
INSERT INTO `ingredient` (`id`, `name`) VALUES (283, 'shrimp paste');
INSERT INTO `ingredient` (`id`, `name`) VALUES (284, 'allspice');
INSERT INTO `ingredient` (`id`, `name`) VALUES (285, 'tamarind');
INSERT INTO `ingredient` (`id`, `name`) VALUES (286, 'lemongrass');
INSERT INTO `ingredient` (`id`, `name`) VALUES (287, 'sticky rice');
INSERT INTO `ingredient` (`id`, `name`) VALUES (288, 'jasmine rice');
INSERT INTO `ingredient` (`id`, `name`) VALUES (289, 'thai basil');
INSERT INTO `ingredient` (`id`, `name`) VALUES (290, 'capers');
INSERT INTO `ingredient` (`id`, `name`) VALUES (291, 'cornstarch');
INSERT INTO `ingredient` (`id`, `name`) VALUES (292, 'cayenne pepper');
INSERT INTO `ingredient` (`id`, `name`) VALUES (293, 'rice wine vinegar');
INSERT INTO `ingredient` (`id`, `name`) VALUES (294, 'tofu');
INSERT INTO `ingredient` (`id`, `name`) VALUES (295, 'mutton');
INSERT INTO `ingredient` (`id`, `name`) VALUES (296, 'lamb');
INSERT INTO `ingredient` (`id`, `name`) VALUES (297, 'crab');
INSERT INTO `ingredient` (`id`, `name`) VALUES (298, 'jackfruit');
INSERT INTO `ingredient` (`id`, `name`) VALUES (299, 'shiitake mushroom');
INSERT INTO `ingredient` (`id`, `name`) VALUES (300, 'cream of mushroom soup (can)');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cookbook_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `kitchntabldb`;
INSERT INTO `cookbook_rating` (`cookbook_id`, `user_id`, `rating`, `rating_date`, `rating_comment`) VALUES (1, 1, 3, '2019-10-21 01:25:25', 'its ok.');
INSERT INTO `cookbook_rating` (`cookbook_id`, `user_id`, `rating`, `rating_date`, `rating_comment`) VALUES (1, 2, 5, '2010-01-21 01:25:25', 'John is the best chef.');

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

