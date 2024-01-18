import json
import zipfile
import os

api_token={"username":"ismael2024","key":"d347f4e663cb7b35f399f6ad9189a784"}

with open('C:/Users/ipacompia/.kaggle/kaggle.json','w') as file:
    json.dump(api_token,file)

location="C:/Users/ipacompia/Documents/proyecto_parcial/dataset"

#validar que la carpeta exista
if not os.path.exists(location):
    #si no existe la carpeta dataset la creo.
    os.mkdir(location)
else:
    #si la carpeta existe, se borra datos para que se pueda cargar datos actualizados
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root,name))  #elimina todos los ficheros
        for name in dirs:
            os.rmdir(os.path.join(root,name))   #elimina todas las carpetas

#Descargar dataset de kaggle
os.system("kaggle datasets download -d henryshan/starbucks -p C:/Users/ipacompia/Documents/proyecto_parcial/dataset")
#descomprimir el archivo de kaggle
os.chdir(location)
for file in os.listdir():               #lee los archivos .zip
    zip_ref=zipfile.ZipFile(file,"r")   #extrae el contenido
    zip_ref.extractall()
    zip_ref.close()                     #cierra archivo
#este el el actualizado con el ultimo ID
