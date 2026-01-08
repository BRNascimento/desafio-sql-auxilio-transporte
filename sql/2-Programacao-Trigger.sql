-- ---------------------------------------------------------------------------
-- QUESTÃO 3 - TRIGGER (2,0 pontos)
-- ---------------------------------------------------------------------------
/*
Crie um TRIGGER que:
- Seja acionado APÓS a inserção de um novo registro na tabela pagamentos
- Atualize automaticamente o status da solicitação correspondente para 'PAGO'
- Registre na tabela log_auditoria as informações da operação
*/

CREATE OR REPLACE FUNCTION fn_atualizar_status_pagamento()
RETURNS TRIGGER AS $$
BEGIN
    -- Atualizar status da solicitação correspondente para 'PAGO'
    UPDATE tbsolicitacao
    SET status = 'PAGO'
    WHERE id_solicitacao = NEW.id_solicitacao;

    -- Registrar em tblogauditoria as informações da operação
    INSERT INTO tblogauditoria (operacao, detalhes)
    VALUES (
        'PAGAMENTO PROCESSADO', 
        'Solicitação ID ' || NEW.id_solicitacao || ' paga em ' || TO_CHAR(NEW.data_pagamento, 'DD/MM/YYYY HH24:MI') || 
        '. Valor: R$ ' || NEW.valor_pago
    );

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criação do Trigger vinculando a função à tabela pagamentos
-- Deve ser acionado APÓS (AFTER) a inserção (INSERT)
CREATE TRIGGER trg_pos_pagamento
AFTER INSERT ON tbpagamento
FOR EACH ROW
EXECUTE FUNCTION fn_atualizar_status_pagamento();

