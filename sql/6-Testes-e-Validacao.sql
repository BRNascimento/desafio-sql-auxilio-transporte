-- ============================================================================
-- 4. TESTES E VALIDAÇÕES
-- ============================================================================
Faça alguns testes abaixo, podendo criar cenários e inserts aleatórios, conforme orientação.

-- Teste da Procedure (PostgreSQL usa SELECT em vez de CALL)

	-- Teste de Sucesso (em uma solicitação PENDENTE ou APROVADA)
	DO $$
	DECLARE 
		v_resultado TEXT;
	BEGIN
		CALL sp_cancelar_solicitacao(2, 'Solicitação feita por engano', v_resultado);
		RAISE NOTICE '%', v_resultado; -- Isso imprimirá a mensagem na aba "Messages" do pgAdmin
	END $$;
	
	-- Transformar em Função
	CREATE OR REPLACE FUNCTION fn_cancelar_solicitacao(
    p_id INT,
    p_motivo TEXT
	)
	RETURNS TEXT
	LANGUAGE plpgsql
	AS $$
	DECLARE
		v_resultado TEXT;
	BEGIN
		-- lógica da procedure aqui
		v_resultado := 'Solicitação cancelada com sucesso';

		RETURN v_resultado;
	END;
	$$;
		
	-- Executar
	SELECT fn_cancelar_solicitacao(2, 'Solicitação feita por engano');



-- Verificar trigger (inserir novo pagamento)

	INSERT INTO public.tbpagamento(id_solicitacao, data_pagamento, valor_pago)
	VALUES (4,  DATE_TRUNC('second', NOW()), 21.51);

-- Verificar se o status foi atualizado

	SELECT id_solicitacao, id_funcionario, valor_solicitado, status, data_solicitacao
	FROM public.tbsolicitacao;

-- Verificar log de auditoria

	SELECT id_log, operacao, detalhes, data_hora
	FROM public.tblogauditoria;
