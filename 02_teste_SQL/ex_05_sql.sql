-- Questão 5:

select
    FT.CICLO,
    FT.ID_DIM_PDV,
    FT.ID_BLOCO_ITEM,
    SUM(FT.QTD_PONTO_EXTRA),
    SUM(FTPI.TOTAL_NOTA_ITEM)
from FT_DOMINANCIA_PONTO_EXTRA_COMPLIANCE FT
inner join TABREF_PAINEL_LOJAS_LP TPLL
    on FT.ID_DIM_PDV = TPLL.ID_DIM_PDV          -- ID_DIM_PDV -> É utilizada na junção entre as tabelas FT e TPLL
   and FT.CICLO = TPLL.CICLO                    -- CICLO -> É utilizada na junção entre as tabelas FT e TPLL
inner join FT_PERFECTSTORE_ITEM FTPI
    on FT.CICLO = FTPI.CICLO                    -- CICLO -> É utilizada na junção entre as tabelas FT e FTPI
   and FT.ID_DIM_PDV = FTPI.ID_DIM_PDV          -- ID_DIM_PDV -> É utilizada na junção entre as tabelas FT e FTPI
   and FT.ID_BLOCO_ITEM = FTPI.ID_BLOCO_ITEM    -- ID_BLOCO_ITEM -> É utilizada na junção entre as tabelas FT e FTPI
   and FT.SEMANA_LP = FTPI.SEMANA_LP            -- SEMANA_LP -> É utilizada na junção entre as tabelas FT e FTPI
where
    FT.CICLO = 202009                           -- CICLO -> É utilizada para filtrar a tabela FT
  and FT.ID_DIM_PDV = 223459792                 -- ID_DIM_PDV -> É utilizada para filtrar a tabela FT
group by 
    FT.CICLO,
    FT.ID_DIM_PDV;

/*
Ao analisar a query acima, é possível identificar colunas que se repetem nos filtros (WHERE) e nas junções (JOINs).
Essas colunas são as principais candidatas à criação de índices:
- CICLO
- ID_DIM_PDV
- ID_BLOCO_ITEM
- SEMANA_LP

Para otimizar a performance dessa query, é recomendado a criação de índices compostos combinando as colunas citadas anteriormente.
É importante destacar que a ordem das colunas no índice influencia o desempenho: como CICLO e ID_DIM_PDV são utilizadas diretamente nos
filtros do WHERE, elas devem aparecer primeiro. Dessa forma, o otimizador do banco consegue restringir rapidamente
os registros relevantes e reduzir a varredura das tabelas.

Para a tabela FT_DOMINANCIA_PONTO_EXTRA_COMPLIANCE (FT): CICLO, ID_DIM_PDV, ID_BLOCO_ITEM, SEMANA_LP

Para a tabela TABREF_PAINEL_LOJAS_LP (TPLL): CICLO, ID_DIM_PDV

Para a tabela FT_PERFECTSTORE_ITEM (FTPI): CICLO, ID_DIM_PDV, ID_BLOCO_ITEM, SEMANA_LP

Criando os índices temos:
*/

CREATE INDEX idx_ft_ciclo_pdv_bloco_semana
ON FT_DOMINANCIA_PONTO_EXTRA_COMPLIANCE (CICLO, ID_DIM_PDV, ID_BLOCO_ITEM, SEMANA_LP);

CREATE INDEX idx_tpll_ciclo_pdv
ON TABREF_PAINEL_LOJAS_LP (CICLO, ID_DIM_PDV);

CREATE INDEX idx_ftpi_ciclo_pdv_bloco_semana
ON FT_PERFECTSTORE_ITEM (CICLO, ID_DIM_PDV, ID_BLOCO_ITEM, SEMANA_LP);
