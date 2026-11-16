USE `dados`;

CREATE TABLE `Contatos` (
  `id_contato` int(11) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `url` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_contato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `Clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefone` varchar(15) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `Empresas_Aereas` (
  `id_empresa_aerea` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `id_contato` int(11) NOT NULL,
  PRIMARY KEY (`id_empresa_aerea`),
  UNIQUE KEY `Empresas_Aereas_UNIQUE` (`id_contato`),
  CONSTRAINT `Empresas_Aereas_Contatos_FK`
    FOREIGN KEY (`id_contato`)
    REFERENCES `Contatos` (`id_contato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `Empresas_Terceirizadas` (
  `id_empresa_terceira` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(45) NOT NULL,
  `lado_aeroporto` varchar(45) NOT NULL,
  `espaco` varchar(45) DEFAULT NULL,
  `id_contato` int(11) NOT NULL,
  PRIMARY KEY (`id_empresa_terceira`),
  UNIQUE KEY `Empresas_Terceirizadas_UNIQUE` (`id_contato`),
  CONSTRAINT `Empresas_Terceirizadas_Contatos_FK`
    FOREIGN KEY (`id_contato`)
    REFERENCES `Contatos` (`id_contato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Funcionarios` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefone` varchar(15) NOT NULL,
  `profissao` varchar(45) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `Empresas_Terceirizadas_id_empresa_terceira` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `Funcionarios_Empresas_Terceirizadas_FK`
    (`Empresas_Terceirizadas_id_empresa_terceira`),
  CONSTRAINT `Funcionarios_Empresas_Terceirizadas_FK`
    FOREIGN KEY (`Empresas_Terceirizadas_id_empresa_terceira`)
    REFERENCES `Empresas_Terceirizadas` (`id_empresa_terceira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `Avioes` (
  `id_aviao` int(11) NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `status_atual` varchar(45) NOT NULL,
  `estacionado_em` varchar(45) NOT NULL,
  `Empresas_Aereas_id_empresa_aerea` int(11) NOT NULL,
  PRIMARY KEY (`id_aviao`),
  KEY `Avioes_Empresas_Aereas_FK`
    (`Empresas_Aereas_id_empresa_aerea`),
  CONSTRAINT `Avioes_Empresas_Aereas_FK`
    FOREIGN KEY (`Empresas_Aereas_id_empresa_aerea`)
    REFERENCES `Empresas_Aereas` (`id_empresa_aerea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `Estacionamento` (
  `id_vaga` int(11) NOT NULL AUTO_INCREMENT,
  `piso` int(11) NOT NULL,
  `setor` char(1) NOT NULL,
  `status` decimal(1,0) NOT NULL,
  `Funcionarios_id_funcionario` int(11) DEFAULT NULL,
  `Clientes_id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_vaga`),
  KEY `Estacionamento_Clientes_FK` (`Clientes_id_cliente`),
  KEY `Estacionamento_Funcionarios_FK` (`Funcionarios_id_funcionario`),
  CONSTRAINT `Estacionamento_Clientes_FK`
    FOREIGN KEY (`Clientes_id_cliente`)
    REFERENCES `Clientes` (`id_cliente`),
  CONSTRAINT `Estacionamento_Funcionarios_FK`
    FOREIGN KEY (`Funcionarios_id_funcionario`)
    REFERENCES `Funcionarios` (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Pagementos` (
  `id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `valor_total` decimal(12,2) NOT NULL,
  `tipo_pagamento` varchar(45) NOT NULL,
  `data_pagamento` date NOT NULL,
  `motivo_pagamento` varchar(45) NOT NULL,
  `Clientes_id_cliente` int(11) DEFAULT NULL,
  `Empresas_Terceirizadas_id_empresa_terceira` int(11) DEFAULT NULL,
  `Empresas_Aereas_id_empresa_aerea` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `Pagementos_Clientes_FK` (`Clientes_id_cliente`),
  KEY `Pagementos_Empresas_Terceirizadas_FK`
    (`Empresas_Terceirizadas_id_empresa_terceira`),
  KEY `Pagementos_Empresas_Aereas_FK`
    (`Empresas_Aereas_id_empresa_aerea`),
  CONSTRAINT `Pagementos_Clientes_FK`
    FOREIGN KEY (`Clientes_id_cliente`)
    REFERENCES `Clientes` (`id_cliente`),
  CONSTRAINT `Pagementos_Empresas_Terceirizadas_FK`
    FOREIGN KEY (`Empresas_Terceirizadas_id_empresa_terceira`)
    REFERENCES `Empresas_Terceirizadas` (`id_empresa_terceira`),
  CONSTRAINT `Pagementos_Empresas_Aereas_FK`
    FOREIGN KEY (`Empresas_Aereas_id_empresa_aerea`)
    REFERENCES `Empresas_Aereas` (`id_empresa_aerea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Portoes` (
  `id_portao` int(11) NOT NULL AUTO_INCREMENT,
  `status_atual` varchar(45) NOT NULL,
  `Avioes_id_aviao` int(11) DEFAULT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_portao`),
  KEY `Portoes_Avioes_FK` (`Avioes_id_aviao`),
  CONSTRAINT `Portoes_Avioes_FK`
    FOREIGN KEY (`Avioes_id_aviao`)
    REFERENCES `Avioes` (`id_aviao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
