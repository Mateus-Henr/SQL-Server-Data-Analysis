INSERT INTO star.fato_sinistro (id_sinistro, data_sinistro, valor, carro_id_carro, cliente_id_cliente, modelo_id_modelo, montadora_id_montadora)
SELECT s.id_sinistro, s.data_sinistro, s.valor, c.id_carro, cl.id_cliente, m.id_modelo, mo.id_montadora
FROM mydb.sinistro s
JOIN mydb.carro c ON s.carro_id_carro = c.id_carro
JOIN mydb.cliente cl ON c.cliente_id_cliente = cl.id_cliente
JOIN mydb.modelo m ON m.id_modelo = c.modelo_id_modelo
JOIN mydb.montadora mo ON mo.id_montadora = m.montadora_id_montadora;