#Ejercicio 2 para entregar

import os.path
import re
path=raw_input('Introduzca path del directorio: ')
ADN={}

#Transformo el contenido del fichero en unal lista y la recorremos en un bucle definido para seleccionar y abrir los archivo *.gb

lista_directorio=os.listdir(path)

for i in lista_directorio:
    if re.search('(.){,1}.gb',i):
        filegb = open(path+i)
        contador=0
        
#Defino un bucle tipo "for" para recorrer el archivo 
        
        for line in filegb:
            
#Para acceder al organismo identifico la palabra clave "ORGAMISM"
            
            if 'ORGANISM' in line:
                line = line.split()
                
#Excluimos la palabra 'ORGANISM' del resultado, que es el primer elemento de la lista line

                organismo=line[1]+' '+line[2]
                resumen=open(path+'resumen2.txt','a')
                resumen.write(organismo+'\n')
                
#Para acceder a la secuencia identifico la palabra clave "ORIGIN"
#Gracias a un contador, se consigue que solo considere las lineas a partir de 'ORIGIN'

            if 'ORIGIN' in line:
                contador+=1
                                
            if contador==1:
                
#Creo un bucle que recorra la secuencia line e introduzco sus elementos como claves en el diccionario ADN (creado fuera de bucle:linea 6)
#y como valor un contador de su incidencia y añado a mi archivo la que interesa
                
                for j in line:
                    if j in ADN.keys():
                        n=ADN[j]
                        n+=1
                        ADN[j]=n
                    else:
                        ADN[j]=1
                     
        adeninas =str(ADN['a'])
        
        resumen.write('Cantidad de adeninas: '+adeninas+'.\n')
        
resumen.close()
