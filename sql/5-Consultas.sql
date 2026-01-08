-- ---------------------------------------------------------------------------
-- QUESTÃO 1 - JOIN e ORDER BY (2,0 pontos)
-- ---------------------------------------------------------------------------
/*
Crie uma consulta que retorne:
- Nome do funcionário
- Matrícula
- Departamento
- Valor solicitado
- Status da solicitação
- Data da solicitação

Requisitos:
- Incluir APENAS solicitações com status 'APROVADO'
- Ordenar por departamento (ordem alfabética) e depois por valor solicitado (do maior para o menor)
- Incluir somente solicitações feitas nos últimos 6 meses
*/
SELECT f.nome, f.matricula, f.departamento, s.valor_solicitado, s.status status_solicitacao, s.data_solicitacao
FROM tbfuncionario f
JOIN tbsolicitacao s ON f.id_funcionario = s.id_funcionario
WHERE s.status = 'APROVADO'
  AND s.data_solicitacao >= CURRENT_DATE - INTERVAL '6 months'
ORDER BY f.departamento ASC, s.valor_solicitado DESC;


-- ---------------------------------------------------------------------------
-- QUESTÃO 2 - GROUP BY e HAVING (2,0 pontos)
-- ---------------------------------------------------------------------------
/*
Crie uma consulta que mostre um relatório mensal de solicitações, contendo:
- Ano e mês da solicitação
- Quantidade total de solicitações
- Valor total solicitado
- Valor médio das solicitações
- Quantidade de solicitações aprovadas

Requisitos:
- Agrupar por ano e mês
- Mostrar APENAS os meses que tiveram mais de 10 solicitações
- Ordenar do mês mais recente para o mais antigo
- Formatar o ano/mês como 'YYYY-MM'
*/
SELECT
	to_char(data_solicitacao, 'YYYY-MM') AS mes_referencia,
    COUNT(*) AS total_solicitacoes,
    SUM(valor_solicitado) AS valor_total,
    ROUND(AVG(valor_solicitado), 2) AS valor_medio,
    COUNT(*) FILTER (WHERE status = 'APROVADO') AS qtd_aprovadas
FROM tbsolicitacao
GROUP BY mes_referencia
HAVING COUNT(*) > 10
ORDER BY mes_referencia DESC;

---------------------------------------------------------------------------
-- QUESTÃO 5 - SUBCONSULTA e WINDOW FUNCTION (2,0 pontos)
-- ---------------------------------------------------------------------------
/*
Crie uma consulta que identifique os funcionários "top gastadores":
- Nome do funcionário
- Departamento
- Total gasto
- Quantidade de solicitações aprovadas
- Ranking dentro do departamento
- Percentual do total do departamento

Requisitos:
- Apenas solicitações APROVADAS com pagamentos
- TOP 3 de cada departamento
- Percentual com 2 casas decimais
*/
WITH metricas_pagamento AS (
    -- Subconsulta (CTE) para consolidar os valores pagos por funcionário
    SELECT 
        f.nome AS funcionario,
        f.departamento,
        SUM(p.valor_pago) AS total_gasto,
        COUNT(s.id_solicitacao) AS qtd_aprovadas,
        -- Window Function: Soma total do departamento para cálculo de percentual
        SUM(SUM(p.valor_pago)) OVER(PARTITION BY f.departamento) as total_depto
    FROM tbfuncionario f
    JOIN tbsolicitacao s ON f.id_funcionario = s.id_funcionario
    JOIN tbpagamento p ON s.id_solicitacao = p.id_solicitacao
    WHERE s.status = 'PAGO'
    GROUP BY f.id_funcionario, f.nome, f.departamento
),
ranking_final AS (
    -- Segunda CTE para calcular o ranking sem "pular" números (DENSE_RANK)
    SELECT 
        funcionario,
        departamento,
        total_gasto,
        qtd_aprovadas,
        DENSE_RANK() OVER(PARTITION BY departamento ORDER BY total_gasto DESC) as ranking,
        total_depto
    FROM metricas_pagamento
)
SELECT 
    funcionario,
    departamento,
    total_gasto,
    qtd_aprovadas,
    ranking,
    -- Cálculo do percentual com 2 casas decimais
    ROUND((total_gasto / total_depto) * 100, 2) || '%' as percentual_departamento
FROM ranking_final
WHERE ranking <= 3
ORDER BY departamento, ranking;