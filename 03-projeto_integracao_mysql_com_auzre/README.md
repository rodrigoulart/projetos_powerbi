# Projeto 03 – Integração MySQL Azure e Transformação com Power BI

## Descrição

Projeto de integração de dados com MySQL na Azure, transformações no Power BI e análise de colaboradores, departamentos e projetos.

## Etapas do Projeto

1. **Criação da instância MySQL na Azure**  
   - Servidor configurado e firewall liberado.

2. **Banco de dados e tabelas**  
   - Criação das tabelas: `employee`, `departament`, `dept_locations`, `project`, `works_on`, `dependent`.  
   - Aplicação de chaves primárias, estrangeiras, check constraints e default values.

3. **Integração com Power BI**  
   - Importação das seis tabelas via Power BI Desktop.  
   - Conferência de tipos de dados.

4. **Transformações no Power Query**

| Etapa | Ação no Power Query | SQL Equivalente |
|-------|------------------|----------------|
| Ajuste de tipos | Colunas monetárias (`Salary`) convertidas para Decimal Number | `ALTER TABLE employee MODIFY Salary DOUBLE;` |
| Tratamento de nulos | `Super_ssn` nulo indica gerente; preencher departamentos sem gerente | `SELECT Fname,Lname,Dno FROM employee WHERE Super_ssn IS NULL;` |
| Separar colunas complexas | Coluna `Address` dividida em Rua, Cidade e Estado | `SELECT SUBSTRING_INDEX(Address,'-',1) AS Rua,...` |
| Mesclar Employee + Departament | Left Join para manter todos funcionários | `SELECT e.*, d.Dname FROM employee e LEFT JOIN departament d ON e.Dno=d.Dnumber;` |
| Mesclar Employee + Gerente | Criação da coluna com nome e sobrenome do gerente | `SELECT e.Fname, e.Lname, m.Fname AS ManagerFname FROM employee e LEFT JOIN employee m ON e.Super_ssn=m.Ssn;` |
| Mesclar Nome e Sobrenome | Criação da coluna `ManagerName` | - |
| Mesclar Departamento + Localização | Para ter chaves únicas departamento-local | `SELECT Dname,Dlocation FROM departament d LEFT JOIN dept_locations l ON d.Dnumber=l.Dnumber;` |
| Contagem de colaboradores por gerente | Agrupar → Contar Linhas | `SELECT Super_ssn, COUNT(*) AS qtd_colaboradores FROM employee GROUP BY Super_ssn;` |
| Limpeza final | Remoção de colunas desnecessárias | - |

### Explicação da pergunta 14

> Por que podemos apenas utilizar o **mesclar** e não o **atribuir**, no Power BI/Power Query?

No Power BI/Power Query, o **mesclar consultas** cria uma **junção entre tabelas** sem alterar os dados originais da tabela base. Isso é ideal quando queremos:
- Incluir informações complementares (ex: nome do departamento ou gerente) sem sobrescrever a tabela `employee`.  
- Garantir que a tabela base (`employee`) mantenha todas as linhas, evitando perdas ou duplicações.  

O **atribuir** (ou “append”) não é adequado aqui porque ele **concatena linhas de outra tabela**, o que não é o objetivo; queremos **enriquecer cada funcionário com informações adicionais**, mantendo cada registro intacto.

## Observações

- Power Query é usado para transformação, limpeza, criação de colunas derivadas e mesclas.  
- SQL é usado para pré-processamento, contagem e validação de dados.

## Arquivos

- `desafio_de_projeto_instrucoes.docx`- Intruções do desafio proposto
- `etl_sql_com_azure.pbix` - Relatório do Power Bi, com aplicação de ETL e modificações propostas no desafio
- `insercao_de_dados_orinal.sql` - script sql, para inserção de dados, fornecido pela [Tech education Specialist no Github](https://github.com/julianazanelatto/power_bi_analyst)
- `script_bd_original.sql` - script sql, para criação da base de dados, fornecido pela [Tech education Specialist no Github](https://github.com/julianazanelatto/power_bi_analyst)


