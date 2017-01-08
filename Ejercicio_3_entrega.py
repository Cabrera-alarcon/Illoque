#Ejercicio 3 de entrega
print 'Seleccione 1, si desea introducir un nuevo alticulo.'
print '\n'
print 'Seleccione 2, si desea listar todos los articulos.'
print '\n'
print 'Seleccione 3, para buscar un artículo dando una palabra clave del título.'
print '\n'
print 'seleccione 4  para buscar un artículo dando el nombre de un autor.'
print '\n'
print 'Seleccione 5, para listar todos los artículos de una determinada revista.'
print '\n'
print 'Seleciione 6 para salir'
print '\n'

import re

lista_articulos=[]
basededatos=open('/home/bioinfo/Escritorio/BD.txt')


for line in basededatos:
    diccionario={}
    line=line.strip(',\n')
    line=line.split(',')
    
    n=0
    
    for palabra in line:
        n=n+1
        if n%2!=0:
            palabra1=None
            palabra1=palabra
            diccionario[palabra1]=''
        if n%2==0:
            palabra2=None
            palabra2=palabra
            diccionario[palabra1]=palabra2
    
    lista_articulos.append(diccionario)
    
num=input('Introduzca una opcion: ')
while num<7:
    if num==1:
        nuevoarticulo={}
        
        nuevoarticulo['titulo']=raw_input('Introduzca el titulo: ')
        nuevoarticulo['autores']=raw_input('Introduzca los autores: ')
        nuevoarticulo['revista']=raw_input('Introduzca revista: ')
        nuevoarticulo['fecha']=raw_input('Introduzca fecha de publicacion: ')
        nuevoarticulo['archivo']=raw_input('Introduzca el nombre del archivo del articulo: ')
        lista_articulos.append(nuevoarticulo)
    if num==2:
        for i in lista_articulos:
            print'\n'
            print 'Titulo: ',i['titulo']
            print 'Autor/es: ',i['autores']
            print 'Revista: ',i['revista']
            print 'Fecha: ',i['fecha']
            
    
    if num==3:
        palabra_clave=raw_input('Palabra clave: ')
        for i in lista_articulos:
            for clave,valor in i.items():
                if clave=='titulo' and palabra_clave in valor:
                    print i['titulo']
                     
    if num==4:
        
        au=raw_input('Introduzca autor: ')
        
        for i in lista_articulos:
            for clave,valor in i.items():
                if clave=='autores' and au in valor:   
                    print i['titulo']
    if num==5:
        revista_int=raw_input('Introduzca revista: ')
        for i in lista_articulos:
            for clave,valor in i.items():
                if clave=='revista' and revista_int in valor:   
                    print i['titulo']
    if  num==6:
        break
    print '\n'
    print 'Seleccione 1, si desea introducir un nuevo alticulo.'
    print '\n'
    print 'Seleccione 2, si desea listar todos los articulos.'
    print '\n'
    print 'Seleccione 3, para buscar un artículo dando una palabra clave del título.'
    print '\n'
    print 'seleccione 4  para buscar un artículo dando el nombre de un autor.'
    print '\n'
    print 'Seleccione 5, para listar todos los artículos de una determinada revista.'
    print '\n'
    print 'Seleciione 6 para salir'
    print '\n'
    num=input('Introduzca una opcion: ')

contador=0
for dictio in lista_articulos:
    
    for clave in dictio:
        valor=dictio[clave]
        contador=contador+1
        if contador==1:
            basededatos=open('/home/bioinfo/Escritorio/BD.txt', 'w')
            basededatos.write(clave+',')
            basededatos.write(valor+',')
        if contador>1:
            basededatos=open('/home/bioinfo/Escritorio/BD.txt', 'a')
            basededatos.write(clave+',')
            basededatos.write(valor+',')
    basededatos.write('\n')
basededatos.close()
        
