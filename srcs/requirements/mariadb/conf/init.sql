CREATE DATABASE wordpress;
CREATE USER wordpress@wordpress.mynet IDENTIFIED BY 'qwerty';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@wordpress;
FLUSH PRIVILEGES;
