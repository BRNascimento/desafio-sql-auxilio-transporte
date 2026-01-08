-- ---------------------------------------------------------------------------
-- QUESTÃO 4 - STORED PROCEDURE
-- ---------------------------------------------------------------------------
/*
Crie uma STORED PROCEDURE chamada sp_cancelar_solicitacao que:
- Receba ID da solicitação e motivo
- Verifique se pode cancelar (não pode se já foi PAGO)
- Atualize o status para CANCELADO
- Registre no log
- Retorne mensagem de sucesso ou erro
*/

CREATE OR REPLACE PROCEDURE sp_cancelar_solicitacao(
    p_id_solicitacao INT, 
    p_motivo TEXT,
    OUT p_mensagem TEXT  -- Parâmetro para retornar o sucesso ou erro
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_status_solicitacao VARCHAR(20);
BEGIN
    -- Buscar status atual da solicitação
    SELECT status INTO v_status_solicitacao 
    FROM tbsolicitacao
    WHERE id_solicitacao = p_id_solicitacao;

    -- Confere se a solicitação existe
    IF v_status_solicitacao IS NULL THEN
        p_mensagem := 'ERRO: Solicitação não encontrada.';
        RETURN;
    END IF;

    -- Verificar regra de negócio (Não pode se já foi PAGO)
    IF v_status_solicitacao = 'PAGO' THEN
        p_mensagem := 'ERRO: Não é possível cancelar uma solicitação que já foi PAGA.';
    ELSE
		-- Se não está pago...
        -- Atualizar status para CANCELADO
        UPDATE tbsolicitacao
        SET status = 'CANCELADO' 
        WHERE id_solicitacao = p_id_solicitacao;

        -- Registrar no log
        INSERT INTO tblogauditoria (operacao, detalhes)
        VALUES ('CANCELAMENTO', 'ID: ' || p_id_solicitacao || '. Motivo: ' || p_motivo);
        
        -- Definir mensagem de sucesso
        p_mensagem := 'SUCESSO: Solicitação ' || p_id_solicitacao || ' cancelada com êxito.';
    END IF;

EXCEPTION -- ou mensagem de exceção
    WHEN OTHERS THEN
        p_mensagem := 'ERRO INESPERADO: ' || SQLERRM;
END;
$$;