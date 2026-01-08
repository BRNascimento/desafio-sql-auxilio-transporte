# Desafio Técnico: Sistema de Auxílio Transporte (PostgreSQL)

Este repositório contém a resolução da Prova de Proficiência em Banco de Dados, focada em PostgreSQL 16. O projeto simula um sistema de gerenciamento de solicitações, pagamentos e auditoria de auxílio transporte.

## 🛠️ Tecnologias Utilizadas
* **Banco de Dados:** PostgreSQL 16
* **Ferramenta de Gestão:** pgAdmin 4
* **Linguagem Procedural:** PL/pgSQL

## 📁 Estrutura do Projeto
O projeto está organizado para execução sequencial:

1.  `01_schema.sql`: Criação das tabelas e relacionamentos.
2.  `02_seed.sql`: Inserção de dados fictícios para testes.
3.  `03_questoes.sql`: Resolução das consultas (JOINs, Group By, Window Functions).
4.  `04_programacao.sql`: Implementação do Trigger e da Stored Procedure.

---

## 🚀 Como Executar

### 1. Criar o Banco de Dados
No seu servidor PostgreSQL (via pgAdmin ou psql), crie o banco de dados:
```sql
CREATE DATABASE prova_banco_dados;
