/*All User's gets stored in APP_USER table*/

CREATE TABLE USER (
  `user_id`    BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `email`      VARCHAR(30)  NOT NULL,
  `password`   VARCHAR(100) NOT NULL,
  `first_name` VARCHAR(30)  NOT NULL,
  `last_name`  VARCHAR(30)  NOT NULL,
  `active`     TINYINT(1)   NOT NULL DEFAULT '0',
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

/* Populate ROLE Table */
INSERT INTO ROLE (type)
VALUES ('ADMIN');
INSERT INTO ROLE (type)
VALUES ('ADVANCED_TUTOR');
INSERT INTO ROLE (type)
VALUES ('TUTOR');
INSERT INTO ROLE (type)
VALUES ('STUDENT');

/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO USER (email, password, first_name, last_name, active)
VALUES ('ievgen.bykov@gmail.com', '$2a$10$doPCU9lCJ2Q7w6FyfEM6TOcyL.5ovrhO3BFQzdIpvkaaaHV4zlYzC', 'Ievgen', 'Bykov', 1);

/* Populate JOIN Table */
INSERT INTO USER_ROLE (user_id, role_id)
  SELECT
    user.user_id,
    ROLE.role_id
  FROM user user, role role
  WHERE user.email = 'ievgen.bykov@gmail.com' AND role.type = 'ADMIN';

