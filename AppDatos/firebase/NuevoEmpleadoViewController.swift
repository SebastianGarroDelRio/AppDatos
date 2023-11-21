//
//  NuevoEmpleadoViewController.swift
//  AppDatos
//
//  Created by DAMII on 13/11/23.
//

import UIKit
import FirebaseFirestore

class NuevoEmpleadoViewController: UIViewController {
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnNuevoRegistrar(_ sender: UIButton) {
        //leer las cajas
        let nom=txtNombre.text ?? ""
        let ape=txtApellido.text ?? ""
        let eda=Int(txtEdad.text ?? "0") ?? 0
        
        let bean=Empleado(nombres: nom, apellidos: ape, edad: eda)
        grabarEmpleado(emp: bean)
        
    }
    
    func grabarEmpleado(emp:Empleado){
        //Acceder a la base de datos
        let BD=Firestore.firestore()
        //Generar el ID del documento
        let ID=UUID().uuidString
        //Acceder a la coleccion
        BD.collection("empleado").document(ID).setData([
            "nombres":emp.nombres,
            "apellidos":emp.apellidos,
            "edad":emp.edad
        ]){ ex in
            if let e=ex{
                //tmb se puede enviar con un alert
                print(e.localizedDescription)
            }
            else {
                //tmb se puede enviar con un alert
                print("registro ok")
            }
        }
    }
    
    
}
