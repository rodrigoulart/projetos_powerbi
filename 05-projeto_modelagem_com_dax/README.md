# Projeto 05 – Dashboard de E-commerce com Power BI utilizando Star Schema

## Descrição
Projeto de modelagem dimensional utilizando a tabela **Financial Sample**, criação de **Star Schema** e análise de vendas, produtos, descontos e clientes.
Tudo executado diretamente no Power BI Desktop, com auxílio das ferramenta Power Query e DAX.

## Etapas do Projeto

1. **Criação da tabela de origem**
- `Financials_origem` (backup da tabela original).

2. **Criação das tabelas dimensionais**
- `D_Produtos`  
- `D_Produtos_Detalhes`  
- `D_Descontos`  
- `D_Detalhes`  
- `D_Data` (criada no Power BI com DAX `CALENDAR()`).

3. **Criação da tabela fato**
- `F_Vendas` com chaves para todas as dimensões.
  
4. **Aplicação de chaves e constraints**
- Chaves primárias e estrangeiras definidas.  
- Todos os relacionamentos 1:N (dimensão → fato).

## Observações
- O foco do projeto é a análise de vendas, produtos, clientes e descontos.  
- O modelo segue o Star Schema, facilitando análises e dashboards interativos.  

## Arquivos
- `modelagem_star_schema_com_dax.pbix` – Arquivo do Power BI com todas as tabelas carregadas, incluindo o modelo Star Schema pronto.  
- `star_schema_powerbi.PNG` – Diagrama do modelo Star Schema.  
