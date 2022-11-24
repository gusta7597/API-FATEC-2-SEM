DROP DATABASE IF EXISTS apiTrackCash;
CREATE DATABASE apiTrackCash DEFAULT CHARACTER SET UTF8MB4 DEFAULT COLLATE UTF8MB4_UNICODE_CI;
USE apiTrackCash;

CREATE TABLE `defaultChannels` (
    `channel_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `type` ENUM('Marketplace', 'Plataforma/ERP', 'Meio de Pagamento') NOT NULL,
    `auth` ENUM('TOKEN', 'LOGIN') NOT NULL,
    PRIMARY KEY (`channel_id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

INSERT INTO defaultChannels (`name`, `type`, `auth`) VALUES ('Mercado Livre', 'Marketplace', 'TOKEN'),
                                                            ('Lojas Americanas', 'Marketplace', 'LOGIN'),
                                                            ('Hub2b', 'Plataforma/ERP', 'TOKEN'),
                                                            ('Amazon', 'Marketplace', 'TOKEN'),
                                                            ('B2w', 'Marketplace', 'LOGIN'),
                                                            ('Dafiti', 'Marketplace', 'LOGIN'),
                                                            ('GetNet', 'Meio de Pagamento', 'TOKEN'),
                                                            ('Carrefour', 'Marketplace', 'TOKEN'),
                                                            ('Bling', 'Plataforma/ERP', 'LOGIN'),
                                                            ('Magazine Luiza', 'Marketplace', 'LOGIN');

CREATE TABLE `users` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) CHARACTER SET UTF8MB4 COLLATE UTF8MB4_0900_AI_CI NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `document` VARCHAR(255) NOT NULL,
    `type_adm` ENUM('0', '1') DEFAULT '0' NOT NULL,
    PRIMARY KEY (`user_id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

INSERT INTO users (email, password, phone, name, document, type_adm) VALUES ('usuario01@gmail.com', 'usuario01p', '00 12345-6789', 'Usuário 01', '123.456.789-00', DEFAULT),
                                                                            ('usuario02@gmail.com', 'usuario02p', '00 12345-6789', 'Usuário 02', '123.456.789-00', DEFAULT),
                                                                            ('usuario03@gmail.com', 'usuario03p', '00 12345-6789', 'Usuário 03', '123.456.789-00', DEFAULT),
                                                                            ('admin', 'admin', 'admin', 'admin', 'admin', '1');

CREATE TABLE `registeredChannelLogin` (
    `registeredChannelLogin_id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `channel_id` INT NOT NULL,
    `login` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`registeredChannelLogin_id`),
    KEY `fk_channel_user` (`user_id`),
    KEY `fk_registeredChannelLogin_channel` (`channel_id`),
    CONSTRAINT `fk_registeredChannelLogin_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
    CONSTRAINT `fk_registeredChannelLogin_channel` FOREIGN KEY (`channel_id`) REFERENCES `defaultChannels` (`channel_id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

INSERT INTO registeredChannelLogin (user_id, channel_id, login, password) VALUES ('1', '2', 'login11', 'senha11'),
																				 ('1', '5', 'login12', 'senha12'),
                                                                                 ('1', '6', 'login13', 'senha13'),
                                                                                 ('1', '9', 'login14', 'senha14'),
                                                                                 ('1', '10', 'login15', 'senha15'),
                                                                                 ('2', '2', 'login11', 'senha11'),
																				 ('2', '5', 'login12', 'senha12'),
                                                                                 ('2', '6', 'login13', 'senha13'),
                                                                                 ('2', '9', 'login14', 'senha14'),
                                                                                 ('2', '10', 'login15', 'senha15'),
                                                                                 ('3', '2', 'login11', 'senha11'),
																				 ('3', '5', 'login12', 'senha12'),
                                                                                 ('3', '6', 'login13', 'senha13'),
                                                                                 ('3', '9', 'login14', 'senha14'),
                                                                                 ('3', '10', 'login15', 'senha15'),
                                                                                 ('1', '2', 'login11', 'senha11'),
                                                                                 ('1', '5', 'login12', 'senha12'),
                                                                                 ('1', '6', 'login13', 'senha13'),
                                                                                 ('1', '9', 'login14', 'senha14'),
                                                                                 ('1', '10', 'login15', 'senha15'),
                                                                                 ('2', '2', 'login11', 'senha11'),
                                                                                 ('2', '5', 'login12', 'senha12'),
                                                                                 ('2', '6', 'login13', 'senha13'),
                                                                                 ('2', '9', 'login14', 'senha14'),
                                                                                 ('2', '10', 'login15', 'senha15'),
                                                                                 ('3', '2', 'login11', 'senha11'),
                                                                                 ('3', '5', 'login12', 'senha12'),
                                                                                 ('3', '6', 'login13', 'senha13'),
                                                                                 ('3', '9', 'login14', 'senha14'),
                                                                                 ('3', '10', 'login15', 'senha15'),
                                                                                 ('1', '2', 'login11', 'senha11'),
                                                                                 ('1', '5', 'login12', 'senha12'),
                                                                                 ('1', '6', 'login13', 'senha13'),
                                                                                 ('1', '9', 'login14', 'senha14'),
                                                                                 ('1', '10', 'login15', 'senha15'),
                                                                                 ('2', '2', 'login11', 'senha11'),
                                                                                 ('2', '5', 'login12', 'senha12'),
                                                                                 ('2', '6', 'login13', 'senha13'),
                                                                                 ('2', '9', 'login14', 'senha14'),
                                                                                 ('2', '10', 'login15', 'senha15'),
                                                                                 ('3', '2', 'login11', 'senha11'),
                                                                                 ('3', '5', 'login12', 'senha12'),
                                                                                 ('3', '6', 'login13', 'senha13'),
                                                                                 ('3', '9', 'login14', 'senha14'),
                                                                                 ('3', '10', 'login15', 'senha15');

