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

## 🚀 Como Executar

Para reproduzir este projeto localmente, siga os passos abaixo utilizando o **pgAdmin 4** ou o terminal **psql**.

### 1. Criar o Banco de Dados
Primeiro, crie a base de dados onde as tabelas serão instaladas:

```sql
CREATE DATABASE prova_banco_dados;


2. Execução dos Scripts (Ordem Obrigatória)
Os arquivos devem ser executados na sequência numérica definida para garantir a integridade dos relacionamentos e automações:

1-Criacao-Tabelas.sql: Criação das tabelas e relacionamentos.

2-Programacao-Trigger.sql: Instala a lógica de auditoria (deve rodar antes da inserção de dados).

3-Programacao-Proc.sql: Cria a Stored Procedure de cancelamento.

4-Insercao-Dados.sql: Popula o banco com dados de teste.

5-Consultas.sql: Executa as queries de análise e ranking.

6-Testes-e-Validacao.sql: Scripts para validar o funcionamento da procedure e logs.

💡 Dicas de Execução no pgAdmin 4
Abra o Query Tool no banco prova_banco_dados.

Use Ctrl + O para abrir os arquivos ou copie e cole o conteúdo.

Pressione F5 para executar cada script.
