SELECT distinct *
FROM mydb.sinistro
JOIN mydb.carro ON mydb.sinistro.carro_id_carro = mydb.carro.id_carro
JOIN mydb.cliente ON mydb.carro.cliente_id_cliente = mydb.cliente.id_cliente
JOIN mydb.modelo ON mydb.modelo.id_modelo = mydb.carro.modelo_id_modelo
JOIN mydb.montadora ON mydb.montadora.id_montadora = mydb.modelo.montadora_id_montadora
JOIN mydb.seguro ON mydb.seguro.carro_id_carro = mydb.carro.id_carro