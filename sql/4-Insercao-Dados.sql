-- Inserção de funcionários (20 registros)
	INSERT INTO tbfuncionario (matricula, nome, departamento)
	VALUES ('MAT01', 'Ana Silva', 'TI'), ('MAT02', 'Bruno Costa', 'TI'), ('MAT03', 'Carla Dias', 'TI'),
	('MAT04', 'Diego Faria', 'RH'), ('MAT05', 'Elena Gomes', 'RH'), ('MAT06', 'Fabio Lima', 'RH'),
	('MAT07', 'Gisele Melo', 'FINANCEIRO'), ('MAT08', 'Helio Nery', 'FINANCEIRO'), ('MAT09', 'Iara Paz', 'FINANCEIRO'),
	('MAT10', 'Joao Rosa', 'VENDAS'), ('MAT11', 'Karen Sa', 'VENDAS'), ('MAT12', 'Luis Teles', 'VENDAS'),
	('MAT13', 'Maria Uzêda', 'TI'), ('MAT14', 'Nuno Vieira', 'RH'), ('MAT15', 'Olivia Ximenes', 'FINANCEIRO'),
	('MAT16', 'Paulo Zappa', 'VENDAS'), ('MAT17', 'Quezia Abreu', 'TI'), ('MAT18', 'Rui Barbosa', 'RH'),
	('MAT19', 'Sara Corte', 'FINANCEIRO'), ('MAT20', 'Talia Duarte', 'VENDAS');

-- Inserção de solicitações (25 registros com datas variadas)
	INSERT INTO tbsolicitacao (id_funcionario, valor_solicitado, status, data_solicitacao) 
	SELECT 
	    (random() * 19 + 1)::int, 
	    (random() * 500 + 100)::decimal(10,2),
	    (ARRAY['PENDENTE', 'APROVADO', 'CANCELADO'])[floor(random() * 3 + 1)],
	    CURRENT_DATE - (floor(random() * 200) || ' days')::interval
	FROM generate_series(1, 25);
	
	-- Garantir que temos solicitações suficientes para o teste do HAVING (Questão 2)
	-- Inserindo mais 12 solicitações no mês atual
	INSERT INTO tbsolicitacao (id_funcionario, valor_solicitado, status, data_solicitacao) 
	SELECT 
	    (random() * 19 + 1)::int, 
	    (random() * 300 + 50)::decimal(10,2),
	    'APROVADO',
	    CURRENT_DATE
	FROM generate_series(1, 12);

-- Inserção de pagamentos (20 registros)
INSERT INTO tbpagamento (id_solicitacao, valor_pago, data_pagamento)
SELECT 
    id_solicitacao, 
    valor_solicitado,
    data_solicitacao + INTERVAL '2 days' -- Pagamento ocorre 2 dias após solicitação
FROM tbsolicitacao
WHERE status = 'APROVADO'
LIMIT 20;