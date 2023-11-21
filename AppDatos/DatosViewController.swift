//
//  DatosViewController.swift
//  AppDatos
//
//  Created by DAMII on 3/10/23.
//

import UIKit

class DatosViewController: UIViewController {
    
    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtNombres: UITextField!
    @IBOutlet weak var txtApellidos: UITextField!
    @IBOutlet weak var txtCredito: UITextField!
    
    //variable de tipo Cliente
    var bean:ClienteEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtCodigo.text=String(bean.codigo)
        txtNombres.text=bean.nombres
        txtApellidos.text=bean.apellidos
        txtCredito.text=String(bean.credito)

    }
    
    @IBAction func btnActualizar(_ sender: UIButton) {
        
        //leer cajas
        let cod=Int(txtCodigo.text ?? "0") ?? 0
        let nom=txtNombres.text ?? ""
        let ape=txtApellidos.text ?? ""
        let cred=Double(txtCredito.text ?? "0") ?? 0
        //setear objeto bean
        bean.codigo=Int16(cod)
        bean.nombres=nom
        bean.apellidos=ape
        bean.credito=cred
        //invocar metodo grabarCliente
        ControladorCliente().actualizarCliente(bean: bean)
    }
    
    @IBAction func btnEliminar(_ sender: UIButton) {
        let ventana=UIAlertController(title: "Sistema", message: "Seguro de eliminar?", preferredStyle: .alert)
        let botonAceptar=UIAlertAction(title: "SI", style: .default,handler: {
            action in
            ControladorCliente().eliminarCliente(bean: self.bean)
        })
        ventana.addAction(UIAlertAction(title: "NO", style: .cancel))
        ventana.addAction(botonAceptar)
        present(ventana, animated: true)
    }
    
}
