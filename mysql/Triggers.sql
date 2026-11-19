DELIMITER $$
CREATE TRIGGER tgr_verificar_aviao_em_outro_portao_insert
BEFORE INSERT ON Portoes
FOR EACH ROW
BEGIN
    DECLARE v_total INT DEFAULT 0;
    IF NEW.Avioes_id_aviao IS NOT NULL THEN
        SELECT COUNT(*) INTO v_total
        FROM Portoes
        WHERE Avioes_id_aviao = NEW.Avioes_id_aviao;
        IF v_total > 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Erro: este avião já está associado a outro portão.';
        END IF;
    END IF;
END$$
 
CREATE TRIGGER tgr_verificar_aviao_em_outro_portao_update
BEFORE UPDATE ON Portoes
FOR EACH ROW
BEGIN
    DECLARE v_total INT DEFAULT 0;
    IF NEW.Avioes_id_aviao IS NOT NULL THEN
        SELECT COUNT(*) INTO v_total
        FROM Portoes
        WHERE Avioes_id_aviao = NEW.Avioes_id_aviao
          AND id_portao <> OLD.id_portao;
        IF v_total > 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Erro: este avião já está associado a outro portão.';
        END IF;
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER tgr_validar_data_pagamento
BEFORE INSERT ON Pagementos
FOR EACH ROW
BEGIN
    IF NEW.data_pagamento > CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: a data do pagamento não pode estar no futuro.';
    END IF;
END$$
 
CREATE TRIGGER tgr_validar_data_pagamento_update
BEFORE UPDATE ON Pagementos
FOR EACH ROW
BEGIN
    IF NEW.data_pagamento > CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: a data do pagamento não pode estar no futuro.';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER tgr_registrar_entrada_estacionamento
BEFORE INSERT ON Estacionamento
FOR EACH ROW
BEGIN
    -- Define o status numérico inicial como ocupado.
    SET NEW.status = 1;
END$$
DELIMITER ;