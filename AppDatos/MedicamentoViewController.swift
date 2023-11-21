//
//  MedicamentoViewController.swift
//  AppDatos
//
//  Created by DAMII on 30/10/23.
//

import UIKit
import Alamofire


class MedicamentoViewController: UIViewController,UITableViewDataSource,
                                 UITableViewDelegate{
   
    

    @IBOutlet weak var tvMedicamentos: UITableView!

    //arreglo
    var listaMedicamentos:[Medicamento]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarMedicamentos()
        tvMedicamentos.dataSource=self
        tvMedicamentos.delegate=self
        tvMedicamentos.rowHeight=110
    }
    func cargarMedicamentos(){
        AF.request("https://puedeser.onrender.com/medicamento/lista")
            .responseDecodable(of: [Medicamento].self){ data in
                //validar data
                guard let info=data.value else {return}
                self.listaMedicamentos=info
                self.tvMedicamentos.reloadData()
            }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaMedicamentos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row=tvMedicamentos.dequeueReusableCell(withIdentifier: "celda") as!
        ItemMedicamentoTableViewCell
        row.lblCodigo.text="Codigo : "+String(listaMedicamentos[indexPath.row].codigo)
        row.lblNombre.text="Nombre : "+listaMedicamentos[indexPath.row].nombre
        return row
    }

    @IBAction func btnNuevo(_ sender: UIButton) {
        performSegue(withIdentifier: "nuevo", sender: nil)
    }
    
}
