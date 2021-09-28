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
  `name` VARCHAR(1000) NOT NULL,
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
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (1, 'Peanut butter and jelly sandwich', 'STEP 1\n\nFor each sandwich, spread 2 tablespoons peanut butter onto 1 slice of bread. Spread 1 tablespoon jelly onto another slice of bread. Place on top of peanut butter, jelly-side down. Spread 1 teaspoon butter onto outside of each slice of bread.\n\nSTEP 2\n\nHeat 12-inch skillet or griddle over medium heat.\n\nSTEP 3\n\nPlace 2 sandwiches into skillet. Cook, turning once, 4-6 minutes or until golden brown and peanut butter is melted. Repeat with remaining sandwiches.', 400, 5, 'kid friendly', '1', 5, 1, 1, 'https://storcpdkenticomedia.blob.core.windows.net/media/recipemanagementsystem/media/recipe-media-files/recipes/retail/desktopimages/2018_grilled-peanut-butter-and-jelly_20336_600x600.jpg?ext=.jpg', 'basic american staple');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (2, 'Keto Cheeseburger', 'METHOD\n1.For the dressing, combine half the onion (reserve remaining onion to serve) and the remaining ingredients in a bowl and season. Set aside.\n2.Place mince in a frypan over medium-high heat and cook, breaking up with a wooden spoon, for 3-4 minutes or until browned all over.\n3.Add chipotle, tomato paste, garlic, 1 tsp salt and ½ tsp freshly ground black pepper, and cook for a further 5-6 minutes or until mince is starting to catch. Remove from the heat.\n4.Arrange lettuce, pickles, tomatoes and beetroot on a serving plate and scatter over the crispy mince. Crumble over cheese and sprinkle reserved onion. Serve with dressing.', NULL, 8, 'keto', '2', 10, 10, 2, 'https://img.delicious.com.au/VoCon_cS/del/2018/01/cheeseburger-salad-71403-1.jpg', 'low carb cheeseburger recipe');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (3, 'Low Carb Spaghetti', 'METHOD\n1.Preheat oven to 250°C. Using a spiraliser, mandoline or vegetable peeler, turn the pumpkin into ‘spaghetti’.\n2.Spread over a roasting pan and top with sage leaves, garlic, prosciutto and almonds. Scatter butter over the tray.\n3.Bake for 10-12 minutes until the butter is melted and a nut-brown colour and prosciutto is crisp.\n4.Toss pumpkin to coat in butter and serve with extra chopped almonds.', NULL, 7, 'paleo', '4', NULL, NULL, 3, 'https://img.delicious.com.au/Q8jQkgVW/del/2016/05/butternut-spaghetti-with-prosciutto-and-brown-butter-30846-2.jpg', 'paleo spaghetti');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (4, 'Lamb and rosemary sausage rolls with beer ketchup', 'METHOD\n1.For the beer ketchup, heat the oil in a medium saucepan over high heat. Add the onion and cook, stirring, for 4-5 minutes until softened. Add the spices and tomato paste, and cook for 1 minute or until fragrant. Add the beer and cook, stirring, for 2 minutes or until reduced slightly. Add tomato, sugar and vinegar, and bring to the boil, then reduce heat to medium-low. Simmer for 15 minutes or until reduced and thickened. Season to taste and allow to cool.\n2.Preheat oven to 220°C. Place breadcrumbs and beer in a large bowl and set aside for 5 minutes or until the breadcrumbs have absorbed the liquid.\n3.Add the mince, onion, rosemary, olive, mustard, 1 tsp salt flakes and 1/2 tsp freshly ground pepper, and mix well to combine.\n4.Cut the pastry sheets in half and divide one quarter of the mince mixture into a log down the length of each piece of pastry. Brush the edges of the pastry with egg and roll to enclose, then cut each roll in half, to create 8 sausage rolls. Brush the pastry with the egg and sprinkle half with the extra rosemary and half with sesame seeds. Place onto lined baking trays and bake for 30-35 minutes until puffed and golden and cooked through. Serve with beer ketchup alongside. (Leftover beer ketchup can be stored in an airtight container in the fridge for up to 2 weeks).', NULL, 8, 'snack', '8', NULL, NULL, 5, 'https://img.delicious.com.au/oM3trtJ_/del/2021/09/lamb-and-rosemary-sausage-rolls-with-beer-ketchup-157308-2.jpg', 'upscale gameday snack!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (5, 'Vegetarian Burrito Bowl with Avocado Crema', 'Method\nPreheat the oven to 400°F.\nIn a large bowl toss cauliflower, onion, and bell peppers with the taco seasoning, olive oil and lime juice then spread out on a large (rimmed) baking sheet.\nPlace on the center rack and bake for 30 minutes or until the cauliflower is tender with crispy edges.\nWhile the vegetables are cooking prepare avocado crema by placing all ingredients in a food processor or small blender and blending until smooth.\nIn a small skillet combine beans and salsa over medium heat and cook for 5 minutes, until warmed through.\nServe the roasted taco vegetables over cilantro rice, with the beans, lettuce and avocado crema.', 329, 3, 'vegetarian', '6', 30, 20, 6, 'https://images.themodernproper.com/billowy-turkey/production/posts/2020/Vegetarian-Burrito-Bowl-13.jpg?w=667&auto=compress%2Cformat&fit=crop&fp-x=0.5&fp-y=0.5&dm=1599768871&s=3c6b5cdfed282781c396e77cb32b0127', 'vegetarian burrito, so delicious!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (6, 'Easy Sheet Pan Baked Eggs and Veggies', 'Preheat the oven to 400 degrees F.\nPlace sliced bell peppers (all colors) in a large mixing bowl. Add red onions. Season with kosher salt and pepper, 1 tsp za\'atar, 1 tsp cumin and 1 tsp Aleppo chili pepper (keep the remaining za\'atar for later). Drizzle with extra virgin olive oil. Toss to coat.\nTransfer the pepper and onion medley to a large sheet pan. Spread in one layer. Bake in heated oven for 10 to 15 minutes.\nRemove pan from oven briefly. Carefully make 6 \"holes\" or openings among the roasted veggies. Carefully crack each egg into a hole, keeping the  yoke intact (it helps to crack the egg in a small dish to slide carefully into each hole.)\nReturn pan to oven and bake until the egg whites settle. Watch the yokes to see them turn to the doness you like (anywhere from 5 to 8 minutes).\nRemove from oven. Season eggs to your liking. Sprinkle remaining 1 tsp za\'atar all over. Add parsley, diced tomatoes, and a sprinkle of feta. Serve immediately!', NULL, 7, 'mediterranean', '6', 15, 10, 7, 'https://www.themediterraneandish.com/wp-content/uploads/2019/03/Baked-Eggs-and-Vegetables-Sheet-Pan-4.jpg', 'easy breakfast recipe!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (7, 'St. Louis Ribs and Potato Wedges', 'INSTRUCTIONS\n \nPREHEAT oven to 500F.\nCOAT rack of St. Louis Ribs with your favorite seasoning salt (I love Paleo Powder Pink).\nLINE a shallow dish (I use a 9×13 glass pyrex- a baking sheet won\'t work) with parchment paper and add ribs to the dish.\nBAKE ribs for 20 minutes at 500.\nLOWER temperature to 350, cover ribs with foil, and place in the oven.\nBAKE ribs for an additional 90 minutes until they reach an internal temp of at least 145, but go up to 190 for tender meat.\nWHILE ribs are baking at 500, prepare the potatoes.\nWASH potatoes well and cut into half lengthwise, and then into 3 or 4 pieces lengthwise\nCOMBINE all ingredients except potatoes ina. large bowl and whisk to combine\nADD cut potatoes to the bowl and combine with clean hands until all potatoes are well-coated\nLINE a baking sheet with parchment paper and place potatoes in a single layer on the sheet.\nBAKE at 350 alongside the ribs for 60 minutes or until golden brown and fork tender.', NULL, 8, 'whole 30', '4', NULL, NULL, 5, 'https://whole30.com/wp-content/uploads/2021/08/ribs-and-potato-wedges-2-819x1024.jpg', 'enjoy the taste st louis ribs');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (8, 'Blackberry Chocolate Cardamom French Toast', 'Instructions\nPrepare the chocolate ganache: place chopped chocolate and coconut cream in a small saucepan and cook over low heat, stirring constantly until smooth. Add vanilla and salt; stir well and set aside.\nPreheat a nonstick pan with a bit of coconut oil. Meanwhile, combine milk, flax, maple syrup, vanilla and cardamom in a shallow bowl and mix well. Working with one slice at a time, dip bread on both sides, wiping off excess. Place into preheated pan and cook on both sides until just crisp and toasted. Repeat with remaining slices.\nTo assemble, divide coconut whip between half the bread slices, top with fresh blackberries and top with remaining slices. Transfer to serving plates. Top with ganache more coconut whip and fresh blackberries. Garnish with fresh mint. Serve immediately', NULL, 9, 'gluten free', '4', NULL, NULL, 10, 'https://celiac.org/eat-gluten-free/wp-content/uploads/2019/05/FrenchToast.jpg', 'delicious breakfast for celiac sufferers!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (9, 'Low-Sodium Tacos Recipe', 'Instructions\n\n1. In a small bowl, mix taco seasoning until blended.\n2. In a large skillet over medium-high heat, brown meat, and stir in seasoning.\n3. Fill the taco shell with meat, tomatoes, 1 tablespoon of chopped onion, lettuce, and add a dollop of sour cream.', NULL, 6, 'low sodium', '6', NULL, NULL, 6, 'https://www.diplomatpharmacy.com/-/media/Blog-Images/1912-Individual-Recipe-Updates/1912-Individual-Recipe-Updates-Cover-Photos/1912-Low-Sodium-Tacos-copy.jpg', 'low sodium taco recipe for those watching their salt intake');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (10, 'Full English Breakfast', 'Heat up the beans over low in a small pot. Keep warm on low.\nheinz beans | www.iamafoodblog.com\nCook the sausages over medium to medium low heat, turning occasionally, until brown and cooked through. In the same pan, cook the bacon, flipping as needed. Fry the blood pudding slices over medium heat for 3-4 minutes per side.\nmeats for english breakfast | www.iamafoodblog.com\nIn another pan, heat up a bit of oil and cook the mushrooms, without moving, until brown and caramelized. Remove from the pan, then sear the cut side of the tomato briefly. Remove from the pan, season everything with salt and pepper.\nfull english breakfast | www.iamafoodblog.com\nWipe the pan down and heat up a bit of oil or butter over medium heat. Fry the bread until golden, flipping and adding more oil or butter as needed. Remove and set aside. Finally, fry the eggs to your liking. Plate everything up: sausages, bacon, black pudding, mushrooms, tomato, bread, and eggs. Enjoy immediately!', NULL, 7, 'breakfast', '1', NULL, NULL, 4, 'https://iamafoodblog.b-cdn.net/wp-content/uploads/2019/02/full-english-7355w-2-1024x683.webp', 'The classic english breakfast');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (11, 'Southwest Chicken Wrap', 'INSTRUCTIONS\nIn a large bowl, toss together the chicken, corn, black beans, spinach, bell pepper, and cheese until equally mixed.\nIn a separate smaller bowl, stir together the taco seasoning, salsa, and sour cream. Add taco seasoning mix to the chicken mixture and toss until blended.\nDivide the wrap mixture and place a portion in the middle of one tortilla. Roll the burrito, tucking the sides, until completely rolled up.\nIf desired, wrap in plastic wrap and refrigerate until ready to serve.', 776, 5, 'lunch', '4', 5, 5, 2, 'https://www.everydayfamilycooking.com/wp-content/uploads/2021/09/southwest-chicken-wraps1-683x1024.jpg', 'easy to go lunch for the business person on the go!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (12, 'CREAMY GARLIC SHRIMP', 'INSTRUCTIONS\nHeat oil in a large skillet over medium high heat for 2 minutes until the hot oil is sizzling hot. Add shrimp and sear for 2-3 minutes on each side until they turn pink and are fully cooked through. Season with salt and pepper. Set aside on a plate.\nAdd butter and garlic to the same skillet and sauté until fragrant, about one minute. Add wine and stir well to combine, about one minute.\nAdd heavy cream, Italian seasoning and white cheddar. Stir well and bring the sauce to a simmer. Reduce the heat to medium and keep stirring until thickened to a desired consistency.\nReturn the cooked shrimp to the skillet and toss well to coat.\nGarnish with parsley and serve immediately with pasta, rice, or mashed potatoes.', 345, 6, 'dinner', '4-6', 10, 5, 3, 'https://www.aheadofthyme.com/wp-content/uploads/2021/02/creamy-garlic-shrimp-5-683x1024.jpg.webp', 'Creamy garlic shrimp is a delicious, quick and easy 15-minute meal (including prep!) that you need to include in your weeknight dinner meal plan.');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (13, 'Split Pea Soup', 'INSTRUCTIONS\nHeat oil in a large stockpot or 4-qt. Dutch oven over medium-high heat until the hot oil sizzles, about 1 minute. Add onion, carrots, celery and garlic. Sauté until tender, about 5-7 minutes. Season with Italian seasoning and stir well to combine.\nAdd split peas, ham bone, bay leaves, chicken broth and water. Bring the soup to a simmer over medium heat. Stir occasionally and let simmer until split peas are tender and the soup thickens to a desired consistency, about 45-55 minutes.\nRemove ham bone and bay leaves. Chop meat from the bone and stir back into the soup.\nSeason with salt and pepper to taste. Serve warm and top with croutons if desired.', 246, 8, 'soup', '6-8', 60, 15, 4, 'https://www.aheadofthyme.com/wp-content/uploads/2021/09/split-pea-soup-2-683x1024.jpg.webp', '\nSpinach and Green Pea Soup\nCreamy Turkey Orzo Soup\nBeef Cabbage Barley Soup\nCreamy Ham and Potato Soup\nButternut Squash and Apple Soup with Toasted Croutons\nBeef Taco Soup\nLeftover Turkey Wild Rice Soup\n25 Best Vegetarian Soup Recipes\nHome » Soup » Split Pea Soup\n\nSPLIT PEA SOUP\nLeave a Comment\n\nJump to Recipe·Print Recipe\n21SHARES\nPin\n19\nYum\n2\nShare\nTweet\nMore\nClassic split pea soup is a wholesome, filling, and delicious meal that will warm you up inside.');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (14, 'ITALIAN PASTA SALAD WITH NO MEAT', 'INSTRUCTIONS\nCook and drain pasta per directions on the box.\nWhile pasta is cooking, dice the sweet peppers into 1-inch pieces.\nCut each grape tomato in half then chop the block cheddar into 1/2 inch cubes.\nReturn pasta to pot and add in peppers, grape tomatoes, Italian dressing, and Parmesan cheese and mix to combine.\nAdd in cheddar cheese chunks and combine them again.\nServe warm immediately or refrigerate promptly and serve cold up to 5 days.', 285, 9, 'salad', '8', 10, 10, 5, 'https://www.everydayfamilycooking.com/wp-content/uploads/2019/08/summer-pasta-salad.jpg', 'classic italian pasta salad');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (15, 'Hot Cross Buns', 'INSTRUCTIONS\nPrepare the Dough\nIn a large bowl, add milk, yeast, sugar, salt, egg, butter, vanilla extract and cinnamon. Whisk well to combine and let sit for 5 minutes. This allows the yeast to become active.\nAdd in flour and stir well to combine until no dry flour is visible in the bowl. Make sure to scrape down the sides of the bowl with a spatula. The butter might still be a bit crumbly at this point.\nKnead the Dough\nTransfer the dough mixture onto a clean surface and knead the dough for 5-10 minutes until the dough ball is smooth and not sticky at all. Because of the high fat content (butter and milk) in the dough, it should take less than 5 minutes of kneading by hand to achieve a non-sticky and smooth dough ball. A well kneaded dough is smooth and can hold its shape. Also, when you give the dough ball a firm poke with your finger, the indentation should bounce right back. If it doesn’t bounce back and stays like a dimple, keep kneading for a few minutes.\nProof the Dough (First Rise)\nTransfer the dough back into the bowl and lightly grease the dough ball with oil or cooking oil spray.\nCover the bowl with plastic cling wrap and let it rise for 1 hour or until doubled in size. I leave it in the oven (not turned on) with the light on to speed up the rise time.\nShape the Buns\nWhen the dough doubles in size, punch it down to release the air. Add raisins and knead for a few minutes to combine.\nRoll the dough ball into a rectangle and divide it into 12 equal pieces with a knife or bench scraper. Use your hands to roll each piece into a ball and transfer onto a quarter sheet baking pan lined with a silicone baking mat or parchment paper, leaving ½-inch of space between each dough ball.\nProof the Buns (Second Rise)\nPreheat oven to 375F.\nCover the pan with plastic cling wrap to prevent the dough from drying (When the dough loses moisture, it tends to form hard skin around its surface, which creates a hard crust when baking). Let the rolls rest and rise for 45 minutes. The rolls should almost double in size.\nAdd the Cross\nIn a small bowl, add flour and water and stir well into a thick paste. \nTransfer the paste into a piping bag and attached a no. 5 round tip, or snip off the corner.\nPipe crosses over the buns by piping a line down the center of the buns and repeating in the other direction to create crosses.\nBake the Buns\nBake at 375 F for 20-25 minutes until golden brown.\nMake the glaze by mixing together honey and melted butter in a bowl until smooth and combined. Brush the glaze evenly over the buns immediately once out of the oven. Let the buns cool on a wire cooling rack for 15 minutes before serving.', 237, 9, 'bread', '12', 25, 125, 6, 'https://www.aheadofthyme.com/wp-content/uploads/2021/03/hot-cross-buns-4-683x1024.jpg.webp', 'the classic bread roll and first music song many learn!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (16, 'Spiked Eggnog With Brandy, Bourbon, or Rum', 'Steps to Make It  Gather the ingredients.  Into a 4-quart saucepan, add the eggs, egg yolks, sugar, and salt. Whisk well until combined.  Pour the milk in a slow and steady stream until completely incorporated. Vigorously whisk the mixture.  Place the saucepan on the stove on the lowest possible heat setting. Stir the mixture continuously until an instant-read thermometer reaches 160 F and the mixture thickens enough to coat the back of a spoon. Be patient. This should take about 25 to 30 minutes.​  Strain the mixture through a fine sieve into a large bowl to remove any small bits of cooked egg.  Add the brandy, bourbon, or dark rum plus the vanilla extract and nutmeg. Start with the 1/2 cup of liquor, taste, and add more if you\'d like. Stir well. Remember that adding more liquor also means the eggnog will be thinner in texture and also stronger in taste.  Pour the eggnog into a glass pitcher and cover with a lid or plastic wrap. Refrigerate the egg custard mixture until well chilled, for at least 4 hours.  When ready to serve, pour the cold heavy cream into a bowl and whip until it forms soft peaks.  Fold the whipped cream into the cold custard mixture until combined. Mix carefully so that you don\'t deflate the cream.  Serve in chilled cups or glasses and garnish with an additional sprinkle of nutmeg.', 205, 7, 'alcoholic', '10', 30, 10, 7, 'https://www.thespruceeats.com/thmb/p7D7iqKfx6vNBjtUHX7O5z3YEKU=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/eggnog-with-brandy-bourbon-or-rum-1806044-hero-01-797a5756e7dd4333884244fb490603a9.jpg', 'a classic way to start fights with your family!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (17, 'Non-Alcoholic Homemade Eggnog', 'INSTRUCTIONS\nPlace heavy cream and grated nutmeg in a large bowl with a fine-mesh sieve on top. Set aside.\nIn a saucepan, combine milk and vanilla. Cook over medium heat, swirling occasionally, until bubbles form around the sides and the milk starts steaming.\nIn another bowl, vigorously beat together the eggs, yolks, sugar, and salt for approximately 3-5 minutes until the mixture is thickened and pale. Add in the milk in a slow stream and whisk to incorporate. Pour the mixture back into the saucepan and cook over low heat, stirring constantly with a wooden spoon for about 6 minutes, or until the mixture reaches 165 F. Immediately strain into the bowl with the heavy cream.\nPlace in refrigerator uncovered. Cool completely for at least 2 hours.\nTo serve, pour eggnog into glasses filling only ¾ of the glass. Top with whipped cream, cinnamon, and freshly grated nutmeg', NULL, 8, 'non-alcoholic', '4', 135, 5, 8, 'https://www.aheadofthyme.com/wp-content/uploads/2017/12/non-alcoholic-homemade-eggnog-4.jpg.webp', 'a classic winter treat!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (18, 'Majoon (Banana and Date) Smoothie', 'Place all the ingredients (banana, dates, walnuts, pistachios, milk, cinnamon, vanilla, and ice) into a heavy duty blender.\nBlend on high until smooth, about 45-60 seconds.\nDivide between two large glasses or 4 cups, and serve immediately', 265, 9, 'smoothie', '4', 1, 4, 9, 'https://www.aheadofthyme.com/wp-content/uploads/2015/12/majoon-banana-and-date-smoothie-683x1024.jpg.webp', '\nHealthy Apple Pie Fall Smoothie\nStrawberry Banana Smoothie\n5-Minute Green Detox Smoothie\nMango Pineapple Tropical Smoothie Bowl\nGreen Smoothie Bowl\nHealthy Mango Yogurt Smoothie\n5-Minute Super Berry Smoothie Bowl\nHealthy Banana Bread\nHome » Smoothies » Majoon (Banana and Date) Smoothie\n\nMAJOON (BANANA AND DATE) SMOOTHIE\n24 Comments\n\nJump to Recipe·Print Recipe\n10KSHARES\nPin\n10K\nYum\n170\nShare\n236\nTweet\nMore\nThis majoon (banana and date) smoothie is a delicious and healthy, all-natural energy drink made with banana, dates, and nuts, and packed with nutrients. \nHealthy Apple Pie Fall Smoothie\nStrawberry Banana Smoothie\n5-Minute Green Detox Smoothie\nMango Pineapple Tropical Smoothie Bowl\nGreen Smoothie Bowl\nHealthy Mango Yogurt Smoothie\n5-Minute Super Berry Smoothie Bowl\nHealthy Banana Bread\nHome » Smoothies » Majoon (Banana and Date) Smoothie\n\nMAJOON (BANANA AND DATE) SMOOTHIE\n24 Comments\n\nJump to Recipe·Print Recipe\n10KSHARES\nPin\n10K\nYum\n170\nShare\n236\nTweet\nMore\nThis majoon (banana and date) smoothie is a delicious and healthy, all-natural energy drink made with banana, dates, and nuts, and packed with nutrients. ');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (19, 'Egg McMuffin', 'Preparation\n1. Preheat oven to 350 degrees.\n\n2. Grease 4 round ramekins with cooing spray and place on a cookie sheet. Crack one egg into each ramekin.\n\n3. Sprinkle each egg with a pinch of salt and lightly beat just so yolk is broken.\n\n4. Bake the eggs for 12-15 minutes, until set and cooked through. Remove from the oven and set aside.\n\n5. Run a knife along the edges of each egg to remove them if needed.\n\n6. Place an english muffin half in front of you, top with 1 slice of cheese, 1 slice of ham, and 1 egg, then top with the other english muffin half.\n\n7.Repeat with remaining ingredients to make 4 sandwiches.', NULL, 7, 'American', '4', 2, 15, 10, 'https://weelicious.com/imager/weelicious_com/wp-content/uploads/2015/09/Egg-McMuffin-1_4bc69d0481021c299b9329d2b470c61d.jpg', 'At home version of the American Classic breakfast sandwich');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (20, 'Mexican Street Corn (Elote)', 'INSTRUCTIONS\nPreheat the grill to 400 F, about 5-6 minutes.\nIn a medium mixing bowl, combine sour cream, mayonnaise, garlic powder, cilantro, lime juice, lime zest, paprika, salt, and pepper. Stir well until smooth and evenly mixed. Set aside for 10 minutes, allowing the flavors to infuse into each other.\nPlace the corn on the grill and grill for 6-8 minutes, turning occasionally until nicely charred and cooked through. Set aside on a plate.\nYou can also roast the corn in the oven at 400 F for 25 minutes or cook in boiling water for 10-15 minutes. However, grilling yields a sweeter and creamier taste.\nSpread and brush the sauce evenly over the corn and top with Parmesan (or cojita cheese). Drizzle with extra lime juice, cilantro, and a sprinkle of chili powder, if desired.\n', NULL, 8, 'Mexican', '4', 10, 10, 11, 'https://www.aheadofthyme.com/wp-content/uploads/2021/07/mexican-street-corn-elote-3-683x1024.jpg.webp', 'a mexican staple at home!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (21, 'Chinese Beef Dumplings with Celery', 'INSTRUCTIONS\nAdd all ingredients (except the dumpling wrappers) into a large bowl and mix together until fully combined.\nScoop a spoonful of the mixture into the centre of a dumpling wrapper. Dip your finger in water and smear along the edges of the dumpling wrapper. Fold the dumpling wrapper over to create a half-moon shape, enclosing the filling inside. Seal the filling inside by pleating the edges together with your finger or pinch the edges together with a fork. Repeat until all the mixture and dumpling wrappers are used up.\nCook by pan-frying, steaming or boiling.\nTo Pan-Fry: In a large skillet, heat vegetable oil over medium heat. Add some dumplings and cook 2-3 minutes until bottom is crisp and golden. Add water (enough to cover the dumplings halfway up), cover, and steam the dumplings for about 5 minutes until the liquid is absorbed.\nTo Steam: In a pot, bring water to boil . Place some dumplings in steamer on top and steam for 15 to 20 minutes until tender.\nTo Boil: Fill a large pot with ⅔ water and bring to a boil. Add some dumplings and cook until they float and continue to cook for 2-3 minutes.\nRepeat with remaining dumplings or store uncooked dumplings in the fridge for up to 2 days or in the freezer for up to 3 months.', NULL, 6, 'Chinese', '20', 10, 60, 12, 'https://www.aheadofthyme.com/wp-content/uploads/2018/11/chinese-beef-dumplings-with-celery-11.jpg.webp', 'Easy-to-make Chinese beef dumplings with celery can be made in advance for a stress-free meal. Enjoy these steamed, boiled or pan-fried!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (22, 'Classic French Macaron with Vanilla Buttercream Filling', 'INSTRUCTIONS\nMacaron Shells:\nCombine almond flour and confectioners\' sugar in a bowl and whisk together. Pass mixture through a fine-mesh sieve, pressing down on clumps.\nIn a large bowl, beat the egg whites using a hand-mixer or stand-mixer on medium speed for 2 minutes until soft peaks form. Add the granulated sugar and beat on high for 2 more minutes until stiff, glossy peaks form.\nAdd vanilla and beat on high for another 30 seconds.\nGently fold in dry ingredients and repeat until mixture is smooth and shiny, (with no visible dry ingredients) and begins to run a little but not too runny. Think lava consistency. Do not overfold.\nTake a pastry bag fitted with a ½ inch round tip and fill with the batter.\nLine 2 baking sheets with parchment paper and pipe batter into ¾-inch round circles, 1 inch apart.\nTap the baking sheet firmly against the counter to release any air bubbles.\nLet stand at room temperature for 30 minutes until they form a skin.\nPreheat oven to 325 F.\nBake for 10-12 minutes, rotating halfway, until cookies have risen and just set. The cookies should be able to just come off the baking sheet when you try to lift them.\nLet cool for 5 minutes then transfer to wire rack and let cool completely.\nVanilla Buttercream Filling:\nUsing a hand mixer or a stand mixer, cream butter until soft and smooth.\nAdd powdered sugar, milk, and vanilla and mix until light and fluffy.\nMake the Macarons:\nTransfer the buttercream filling into a piping bag with a round tip.\nPipe a swirl of filling on half the cookies.\nSandwich cookies together with the remaining halves.INSTRUCTIONS\nMacaron Shells:\nCombine almond flour and confectioners\' sugar in a bowl and whisk together. Pass mixture through a fine-mesh sieve, pressing down on clumps.\nIn a large bowl, beat the egg whites using a hand-mixer or stand-mixer on medium speed for 2 minutes until soft peaks form. Add the granulated sugar and beat on high for 2 more minutes until stiff, glossy peaks form.\nAdd vanilla and beat on high for another 30 seconds.\nGently fold in dry ingredients and repeat until mixture is smooth and shiny, (with no visible dry ingredients) and begins to run a little but not too runny. Think lava consistency. Do not overfold.\nTake a pastry bag fitted with a ½ inch round tip and fill with the batter.\nLine 2 baking sheets with parchment paper and pipe batter into ¾-inch round circles, 1 inch apart.\nTap the baking sheet firmly against the counter to release any air bubbles.\nLet stand at room temperature for 30 minutes until they form a skin.\nPreheat oven to 325 F.\nBake for 10-12 minutes, rotating halfway, until cookies have risen and just set. The cookies should be able to just come off the baking sheet when you try to lift them.\nLet cool for 5 minutes then transfer to wire rack and let cool completely.\nVanilla Buttercream Filling:\nUsing a hand mixer or a stand mixer, cream butter until soft and smooth.\nAdd powdered sugar, milk, and vanilla and mix until light and fluffy.\nMake the Macarons:\nTransfer the buttercream filling into a piping bag with a round tip.\nPipe a swirl of filling on half the cookies.\nSandwich cookies together with the remaining halves.', 276, 5, 'French', '12', 15, 60, 13, 'https://www.aheadofthyme.com/wp-content/uploads/2017/02/classic-french-macaron-with-vanilla-buttercream-filling-4.jpg.webp', 'Every bite of this sweet, classic french macaron with vanilla buttercream filling is melt-in-your-mouth goodness.');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (23, 'Korean Chicken Skewers', 'INSTRUCTIONS\nCombine all the marinade ingredients including oil, soy sauce, vinegar, sesame oil, garlic, ginger, honey, and chili paste (add 1-2 tablespoons depending on how spicy you would like) in a small mixing bowl and stir well until smooth. Add cubed chicken and stir with a spoon to coat all the chicken pieces.\nCover the bowl with cling wrap and refrigerate or at least 1 hour (or overnight for the best results). You can also store the marinated chicken in a sealed ziploc bag.\nAdd 4-5 pieces of cube chicken to each skewer. Reserve the marinade. \nYou can grill the chicken skewers or bake them.\nTo grill the skewers: Lightly apply cooking oil over chicken skewers using a cooking oil spray or silicone brush. Preheat the grill over medium-high heat for 3 minutes until sizzling hot. Place the skewers evenly apart on the grill pan and grill for 8-10 minutes on each side, or until the internal temperature of the chicken reaches 165 F. Do not overlap the skewers at any time to ensure even cooking for all the skewers. \nTo bake the skewers: Preheat the oven to 425 F. Place the marinated chicken skewers on a parchment-lined baking sheet or on a lightly oiled roasting rack in a baking pan. Bake for 15 minutes until golden brown and the internal temperature for the chicken reaches 165F.  Turn on the broil function on the oven on high and broil for 2-3 minutes until nicely charred on the edges.\nTo cook in the air fryer: Do not thread them and place about 10 cubed chicken pieces in the air fryer basket at a time. Cook at 350 F for 25 minutes, shaking the basket halfway through. You won\'t get the charred grill marks but they taste amazing and so tender.\nTransfer the remaining marinade from the bowl to a small saucepan and heat over medium heat for 2 minutes until it starts to boil.\nTransfer the skewers onto a plate and drizzle with the prepared sauce. Garnish with green onions and sesame seeds and serve hot.', NULL, 6, 'Korean', '4', 20, 75, 12, 'https://www.aheadofthyme.com/wp-content/uploads/2021/06/korean-chicken-skewers-8-683x1024.jpg.webp', 'Juicy and tender Korean chicken skewers are packed with bold flavors bringing sweet, savory, and spicy your dinner table. The best summer weeknight dinner.');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (24, 'Mussels Pasta in Tomato Sauce', 'INSTRUCTIONS\nBring a large pot of salted water to a boil over medium-high heat. Add spaghetti noodles and cook until al dente (fully cooked but still firm), about 8-10 minutes or according to package directions. Drain well and set aside.\nIn the meantime, heat oil in a shallow saucepan or large skillet over medium-high heat for 2 minutes until the hot oil is sizzling hot and shimmering. Add onion and garlic and sauté until fragrant and soft, 2-3 minutes.\nAdd mussels and wine. Cover the lid and steam for 6-8 minutes until all shells are wide open. If you don\'t have a lid to cover, stir occasionally to help the mussels cook evenly.\nReduce the heat to medium, and add in tomato sauce and cooked pasta. Toss well to combine and bring the sauce to a simmer, about 3-5 minutes. Stir in cherry tomatoes and season with salt and pepper.\nSprinkle parmesan and parsley on top and serve immediately.', 419, 8, 'Italian', '4', 25, 5, 11, 'https://www.aheadofthyme.com/wp-content/uploads/2021/02/mussels-pasta-in-tomato-sauce-11-683x1024.jpg.webp', 'Mussels pasta in tomato sauce is a simple, light and fresh, seafood pasta dinner that you can make at home in 30 minutes. Easiest weeknight dinner.');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (25, 'Greek Meatballs', 'INSTRUCTIONS\nPreheat oven to 400 F.\nIn a large mixing bowl, combine beef with breadcrumbs, dill, garlic, lemon zest, lemon juice, cumin, oregano, pepper, feta cheese, and egg. Mix well to form into a uniform consistency. Set aside for 15 minutes or refrigerate overnight.\nTake 2 spoonfuls of the beef mixture at a time and roll into meatballs. Transfer meatballs onto a parchment-lined half sheet baking pan and lightly coat with some cooking oil spray to keep them from sticking, if needed.\nBake for 15 minutes until fully cooked. The internal temperature should reach 160F as read on a meat thermometer. \nServe with a drizzle of  tzitaziki sauce, extra dill sprinkled on top, and a side of pita bread.', 148, 9, 'Greek', '4', 15, 15, 10, 'https://www.aheadofthyme.com/wp-content/uploads/2021/05/greek-meatballs-1-683x1024.jpg.webp', 'Baked Greek meatballs are juicy, tender, flavorful, and delicious. They are quick and easy to make in 30 minutes, and freezer-friendly. ');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (26, 'Thai Coconut Red Curry with Prawns', 'INSTRUCTIONS\nHeat vegetable oil in a large pan or wok on medium heat. Add the red curry paste and cook for 30 seconds.\nStir in coconut milk, lemongrass and brown sugar. Stir to combine. Cover and cook for 5 minutes.\nAdd the prawns, snap peas (or green beans), and bell peppers. Cook uncovered for 4-5 minutes until prawns are cooked.\nTake the wok off heat and add the fish sauce, lime juice and basil leaves. Let it rest for 5 minutes and serve with rice or noodles.', NULL, 9, 'Thai', '4', 15, 10, 9, 'https://www.aheadofthyme.com/wp-content/uploads/2015/12/thai-coconut-red-curry-with-prawns-7-768x512.jpg.webp', 'Better than takeout, Thai coconut red curry with prawns is easy, quick, and full of so much flavour! Cook this perfect weeknight dinner in just 15 minutes!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (27, 'Small Batch Garlic Naan Bread', 'INSTRUCTIONSINSTRUCTIONS\nPrepare the Dough:\nIn a large bowl, mix together flour, yeast, water, yogurt, oil, sugar, and salt. Stir well to combine with a spatula until the mixture forms into a shaggy dough. Make sure to scrape off any remaining dry flour from the sides of the bowl.\nApply some water on your hands and stretch and fold the dough by folding the edges over to the centre. Wet hands makes it easier to work with the dough and it should take you less than a minute to fold all 4 sides. Because this dough contains high percentage fat (yogurt and oil) and high hydration (water to flour ratio), it is quite sticky and impossible to knead by hand in the beginning. Cover the bowl in cling wrap and let it rest for 30 minutes.\nKnead the dough using your hands. Because the dough has built up some gluten by resting, it should take you less than 5 minutes to form a smooth and soft dough ball this time. Transfer the smooth dough ball back in the bowl and let it rest covered for 1 hour until it is almost doubles in size.\nTransfer dough onto a lightly oiled surface and roll into a log. Divide the log into 10 even balls by cupping them in your palm and making circular motions.\nTransfer the dough balls to a lined baked tray and cover with plastic cling wrap to prevent them from drying out. Allow the dough balls to rest for 20 minutes.\nPrepare the Garlic Butter:\nCombine melted butter, minced garlic and chopped parsley in a small bowl and mix them evenly. Set aside.\nMake the Naan Bread:\nTake a dough ball and gently press and stretch it with your fingers to form a circular shape, similar to shaping pizza dough. You can also roll the dough out with a rolling pin but make sure the rolled dough is a bit smaller than the size of the skillet. Applying some oil to your hands and the rolling pin will help prevent the dough from sticking.\nTo make the naan bread, you can either cook on a skillet or bake in the oven:\nTo make naan bread on a skillet: Heat a cast-iron skillet over medium-high heat. Transfer the rolled naan onto the hot skillet and cook for 3 minutes on each side. You should see the naan bread rise and form bubbles on top.\nTo bake naan bread in the oven: Preheat a large baking pan or pizza stone in the oven at 500 F. Place rolled naan on the pizza stone and bake for 2-3 minutes. You should see the naan bread rise and form bubbles on top To char the naan bread and make it extra crispy, turn the broiler on high and cook for an extra minute. Keep a close eye on it though, as the broiler gets very hot and can burn if left in too long.\nApply the garlic butter on one side of the naan bread with a brush. Repeat steps above with the rest of the dough balls.\nServe hot with a side of butter chicken or Indian curry.\nPrepare the Dough:\nIn a large bowl, mix together flour, yeast, water, yogurt, oil, sugar, and salt. Stir well to combine with a spatula until the mixture forms into a shaggy dough. Make sure to scrape off any remaining dry flour from the sides of the bowl.\nApply some water on your hands and stretch and fold the dough by folding the edges over to the centre. Wet hands makes it easier to work with the dough and it should take you less than a minute to fold all 4 sides. Because this dough contains high percentage fat (yogurt and oil) and high hydration (water to flour ratio), it is quite sticky and impossible to knead by hand in the beginning. Cover the bowl in cling wrap and let it rest for 30 minutes.\nKnead the dough using your hands. Because the dough has built up some gluten by resting, it should take you less than 5 minutes to form a smooth and soft dough ball this time. Transfer the smooth dough ball back in the bowl and let it rest covered for 1 hour until it is almost doubles in size.\nTransfer dough onto a lightly oiled surface and roll into a log. Divide the log into 10 even balls by cupping them in your palm and making circular motions.\nTransfer the dough balls to a lined baked tray and cover with plastic cling wrap to prevent them from drying out. Allow the dough balls to rest for 20 minutes.\nPrepare the Garlic Butter:\nCombine melted butter, minced garlic and chopped parsley in a small bowl and mix them evenly. Set aside.\nMake the Naan Bread:\nTake a dough ball and gently press and stretch it with your fingers to form a circular shape, similar to shaping pizza dough. You can also roll the dough out with a rolling pin but make sure the rolled dough is a bit smaller than the size of the skillet. Applying some oil to your hands and the rolling pin will help prevent the dough from sticking.\nTo make the naan bread, you can either cook on a skillet or bake in the oven:\nTo make naan bread on a skillet: Heat a cast-iron skillet over medium-high heat. Transfer the rolled naan onto the hot skillet and cook for 3 minutes on each side. You should see the naan bread rise and form bubbles on top.\nTo bake naan bread in the oven: Preheat a large baking pan or pizza stone in the oven at 500 F. Place rolled naan on the pizza stone and bake for 2-3 minutes. You should see the naan bread rise and form bubbles on top To char the naan bread and make it extra crispy, turn the broiler on high and cook for an extra minute. Keep a close eye on it though, as the broiler gets very hot and can burn if left in too long.\nApply the garlic butter on one side of the naan bread with a brush. Repeat steps above with the rest of the dough balls.\nServe hot with a side of butter chicken or Indian curry.', 182, 10, 'Indian', '5', 3, 125, 10, 'https://www.aheadofthyme.com/wp-content/uploads/2020/07/small-batch-garlic-naan-bread-4-683x1024.jpg.webp', 'Freshly baked small batch garlic naan bread is buttery, garlicky, soft and pillowy, and full of perfect blistered air pockets. It\'s quick and easy to make.');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (28, 'Healthy Miso Ramen with Chicken', 'INSTRUCTIONS\nTomato Miso Soup Base:\n\nIn a large pot, heat vegetable oil over medium heat. Add onion, tomato and garlic. Stir and cook for 5 minutes until tomatoes are soft and mushy.\nAdd water and ginger and bring to a boil. Boil for 5 minutes.\nStir in miso paste and dissolve into the soup. Simmer for an additional 3 minutes.\nMarinated Chicken Breast:\n\nAdd seasoning (salt, pepper, sugar, soy sauce, and cayenne pepper, if using) in a medium Ziploc bag. Shake well to mix together. Add the chicken strips to the Ziploc bag. Press the air out of the bag and seal tightly. Press the marinade around the chicken to coat.\nPlace in the fridge and allow chicken to marinate for at least 30 minutes, up to overnight.\nRemove the marinated chicken strips out of the bag and place them on the air fryer basket. Space them evenly and cook at 375 F for 12 minutes. Take out the basket once halfway through and shake it a little bit so that each side cooks evenly.\nCooking the chicken in an air fryer yields the best results. However, if you do not have an air fryer, simply pan-fry the marinated chicken on medium heat for approximately 7 minutes until fully cooked through, while stirring continuously.\nAssembling the Ramen Bowls:\n\nIn a medium pot, bring water to a boil and add the ramen noodles. Cook for 2-3 minutes, until soft, or according to package directions. Divide the noodles into two large bowls.\nEvenly divide and add in corn, air-fry chicken strips, chopped scallions, and one soft-boiled egg to each bowl. Pour in miso broth over top.\nGarnish each bowl with seaweed nori and grated carrots. Sprinkle some sesame seeds on top. Enjoy!\n', NULL, 7, 'Japanese', '2', 30, 15, 13, 'https://www.aheadofthyme.com/wp-content/uploads/2019/10/healthy-miso-ramen-with-chicken-6-1-683x1024.jpg.webp', 'Satisfy your ramen cravings with healthy miso ramen with chicken from the comfort of your own home. Weeknight dinners have never been tastier!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (29, 'Air Fryer Lamb Chops', 'INSTRUCTIONS\nPat dry the lamb rack. Remove silver skin from the underside of ribs if needed. Cut into individual chops.\nIn a large bowl, combine olive oil, oregano, garlic powder, salt, & pepper. Add the lamb and gently toss to coat in the marinade. Cover and marinate for about 1 hour or up to overnight in the refrigerator.\nPreheat your air fryer to 380 degrees F. Place lamb chops in the air fryer in a single layer, making sure not to overlap the meat.\nAir fry for 8 minutes, flip and fry for another 3-6 minutes, or to your preferred doneness. Serve warm.INSTRUCTIONS\nPat dry the lamb rack. Remove silver skin from the underside of ribs if needed. Cut into individual chops.\nIn a large bowl, combine olive oil, oregano, garlic powder, salt, & pepper. Add the lamb and gently toss to coat in the marinade. Cover and marinate for about 1 hour or up to overnight in the refrigerator.\nPreheat your air fryer to 380 degrees F. Place lamb chops in the air fryer in a single layer, making sure not to overlap the meat.\nAir fry for 8 minutes, flip and fry for another 3-6 minutes, or to your preferred doneness. Serve warm.', 526, 5, 'air fryer', '4', 11, 65, 6, 'https://www.everydayfamilycooking.com/wp-content/uploads/2021/09/lamb-chops-in-air-fryer1-683x1024.jpg', 'classic lamb chops done the easy way!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (30, 'Instant Pot Beef Ragu', 'Method\nSet your Instant Pot to sauté mode. Heat the olive oil and add in onion, celery and carrots. Stir until vegetables are soft, about 5-7 min. Add in remaining ingredients, squeezing the whole tomatoes with your hands to crush them before adding them and their juices. Give ingredients a quick stir and close the lid.\nSet instapot to the meat/stew mode and allow to cook for the set high pressure 35 minute cook time. Once finished, leave the steam valve on natural release until the float valve is all the way down.\nOpen lid and remove beef to shred, discarding any large pieces of fat in the process. Once shredded stir beef back into the pot and return to saute mode. Allow to cook until sauce thickens.\nServe over polenta, fresh pasta, zucchini noodles or spaghetti squash.', 505, 8, 'instant pot', '8', 60, 10, 13, 'https://images.themodernproper.com/billowy-turkey/production/posts/2019/instant-pot-beef-ragu-5.jpg?w=1200&auto=compress%2Cformat&fit=crop&fp-x=0.5&fp-y=0.5&dm=1604852866&s=56be7e25c9aa4df35b7d669e81528bfb', 'easy dinner for the family!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (31, 'Snickerdoodle Recipe Without Cream of Tartar', 'INSTRUCTIONS\nPreheat your oven to 350 degrees.\nIn a large mixing bowl and using a hand mixer, beat butter and sugar till it is light and fluffy, about 4-5 minutes. Using a spatula, scrape the sides of the bowl, bringing the butter, sugar mixture back to the middle. Add the egg, egg white, and vanilla, then continue beating until combined.\nIn a medium-size bowl, mix the flour, baking powder, and salt to combine. Sift the flour mixture into the wet ingredients and stir until just combined.\nCover with plastic wrap and refrigerate for at least 20 minutes.\nIn a small bowl combine the sugar and cinnamon. Using a spoon or cookie scoop, roll the dough into small balls until they are round and smooth. Drop and roll the balls into the cinnamon-sugar mixture and coat well till they are completely covered.\nPlace them on a baking sheet, lined with parchment paper. Bake for about 9 minutes,* just till the edges are set and golden.\nRemove the snickerdoodles from the oven and allow them to sit on the pan for 5-10 minutes before moving to a cooling rack.\n', 95, 10, 'dessert', '45', 9, 30, 12, 'https://www.everydayfamilycooking.com/wp-content/uploads/2021/08/snickerdoodle-recipe-with-no-cream-of-tartar5-683x1024.jpg', 'a great classic cookie recipe');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (32, ' Creamy Garlic Mushrooms', 'INSTRUCTIONS\nIn a large skillet, heat olive oil over medium-high heat for 2 minutes until the hot oil sizzles. Add mushrooms and season with salt and pepper. Sauté for 5-7 minutes until nicely browned on all sides.\nAdd butter, garlic and flour. Stir well for 1 minute until fragrant and well combined.\nAdd heavy cream, parsley and Parmesan cheese. Stir well and bring the sauce to a simmer. Reduce heat to medium and keep stirring until thickened to a desired consistency.\nStir in extra pepper and cheese, if desired. Serve over pasta, mashed potatoes, risotto, or rice.\nIn a large skillet, heat olive oil over medium-high heat for 2 minutes until the hot oil sizzles. Add mushrooms and season with salt and pepper. Sauté for 5-7 minutes until nicely browned on all sides.\nAdd butter, garlic and flour. Stir well for 1 minute until fragrant and well combined.\nAdd heavy cream, parsley and Parmesan cheese. Stir well and bring the sauce to a simmer. Reduce heat to medium and keep stirring until thickened to a desired consistency.\nStir in extra pepper and cheese, if desired. Serve over pasta, mashed potatoes, risotto, or rice.', 285, 9, 'one pot', '4', 10, 5, 12, 'https://www.aheadofthyme.com/wp-content/uploads/2021/05/creamy-garlic-mushrooms-7-683x1024.jpg.webp', 'great one pan recipe to appease the adults!');
INSERT INTO `recipe` (`id`, `name`, `instructions`, `calories`, `chef_rating`, `category`, `serving_size`, `cook_time_in_minutes`, `prep_time_in_minutes`, `user_id`, `image`, `description`) VALUES (33, 'Slow Cooker Asian Chicken Lettuce Wraps', 'Instructions\nPlace ground chicken and garlic in a large microwave safe bowl. Microwave mixture, stirring occasionally, until chicken is no longer pink, about 5 - 6 minutes. Drain off liquid and pour mixture into a 5 - 7 quart slow cooker.\nAdd bell pepper, onion, hoisin sauce, soy sauce, 1/2 tsp salt and 1/2 tsp pepper and toss mixture. Cover and cook on low heat 2 - 3 hours until chicken is tender.\nStir in water chestnuts, cooked rice, green onions, rice vinegar, and sesame oil, cook until heated through 3 - 5 minutes. Season with additional salt as desired. Separate iceberg lettuce leaves and serve with chicken filling.', 502, 8, 'slow cooker', '6', 180, 15, 11, 'https://www.cookingclassy.com/wp-content/uploads/2015/02/slow-cooker-asian-chicken-lettuce-wraps6-srgb..jpg', 'These Slow Cooker Asian Chicken Lettuce Wraps are so simple to put together and make such a delicious and healthy weeknight dinner.');

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

