import csv
import re


# Defina uma função para processar os comandos INSERT


def process_insert_file(input_filename, output_filename, table_name, column_names):
    with open(input_filename, 'r') as file, open(output_filename, 'w', newline='') as csvfile:
        csv_writer = csv.writer(csvfile)
        csv_writer.writerow(column_names)

        for line in file:
            try:
                if line.startswith(f"INSERT INTO {table_name}("):
                    values = re.search(r"VALUES\((.*?)\);", line).group(1)
                    values = values.split(',')
                    values = [value.strip().strip("'") for value in values]
                    print(values)
                    csv_writer.writerow(values)
            except Exception as e:
                print(f"Erro {e}")

    print(f"Arquivo CSV '{output_filename}' gerado com sucesso!")


# Processar os comandos INSERT para cada tabela
tables = {
    "carro": ("../tp2-gradi-grupo3/carro3.txt", "../tables_csv/carro.csv",
              ["id_carro", "cor", "valor_compra", "data_compra", "modelo_id_modelo", "cliente_id_cliente"
               ]),
    "cliente": ("../tp2-gradi-grupo3/cliente3.txt", "../tables_csv/cliente.csv",
                ["id_cliente", "regiao", "estado", "cidade", "telefone", "celular", "sexo", "cep", "data_nasc"
                 ]),
    "modelo": (
        "../tp2-gradi-grupo3/modelo3.txt", "../tables_csv/modelo.csv", ["id_modelo", "nome", "montadora_id_montadora"]),
    "sinistro": ("../tp2-gradi-grupo3/sinistro3.txt", "../tables_csv/sinistro.csv",
                 ["id_sinistro", "data_sinistro", "valor", "carro_id_carro"]),
    "montadora": (
        "../tp2-gradi-grupo3/montadora3.txt", "../tables_csv/montadora.csv", ["id_montadora", "nome", "pais_origem"]),
    "seguro": ("../tp2-gradi-grupo3/seguro3.txt", "../tables_csv/seguro.csv",
               ["id_seguro", "valor_segurado", "premio", "ano_vigencia", "carro_id_carro"])
}

for table_name, (input_filename, output_filename, column_names) in tables.items():
    process_insert_file(input_filename, output_filename, table_name, column_names)
