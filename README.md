# Desafio Técnico: Sistema de Auxílio Transporte (PostgreSQL)

Este repositório contém a resolução da Prova de Proficiência em Banco de Dados, focada em PostgreSQL 16. O projeto simula um sistema de gerenciamento de solicitações, pagamentos e auditoria de auxílio transporte.

## 🛠️ Tecnologias Utilizadas
* **Banco de Dados:** PostgreSQL 16
* **Ferramenta de Gestão:** pgAdmin 4
* **Linguagem Procedural:** PL/pgSQL

## 📁 Estrutura do Projeto
O projeto está organizado para execução sequencial:

1.  `1-Criacao-Tabelas.sql`: Criação das tabelas e relacionamentos.
2.  `2-Programacao-Trigger.sql`: Trigger para registro de Log.
3.  `3-Programacao-Proc.sql`: Procedure que atualiza o status para CANCELADO.
4.  `4-Insercao-Dados.sql`: Inserção de dados fictícios para testes.
5.  `5-Consultas.sql`: Resolução das consultas (JOINs, Group By, Window Functions).
6.  `6-Testes-e-Validacao.sql`: Alguns testes, com cenários e inserts aleatórios.

---

🚀 Como Executar
Para reproduzir este projeto localmente, siga os passos abaixo utilizando o pgAdmin 4 ou o terminal psql.

1. Criar o Banco de Dados
Primeiro, crie a base de dados onde as tabelas serão instaladas:

SQL

CREATE DATABASE prova_banco_dados;
2. Execução dos Scripts (Ordem Obrigatória)
Os arquivos devem ser executados na sequência numérica definida para garantir a integridade dos relacionamentos e automações:

1-Criacao-Tabelas.sql: Execute para criar a estrutura de tabelas e chaves estrangeiras.

2-Programacao-Trigger.sql: Execute para instalar a lógica de auditoria. É importante que este script rode antes da inserção de dados para que os logs de pagamentos já sejam registrados.

3-Programacao-Proc.sql: Execute para criar a Stored Procedure de cancelamento.

4-Insercao-Dados.sql: Execute para popular o banco com funcionários, solicitações e pagamentos de teste.

5-Consultas.sql: Execute para visualizar os relatórios de aprovados, métricas mensais e o ranking de gastos.

6-Testes-e-Validacao.sql: Execute para validar o funcionamento da Procedure e conferir os logs gerados automaticamente.

💡 Dicas de Execução no pgAdmin 4
Abra o Query Tool clicando com o botão direito sobre o banco prova_banco_dados.

Para cada arquivo, você pode copiar o código e colar na janela, ou usar o atalho Ctrl + O para abrir o arquivo diretamente.

Pressione F5 para executar.

Por que seguir esta ordem?
Trigger antes do Seed: Ao executar o script 4-Insercao-Dados.sql, o banco já conterá a Trigger ativa. Assim, quando os pagamentos forem inseridos, você poderá verificar imediatamente a tabela log_auditoria preenchida, demonstrando ao recrutador que a automação está funcionando perfeitamente.

Schema antes de tudo: Sem as tabelas (Script 1), nenhum outro comando funcionará, pois todos dependem das referências de colunas e IDs.
