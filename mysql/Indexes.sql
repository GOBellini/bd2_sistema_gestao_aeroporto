CREATE INDEX idx_clientes_cpf
ON Clientes (cpf);

CREATE INDEX idx_pagamentos_cliente_data
ON Pagementos (Clientes_id_cliente, data_pagamento);


CREATE INDEX idx_pagamentos_terceira_data
ON Pagementos (Empresas_Terceirizadas_id_empresa_terceira, data_pagamento);
 
CREATE INDEX idx_estacionamento_piso_setor_status
ON Estacionamento (piso, setor, status);

CREATE INDEX idx_funcionarios_profissao_status
ON Funcionarios (profissao, status);