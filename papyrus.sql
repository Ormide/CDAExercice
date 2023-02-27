CREATE DATABASE papyrus;

USE papyrus;

CREATE TABLE produit (
    `CODART` VARCHAR(4) NOT NULL,
    `LIBART` VARCHAR(30) NOT NULL,
    `STKALE` INT(10) NOT NULL,
    `STKPHY` INT(10) NOT NULL,
    `STEANN` INT(10) NOT NULL,
    `UNIMES` VARCHAR(5) NOT NULL,
    PRIMARY KEY(`CODART`)
);

CREATE TABLE fournis(
    `NUMFOU` VARCHAR(25) NOT NULL,
    `NOMFOU` VARCHAR(25) NOT NULL,
    `RUEFOU` VARCHAR(50) NOT NULL,
    `POSFOU` VARCHAR(5) NOT NULL,
    `VILFOU` VARCHAR(30) NOT NULL,
    `CONFOU` VARCHAR(15) NOT NULL,
    `SATISF` INT(3) CHECK (SATISF BETWEEN 1 AND 10),
    PRIMARY KEY (`NUMFOU`)
);

CREATE TABLE entcom (
    `NUMCOM` INT(10) NOT NULL AUTO_INCREMENT,
    `OBSCOM` VARCHAR(50),
    `DATECOM` DATE,
    `NUMFOU` VARCHAR(25),
    PRIMARY KEY(`NUMCOM`),
    FOREIGN KEY(`NUMFOU`) REFERENCES fournis(`NUMFOU`)
);

CREATE TABLE ligcom(
    `NUMCOM` INT(10) NOT NULL,
    `NUMLIG` INT(3) NOT NULL,
    `CODART` VARCHAR(4) NOT NULL,
    `QTECDE` INT(10) NOT NULL,
    `PRIUNI` VARCHAR(50) NOT NULL,
    `QTELIV` INT(10),
    `DERLIV` DATETIME NOT NULL,
    PRIMARY KEY (`NUMCOM`, `NUMLIG`),
    FOREIGN KEY (`NUMCOM`) REFERENCES entcom(`NUMCOM`),
    FOREIGN KEY (`CODART`) REFERENCES produit(`CODART`)
);

CREATE TABLE vente(
    `CODART` VARCHAR(4) NOT NULL,
    `NUMFOU` VARCHAR(25) NOT NULL,
    `DELLIV` INT(5) NOT NULL,
    `QTE1` INT(10) NOT NULL,
    `PRIX1` VARCHAR(50) NOT NULL,
    `QTE2` INT(10),
    `PRIX2` VARCHAR(50),
    `QTE3` INT(10),
    `PRIX3` VARCHAR(50),
    PRIMARY KEY (`CODART`, `NUMFOU`),
    FOREIGN KEY (`CODART`) REFERENCES produit(`CODART`),
    FOREIGN KEY (`NUMFOU`) REFERENCES fournis(`NUMFOU`)
);

CREATE UNIQUE INDEX `index` ON entcom(`NUMFOU`);