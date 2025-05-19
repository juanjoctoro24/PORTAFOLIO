import tkinter as tk

# Crear la ventana principal
ventana = tk.Tk()
historial = []
ventana.title("Calculo ICM")
ventana.geometry("300x400")

# Etiqueta principal
etiqueta_titulo = tk.Label(ventana, text="Calculo ICM")
etiqueta_titulo.pack(pady=30)

# Etiqueta para nombre
etiqueta_nombre = tk.Label(ventana, text="Ingresa tu nombre:")
etiqueta_nombre.pack(pady=5)
# Cuadro de texto para ingresar la nombre
entrada_nombre = tk.Entry(ventana)
entrada_nombre.pack(pady=5)

# Etiqueta para estatura
etiqueta_estatura = tk.Label(ventana, text="Ingresa tu Estatura (M):")
etiqueta_estatura.pack(pady=5)
# Cuadro de texto para ingresar el estatura
entrada_estatura = tk.Entry(ventana)
entrada_estatura.pack(pady=5)

#Etiqueta para Peso
etiqueta_peso=tk.Label(ventana, text="Ingresa el Peso (kg):")
etiqueta_peso.pack(pady=5)
# Cuadro de texto para Peso
entrada_peso= tk.Entry(ventana)
entrada_peso.pack(pady=5)
 

# Etiqueta para mostrar resultados o mensajes
etiqueta_resultado = tk.Label(ventana, text="Esperando resultado .  .  .")
etiqueta_resultado.pack(pady=10)

# Función para mostrar texto usando el contenido del cuadro de texto
def mostrar_texto():
    imc = (float(entrada_peso.get()) / (float(entrada_estatura.get())*(float(entrada_estatura.get()))))
    nombre=entrada_nombre.get()
    nombre=nombre.capitalize()
    registro = f"{nombre}: Estatura {entrada_estatura.get()} m, Peso {entrada_peso.get()} kg, IMC {imc:.2f}"
    historial.append(registro)

    if imc < 18.5 :
        etiqueta_resultado.config(text=f"{nombre} esta bajo de peso")
    elif imc >= 18.5 and imc <=24.9:
        etiqueta_resultado.config(text=f"{nombre} tiene un peso normal")
    elif imc >= 25 and imc <=29.9:
        etiqueta_resultado.config(text=f"{nombre}  tiene sobrepeso")
    else:
        etiqueta_resultado.config(text=f"{nombre} tiene obesidad")


    



def mostrar_historial():
    if historial:
        historial_texto = "\n\n".join(historial)
        etiqueta_resultado.config(text=historial_texto)
    else:
        etiqueta_resultado.config(text="Historial vacío.")



frame_botones = tk.Frame(ventana)
frame_botones.pack(pady=10)
# Botón para calcular (usa mostrar_texto por ahora)
boton_calcular = tk.Button(ventana, text="Calcular", command=mostrar_texto)
boton_calcular.pack(side="left", padx=5)
# Botón para mostrar histórico (también usa mostrar_texto solo como ejemplo)
boton_historico = tk.Button(ventana, text="Mostrar Historico", command=mostrar_historial)
boton_historico.pack(side="right", padx=5)

# Iniciar el bucle principal
ventana.mainloop()
