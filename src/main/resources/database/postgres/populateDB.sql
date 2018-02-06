INSERT INTO rh.role (id, name) VALUES (1, 'administrator');
INSERT INTO rh.role (id, name) VALUES (2, 'cook');
INSERT INTO rh.role (id, name) VALUES (3, 'waiter');
INSERT INTO rh.role (id, name) VALUES (4, 'user');


INSERT INTO rh.category (id, name) VALUES (1, 'soups');
INSERT INTO rh.category (id, name) VALUES (2, 'meals');
INSERT INTO rh.category (id, name) VALUES (3, 'drinks');
INSERT INTO rh.category (id, name) VALUES (4, 'deserts');


INSERT INTO rh.status (id, name) VALUES (1, 'preparing');
INSERT INTO rh.status (id, name) VALUES (2, 'cooking');
INSERT INTO rh.status (id, name) VALUES (3, 'delivery');


INSERT INTO rh."user"(id, "email", login, password, "role_id") VALUES (1, 'feed@ukr.net', 'beefoot', 'asegfa254', 1);
INSERT INTO rh."user"(id, "email", login, password, "role_id") VALUES (2, 'newest@ukr.net', 'misterpister', '147qwerty', 2);
INSERT INTO rh."user"(id, "email", login, password, "role_id") VALUES (3, 'albinos@gmail.com', 'bigbro', '123456a', 3);
INSERT INTO rh."user"(id, "email", login, password, "role_id") VALUES (4, 'header@i.ua', 'campid', '15962be23', 4);
INSERT INTO rh."user"(id, "email", login, password, "role_id") VALUES (5, 'news@ukr.net', 'reporter', 'qwertrty', 4);
INSERT INTO rh."user"(id, "email", login, password, "role_id") VALUES (6, 'intuit@i.ua', 'ititit', 'mkoijnb', 4);


INSERT INTO rh."order"(id, "time", table_number, close, "user_id") VALUES (1, 'NOW()', 1, FALSE, '4');
INSERT INTO rh."order"(id, "time", table_number, close, "user_id") VALUES (2, 'NOW()', 1, FALSE, '4');
INSERT INTO rh."order"(id, "time", table_number, close, "user_id") VALUES (3, 'NOW()', 1, FALSE, '4');
INSERT INTO rh."order"(id, "time", table_number, close, "user_id") VALUES (4, 'NOW()', 1, FALSE, '4');
INSERT INTO rh."order"(id, "time", table_number, close, "user_id") VALUES (5, 'NOW()', 1, FALSE, '4');