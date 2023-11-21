//
//  NuevoMedicamentoViewController.swift
//  AppDatos
//
//  Created by DAMII on 31/10/23.
//

import UIKit
import Alamofire

class NuevoMedicamentoViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtDescripcion: UITextField!
    
    @IBOutlet weak var txtPrecio: UITextField!
    
    @IBOutlet weak var txtStock: UITextField!
    
    @IBOutlet weak var txtFecha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func grabarMedicamento(bean:Medicamento){
        AF.request("https://puedeser.onrender.com/medicamento/registrar",
                   method: .post,parameters: bean,
                   encoder: JSONParameterEncoder.default
        ).response( completionHandler: { info in
                switch info.result{
                   case .success(let data):
                    do{
                        let row=try JSONDecoder().decode(Medicamento.self, from: data!)
                        print("codigo : "+String(row.codigo))
                    }catch{
                      print("Error en el JSON")
                    }
                   case .failure(let error):
                    print(error.localizedDescription)
                }
            })
    }

    @IBAction func btnGrabar(_ sender: UIButton) {
        let nom=txtNombre.text ?? ""
        let des=txtDescripcion.text ?? ""
        let sto=Int(txtStock.text ?? "0") ?? 0
        let pre=Double(txtPrecio.text ?? "0") ?? 0
        let fec=txtFecha.text ?? "2020-02-02"
        
        let medi=Medicamento(codigo: 0, nombre: nom, descripcion: des,
                             stock: sto, precio: pre, fecha: fec)
        
        grabarMedicamento(bean: medi)
    }
    
}




