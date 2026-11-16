USE `BD_AEROPORTO`;

CREATE USER 'Administrador'@'localhost' IDENTIFIED BY 'SenhaAdmin123';
CREATE USER 'Analista'@'localhost' IDENTIFIED BY 'SenhaAnali123';
CREATE USER 'TCA'@'localhost' IDENTIFIED BY 'SenhaTCA123';

GRANT all ON *.* TO Administrador;
GRANT select ON *.* TO Analista;
GRANT insert, select, update ON Avioes TO TCA;
GRANT insert, select, update ON Portoes TO TCA;

REVOKE insert ON Portoes FROM TCA;
