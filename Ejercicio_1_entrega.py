# coding: utf-8

#Ejercicio 1 de entrega.
#Creo el menu con las opciones que debe introducir el usuario
print 'Seleccione 1, si desea conocer el organismo al que pertenecen los datos.','\n'
print 'Seleccione 2, si desea saber la composicion de bases de la secuencia.','\n'
print 'Seleccione 3, para guardar la secuencia DNA en otro archivo.','\n'
print 'Seleccione 4 para ver y guardar la extension y traduccion de las coding secuences,CDS.','\n'
print 'Seleccione 5 para salir.','\n'

num=input('Introduzca una opcion: ')
print '\n'
import re
#Hago un bucle indefinido con opcion de escape (5) para hacer el programa ciclico
while True:
    if num==1:
        fichero=open(raw_input('Introduzca el archivo genbank con su path: '))
        print '\n'
        for linea in fichero:
#Para acceder al organismo identifico la palabra clave "ORGAMISM" en el archivo genbank 

            if re.search('ORGANISM', linea):
                linea=linea.split()
                
                #Excluimos la palabra 'ORGANISM' del resultado

                del linea[0]
                organismo=''
                for palabra in linea:
                    organismo=organismo+' '+palabra
                print '\n', 'El archivo corresponde al organismo: ',organismo,'\n'
    if num==2:
        fichero=open(raw_input('Introduzca el archivo genbank con su path: '))
        print '\n'
        n=0
        adn={}
       
        for linea in fichero:
            
#Identifico la secuencia buscando la palabra 'ORIGIN' en el texto     
      
            if re.search('ORIGIN', linea):
                n+=1
            if n==1:
                
#Creo un bucle que recorra la linea e introduzco sus elementos como claves en el diccionario adn (creado fuera de bucle:linea 31)
#y como valor un contador de su incidencia 
                
                for i in linea:
                    if i not in adn.keys():
                        adn[i]=1
                    if i in adn.keys():
                        c = adn[i]
                        c = c + 1
                        adn[i] = c
                        
                          
        print 'La secuencia contiene ',adn['a'],' adeninas, ',adn['g'],' guaninas, ',adn['c'],' citosinas, ',adn['t'],' timinas.','\n'
    
    if num==3:
        fichero=open(raw_input('Introduzca el archivo genbank con su path: '))
        print '\n'
        n=0
        for linea in fichero:
            
            if re.search('ORIGIN', linea):
                ADN=open(raw_input('Introduzca nombre de archivo con ubicación: '),'a')
                print '\n'
                
#Gracias a un contador, se consigue que solo considere las lineas a partir de 'ORIGIN'

                n+=1
            if n==1:
                for i in linea:
                    #Con la siguiente condicion solo pretendo guardar la secuencia, no los numeros que la precenden
                    if re.search('[agct]',i):
                        ADN.write(i)
                ADN.write('\n')
                
#Esta opcion muestra en pantalla la extension de las coding secuence (cds), su traduccion a proteina y lo guarda en un
#archivo cuyo nombre y ubicacion se le solicita al usuario        
        
        if num==4:
        fichero=open(raw_input('Introduzca el archivo genbank con su path: '))
        print '\n'
        count=0
        for linea in fichero:
            
#Para acceder al "Coding secuence" identifico la palabra clave "CDS" en el archivo genbank 

            if re.search('CDS', linea):
                linea=linea.split()
                
                #Excluimos la palabra 'CDS' del resultado

                del linea[0]
                CDS=''
                for palabra in linea:
                    CDS=CDS+' '+palabra
                print '\n', 'La secuencia codificante del gen se encuentra en el intervalo: ',CDS,'\n'
                codingsec=open(raw_input('Introduzca nombre de archivo con ubicación: '),'a')
                codingsec.write('\n'+'Secuencia codificante: '+CDS+'\n')
            
            if 'translation' in linea:
                count+=1
                codingsec.write('Su traduccion es: '+'\n')
            if 'BASE COUNT' in linea: 
                count=count+2
            if count==1:
                print linea
                codingsec.write(linea+'\n')
                
                                        
    if num==5:
        break
        
#Meto el menu y la entrada de opcion deesde teclado dentro del bucle para hacerlo ciclico

    print 'Seleccione 1, si desea conocer el organismo al que pertenecen los datos.','\n'
    print 'Seleccione 2, si desea saber la composicion de bases de la secuencia.','\n'
    print 'Seleccione 3, para guardar la secuencia DNA en otro archivo.','\n'
    print 'Seleccione 4 para ver extension y traduccion de las coding secuences,CDS.','\n'
    print 'Seleccione 5 para salir.','\n'
        
    num=input('Introduzca una opcion: ')
    
                        
                        
