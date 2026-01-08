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

## 🚀 Como Executar

### 1. Criar o Banco de Dados
No seu servidor PostgreSQL (via pgAdmin ou psql), crie o banco de dados:
```sql
CREATE DATABASE prova_banco_dados;
