import csv
import random

# Lista de estados de México
estados_mexico = [
    "Aguascalientes", "Baja California", "Baja California Sur", "Campeche", "Coahuila", "Colima",
    "Chiapas", "Chihuahua", "Ciudad de México", "Durango", "Guanajuato", "Guerrero", "Hidalgo", 
    "Jalisco", "Estado de México", "Michoacán", "Morelos", "Nayarit", "Nuevo León", "Oaxaca", 
    "Puebla", "Querétaro", "Quintana Roo", "San Luis Potosí", "Sinaloa", "Sonora", "Tabasco", 
    "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatán", "Zacatecas"
]

# Abrir archivo CSV
with open('estados_mexico2.csv', mode='w', newline='', encoding='utf-8') as file:
    # Definir los nombres de las columnas
    fieldnames = ['id_estado', 'nombre', 'numero_habitantes', 'numero_electores']
    writer = csv.DictWriter(file, fieldnames=fieldnames)

    # Escribir la cabecera
    writer.writeheader()

    # Inicializar el ID de estado
    id_estado = 1

    # Escribir los datos para cada estado
    for estado in estados_mexico:
        numero_habitantes = random.randint(100000, 5000000)  # Generar número de habitantes entre 100,000 y 5,000,000
        numero_electores = random.randint(70000, numero_habitantes - 1)  # Generar número de electores entre 70,000 y el número de habitantes - 1

        # Escribir la fila en el archivo CSV
        writer.writerow({'id_estado': id_estado, 'nombre': estado, 'numero_habitantes': numero_habitantes, 'numero_electores': numero_electores})

        # Incrementar el ID de estado
        id_estado += 1

print("Archivo CSV generado exitosamente.")


