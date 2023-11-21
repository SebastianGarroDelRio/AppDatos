//
//  ControladorCliente.swift
//  AppDatos
//
//  Created by DAMII on 16/10/23.
//

import UIKit

class ControladorCliente: NSObject {

    //metodo para registrar cliente
    func registrarCliente(bean:Cliente){
        //PASO 1: objeto de la clase AppDelegete
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //PASO 2: acceder a la conexion de la base de datos
        let contextoBD=delegate.persistentContainer.viewContext
        //PASO 3: establecer tabla
        let tabla=ClienteEntity(context: contextoBD)
        //PASO 4: asignar valor a los atributos del objeto
        //tabla
        tabla.codigo=Int16(bean.codigo)
        tabla.nombres=bean.nombres
        tabla.apellidos=bean.apellidos
        tabla.credito=bean.creadito
        tabla.foto=bean.foto
        //PASO 5:controlar exception
        do{
            //PASO 6:grabar
            try contextoBD.save()
            print("Cliente registrado")
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
    }
    
    //funcion que retorna un arreglo de tipo ClienteEntity
    func listarClientes()->[ClienteEntity]{
        //declarar
        var datos:[ClienteEntity]!
        //PASO 1: objeto de la clase AppDelegete
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //PASO 2: acceder a la conexion de la base de datos
        let contextoBD=delegate.persistentContainer.viewContext
        //PASO 3:controlar exception
        do{
           //PASO 4: obtener contenido de ClienteEntity
           let registros=ClienteEntity.fetchRequest()
           //PASO 5: leer filas del objeto registros y guardar en "datos"
            datos = try contextoBD.fetch(registros)
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
        return datos
    }
    
    func actualizarCliente(bean:ClienteEntity){
        let delegate=UIApplication.shared.delegate as! AppDelegate
        let contextoBD=delegate.persistentContainer.viewContext
        do{
            try contextoBD.save()
            print("Cliente actualizado")
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
    }
    func eliminarCliente(bean:ClienteEntity){
        let delegate=UIApplication.shared.delegate as! AppDelegate
        let contextoBD=delegate.persistentContainer.viewContext
        do{
            contextoBD.delete(bean)
            try contextoBD.save()
            print("Cliente eliminado")
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
    }
    func buscarClientes(nom:String)->[ClienteEntity]{
        //declarar
        var datos:[ClienteEntity]!
        //PASO 1: objeto de la clase AppDelegete
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //PASO 2: acceder a la conexion de la base de datos
        let contextoBD=delegate.persistentContainer.viewContext
        //PASO 3:controlar exception
        do{
           //PASO 4: obtener contenido de ClienteEntity
           let registros=ClienteEntity.fetchRequest()
           //PASO 5: filtro
            let predicate=NSPredicate(format: "nombres BEGINSWITH[c] %@", nom)
            //PASO 6: enviar filtro
            registros.predicate=predicate
           //PASO 5: leer filas del objeto registros y guardar en "datos"
            datos = try contextoBD.fetch(registros)
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
        return datos
    }
    
    
}
