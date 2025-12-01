# Projeto 04 – Dashboard de Vendas com Power BI utilizando Star Schema

## Descrição
Projeto de modelagem dimensional com MySQL, criação de Star Schema, integração com Power BI e análise de professores, cursos e departamentos.

---

## Etapas do Projeto

1. **Criação do banco de dados**  
   - Criação do banco `Universidade`.

2. **Criação das tabelas dimensionais**  
   - `DimProfessor`, `DimDepartamento`, `DimCurso`, `DimDisciplina`, `DimData`.

3. **Criação da tabela fato**  
   - `FatoProfessorOferta` com chaves para todas as dimensões.

4. **Aplicação de chaves e constraints**  
   - Chaves primárias e estrangeiras definidas.  
   - Todas as tabelas criadas com **InnoDB**.

5. **Integração com Power BI**  
   - Importação das tabelas no Power BI Desktop.  
   - Ajuste de tipos de dados e definição dos relacionamentos 1:* (dimensão → fato).

---

## Observações

- O foco do projeto é a análise de **professores, cursos e departamentos**.  
- O modelo segue o **Star Schema**, facilitando análises e criação de dashboards no Power BI.  
- Tabelas dimensionais no lado **1** e tabela fato no lado **\*** do relacionamento.

---

## Arquivos

- `criacao_bd_universidade_star_schema.sql` – Script SQL para criação das tabelas no MySQL.  
- `eer_star_schema.png` – Imagem do diagrama modelo Star Schema, criado no Workbench.  
- `powerbi_star_schema.pbix` – Arquivo do Power Bi, com a base de dados carregada.  
