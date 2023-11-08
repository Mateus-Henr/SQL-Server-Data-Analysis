CREATE VIEW cube_modelo_carro_sinsitro AS
SELECT
    dm.nome AS nome_modelo,
    dmt.nome AS nome_montadora,
    ROUND(AVG(fs.valor), 2) AS custo_medio_sinistro,
    COUNT(fs.id_sinistro) AS quantidade_sinistros
FROM
    MYSQLSTAR...dim_modelo dm
    JOIN MYSQLSTAR...fato_sinistro fs ON dm.id_modelo = fs.modelo_id_modelo
    JOIN MYSQLSTAR...dim_montadora dmt ON fs.montadora_id_montadora = dmt.id_montadora
GROUP BY CUBE
    (dm.nome, dmt.nome)
HAVING dmt.nome IS NOT NULL