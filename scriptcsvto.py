import csv

# Nombre del archivo CSV
csv_file = 'estados_mexico2.csv'

# Nombre del archivo SQL
sql_file = 'insert_estados.sql'

# Abrir el archivo SQL para escritura
with open(sql_file, mode='w', encoding='utf-8') as file:
    # Escribir la cabecera del script SQL
    file.write("CREATE TABLE IF NOT EXISTS estados (\n")
    file.write("  id_estado INT AUTO_INCREMENT PRIMARY KEY,\n")
    file.write("  nombre VARCHAR(30),\n")
    file.write("  numero_habitantes INT,\n")
    file.write("  numero_electores INT\n")
    file.write(");\n\n")

    # Leer el archivo CSV
    with open(csv_file, mode='r', newline='', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            # Crear la sentencia INSERT
            insert_statement = (
                f"INSERT INTO estados (id_estado, nombre, numero_habitantes, numero_electores) "
                f"VALUES ({row['id_estado']}, '{row['nombre']}', {row['numero_habitantes']}, {row['numero_electores']});\n"
            )
            # Escribir la sentencia INSERT en el archivo SQL
            file.write(insert_statement)

print("Archivo SQL generado exitosamente.")
