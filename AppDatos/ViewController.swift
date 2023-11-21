//
//  ViewController.swift
//  AppDatos
//
//  Created by DAMII on 2/10/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,
        UITableViewDelegate  {

    @IBOutlet weak var txtNombres: UITextField!
    @IBOutlet weak var tvClientes: UITableView!
    
    //arreglo de tipo Cliente
    var listaClientes:[ClienteEntity]=[]
    //
    var pos = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        listaClientes=ControladorCliente().listarClientes()
        //enviar origen de datos al atributo tvClientes
        tvClientes.dataSource=self
        //
        tvClientes.delegate=self
        //alto de la celda
        tvClientes.rowHeight=150
    }


    //funcion para llenar datos al arreglo listaClientes
    /*func llenarArreglo(){
        listaClientes.append(Cliente(codigo: 1, nombres: "Ana", apellidos: "Soto Ayala", creadito: 25000.00, foto: "persona1"))
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaClientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //crear objeto de la clase ItemTableView,
        //usar la celda de la tabla "elemento"
        let row=tvClientes.dequeueReusableCell(withIdentifier: "elemento")
         as! ItemTableViewCell
        //asignar valores
        row.lblCodigo.text=String(listaClientes[indexPath.row].codigo)
        row.lblNombres.text=listaClientes[indexPath.row].nombres
        return row
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        pos=indexPath.row
        //invocar al segue "datos"
        performSegue(withIdentifier: "datos", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="datos"{
            //crear objeto de la clase DatosViewController
            //trabajar con el segue "datos"
            let row=segue.destination as! DatosViewController
            //acceder a bean
            row.bean=listaClientes[pos]
        }
    }
    
    @IBAction func btnNuevo(_ sender: UIButton) {
        
        performSegue(withIdentifier: "nuevo", sender: nil)
        
    }
    
    @IBAction func btnBuscar(_ sender: UIButton) {
        let nombres=txtNombres.text ?? ""
        listaClientes=ControladorCliente().buscarClientes(nom: nombres)
        //refrescar tabla
        tvClientes.reloadData()
    }
    
}

