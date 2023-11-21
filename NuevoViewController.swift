//
//  NuevoViewController.swift
//  AppDatos
//
//  Created by DAMII on 3/10/23.
//

import UIKit

class NuevoViewController: UIViewController {

    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtNombres: UITextField!
    @IBOutlet weak var txtApellidos: UITextField!
    @IBOutlet weak var txtCredito: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnGrabar(_ sender: UIButton) {
        //leer cajas
        let cod=Int(txtCodigo.text ?? "0") ?? 0
        let nom=txtNombres.text ?? ""
        let ape=txtApellidos.text ?? ""
        let cred=Double(txtCredito.text ?? "0") ?? 0
        //variable de tipo Cliente
        let obj=Cliente(codigo: cod, nombres: nom, apellidos: ape, creadito: cred, foto: "")
        //invocar metodo grabarCliente
        ControladorCliente().registrarCliente(bean: obj)
        
    }
    
    
}




