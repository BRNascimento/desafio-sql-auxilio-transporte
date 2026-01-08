-- Tabela de funcionários
CREATE TABLE tbfuncionario (
    id_funcionario SERIAL PRIMARY KEY,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    data_admissao DATE DEFAULT CURRENT_DATE
);

-- Tabela de solicitações
CREATE TABLE tbsolicitacao (
    id_solicitacao SERIAL PRIMARY KEY,
    id_funcionario INT REFERENCES tbfuncionario(id_funcionario),
    valor_solicitado DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDENTE', -- PENDENTE, APROVADO, PAGO, CANCELADO
    data_solicitacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de pagamentos
CREATE TABLE tbpagamento (
    id_pagamento SERIAL PRIMARY KEY,
    id_solicitacao INT REFERENCES tbsolicitacao(id_solicitacao),
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_pago DECIMAL(10,2) NOT NULL
);

-- Tabela de log de auditoria
CREATE TABLE tblogauditoria (
    id_log SERIAL PRIMARY KEY,
    operacao VARCHAR(100),
    detalhes TEXT,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);