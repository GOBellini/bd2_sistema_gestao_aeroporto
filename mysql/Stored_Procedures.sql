use `BD_AEROPORTO`;

DELIMITER $$
 
CREATE PROCEDURE sp_listar_funcionarios_empresa(
    IN p_id_empresa_terceira INT
)
BEGIN
    SELECT
        f.id_funcionario, f.nome, f.profissao, f.email,
        f.telefone, f.salario, f.status,
        e.nome AS empresa_terceirizada
    FROM Funcionarios AS f
    INNER JOIN Empresas_Terceirizadas AS e
        ON e.id_empresa_terceira =
           f.Empresas_Terceirizadas_id_empresa_terceira
    WHERE e.id_empresa_terceira = p_id_empresa_terceira
    ORDER BY f.nome;
END$$
 
DELIMITER ;
 
DELIMITER $$
 
CREATE PROCEDURE sp_resumo_estacionamento()
BEGIN
    SELECT piso, setor, status,
           COUNT(*) AS quantidade_vagas
    FROM Estacionamento
    GROUP BY piso, setor, status
    ORDER BY piso, setor, status;
END$$
 
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_consultar_pagamentos_cliente(
    IN p_id_cliente INT
)
BEGIN
    SELECT id_pagamento, valor_total, tipo_pagamento,
           data_pagamento, motivo_pagamento
    FROM Pagamentos
    WHERE Clientes_id_cliente = p_id_cliente
    ORDER BY data_pagamento DESC, id_pagamento DESC;
END$$
 
DELIMITER ;