CREATE TABLE `registeredChannelToken` (
    `registeredChannelToken_id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `channel_id` INT NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`registeredChannelToken_id`),
    KEY `fk_channel_user` (`user_id`),
    KEY `fk_registeredChannelToken_channel` (`channel_id`),
    CONSTRAINT `fk_registeredChannelToke_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
    CONSTRAINT `fk_registeredChannelToken_channel` FOREIGN KEY (`channel_id`) REFERENCES `defaultChannels` (`channel_id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

INSERT INTO registeredChannelToken (user_id, channel_id, token) VALUES (1, 1, 'DSAH783!*&@t#@&dh'),
                                                                       (1, 3, 'JDSA923(#@nc@(092'),
                                                                       (1, 4, 'AJS*(D#@(32jd98@#'),
                                                                       (1, 7, 'JDSA923(#@nc@(092'),
                                                                       (1, 8, 'AJS*(D#@(32jd98@#'),
                                                                       (2, 1, 'DSAH783!*&@t#@&dh'),
                                                                       (2, 3, 'JDSA923(#@nc@(092'),
                                                                       (2, 4, 'AJS*(D#@(32jd98@#'),
                                                                       (2, 7, 'JDSA923(#@nc@(092'),
                                                                       (2, 8, 'AJS*(D#@(32jd98@#'),
                                                                       (3, 1, 'DSAH783!*&@t#@&dh'),
                                                                       (3, 3, 'JDSA923(#@nc@(092'),
                                                                       (3, 4, 'AJS*(D#@(32jd98@#'),
                                                                       (3, 7, 'JDSA923(#@nc@(092'),
                                                                       (3, 8, 'AJS*(D#@(32jd98@#'),
                                                                       (1, 1, 'DSAH783!*&@t#@&dh'),
                                                                       (1, 3, 'JDSA923(#@nc@(092'),
                                                                       (1, 4, 'AJS*(D#@(32jd98@#'),
                                                                       (1, 7, 'JDSA923(#@nc@(092'),
                                                                       (1, 8, 'AJS*(D#@(32jd98@#'),
                                                                       (2, 1, 'DSAH783!*&@t#@&dh'),
                                                                       (2, 3, 'JDSA923(#@nc@(092'),
                                                                       (2, 4, 'AJS*(D#@(32jd98@#'),
                                                                       (2, 7, 'JDSA923(#@nc@(092'),
                                                                       (2, 8, 'AJS*(D#@(32jd98@#'),
                                                                       (3, 1, 'DSAH783!*&@t#@&dh'),
                                                                       (3, 3, 'JDSA923(#@nc@(092'),
                                                                       (3, 4, 'AJS*(D#@(32jd98@#'),
                                                                       (3, 7, 'JDSA923(#@nc@(092'),
                                                                       (3, 8, 'AJS*(D#@(32jd98@#'),
                                                                       (1, 1, 'DSAH783!*&@t#@&dh'),
                                                                       (1, 3, 'JDSA923(#@nc@(092'),
                                                                       (1, 4, 'AJS*(D#@(32jd98@#'),
                                                                       (1, 7, 'JDSA923(#@nc@(092'),
                                                                       (1, 8, 'AJS*(D#@(32jd98@#'),
                                                                       (2, 1, 'DSAH783!*&@t#@&dh'),
                                                                       (2, 3, 'JDSA923(#@nc@(092'),
                                                                       (2, 4, 'AJS*(D#@(32jd98@#'),
                                                                       (2, 7, 'JDSA923(#@nc@(092'),
                                                                       (2, 8, 'AJS*(D#@(32jd98@#'),
                                                                       (3, 1, 'DSAH783!*&@t#@&dh'),
                                                                       (3, 3, 'JDSA923(#@nc@(092'),
                                                                       (3, 4, 'AJS*(D#@(32jd98@#'),
                                                                       (3, 7, 'JDSA923(#@nc@(092'),
                                                                       (3, 8, 'AJS*(D#@(32jd98@#');