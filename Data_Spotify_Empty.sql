USE spotify;

CREATE TABLE `Track` (
  `Track_ID` INT,
  `Track_name` VARCHAR (255),
  `Popularity` INT,
  `Energy` INT,
  `Length` INT,
  `Genre_ID` INT,
  PRIMARY KEY (`Track_ID`)
);

CREATE TABLE `Artists_to_Genre` (
  `id` INT,
  `Artist_ID` INT,
  `Genre_ID` INT,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Genre` (
  `Genre_ID` INT,
  `Genre_name` VARCHAR(255),
  PRIMARY KEY (`Genre_ID`)
);

CREATE TABLE `Traks_to_artists` (
  `id` INT,
  `Artist_ID` INT,
  `Track_ID` INT,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Artists` (
  `Artist_ID` INT,
  `Artist_name` VARCHAR(255),
  PRIMARY KEY (`Artist_ID`)
);