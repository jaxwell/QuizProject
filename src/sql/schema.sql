CREATE TABLE USER (
  `user_id`    BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `email`      VARCHAR(30)  NOT NULL,
  `password`   VARCHAR(100) NOT NULL,
  `first_name` VARCHAR(30)  NOT NULL,
  `last_name`  VARCHAR(30)  NOT NULL,
  `active`     TINYINT(1)   NOT NULL DEFAULT '1',
  `created`    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated`    DATETIME              DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
);

CREATE TABLE ROLE (
  `role_id` BIGINT(20)  NOT NULL AUTO_INCREMENT,
  `type`    VARCHAR(20) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id_UNIQUE` (`role_id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
);

/* JOIN TABLE for MANY-TO-MANY relationship*/
CREATE TABLE USER_ROLE (
  user_id BIGINT NOT NULL,
  role_id BIGINT NOT NULL,
  PRIMARY KEY (user_id, role_id),
  CONSTRAINT FK_USER FOREIGN KEY (user_id) REFERENCES USER (user_id),
  CONSTRAINT FK_ROLE FOREIGN KEY (role_id) REFERENCES ROLE (role_id)
);

/* Create persistent_logins Table used to store rememberme related stuff*/
CREATE TABLE persistent_logins (
  username VARCHAR(64) NOT NULL,
  series    VARCHAR(64) NOT NULL,
  token     VARCHAR(64) NOT NULL,
  last_used TIMESTAMP   NOT NULL,
  PRIMARY KEY (series)
);

CREATE TABLE `test` (
  `test_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tutor_id` bigint(20) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` text,
  `question_time` int(11) DEFAULT '120',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`test_id`),
  UNIQUE KEY `test_id_UNIQUE` (`test_id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  KEY `tutor_id_idx` (`tutor_id`),
  CONSTRAINT `tutor_id` FOREIGN KEY (`tutor_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) DEFAULT CHARSET=utf8;

CREATE TABLE `question` (
  `question_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_id` bigint(20) NOT NULL,
  `question` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `question_id_UNIQUE` (`question_id`),
  KEY `test_id_idx` (`test_id`),
  CONSTRAINT `test_id` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) DEFAULT CHARSET=utf8;

CREATE TABLE `answer` (
  `answer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) NOT NULL,
  `text` text NOT NULL,
  `correct` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `answercol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  UNIQUE KEY `answer_id_UNIQUE` (`answer_id`),
  KEY `question_id_idx` (`question_id`),
  CONSTRAINT `question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) DEFAULT CHARSET=utf8;

CREATE TABLE `result` (
  `result_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `test_id` bigint(20) NOT NULL,
  `result` varchar(45) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`),
  UNIQUE KEY `result_id_UNIQUE` (`result_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `test_id_idx` (`test_id`),
  CONSTRAINT `test_id_fk` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) CHARSET=utf8;