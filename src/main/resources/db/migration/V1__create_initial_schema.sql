#
# SQL Export
# Created by Querious (1064)
# Created: March 19, 2017 at 9:07:01 PM GMT+4
# Encoding: Unicode (UTF-8)
#


SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `phone_numbers`;
DROP TABLE IF EXISTS `person`;
DROP TABLE IF EXISTS `items`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `customers_phones`;
DROP TABLE IF EXISTS `customers`;
DROP TABLE IF EXISTS `accounts`;


CREATE TABLE `accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `customers_phones` (
  `customers_id` bigint(20) NOT NULL,
  `phone_numbers_id` bigint(20) NOT NULL,
  PRIMARY KEY (`customers_id`,`phone_numbers_id`),
  KEY `FKmsf59h0dvh6595tnngfkdoxi2` (`phone_numbers_id`),
  CONSTRAINT `FKakgk8pmdmgmum180k673xw87l` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKmsf59h0dvh6595tnngfkdoxi2` FOREIGN KEY (`phone_numbers_id`) REFERENCES `phone_numbers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpxtb8awmi0dk6smoh2vp1litg` (`customer_id`),
  CONSTRAINT `FKpxtb8awmi0dk6smoh2vp1litg` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKirjef006njdi706iiqdfkgk9d` (`order_id`),
  KEY `FKmtk37pxnx7d5ck7fkq2xcna4i` (`product_id`),
  CONSTRAINT `FKirjef006njdi706iiqdfkgk9d` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKmtk37pxnx7d5ck7fkq2xcna4i` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `phone_numbers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


LOCK TABLES `accounts` WRITE;
ALTER TABLE `accounts` DISABLE KEYS;
ALTER TABLE `accounts` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `customers` WRITE;
ALTER TABLE `customers` DISABLE KEYS;
ALTER TABLE `customers` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `customers_phones` WRITE;
ALTER TABLE `customers_phones` DISABLE KEYS;
ALTER TABLE `customers_phones` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `orders` WRITE;
ALTER TABLE `orders` DISABLE KEYS;
ALTER TABLE `orders` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `items` WRITE;
ALTER TABLE `items` DISABLE KEYS;
ALTER TABLE `items` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `person` WRITE;
ALTER TABLE `person` DISABLE KEYS;
ALTER TABLE `person` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `phone_numbers` WRITE;
ALTER TABLE `phone_numbers` DISABLE KEYS;
ALTER TABLE `phone_numbers` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `products` WRITE;
ALTER TABLE `products` DISABLE KEYS;
ALTER TABLE `products` ENABLE KEYS;
UNLOCK TABLES;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;
