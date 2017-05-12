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
