
import UIKit
import Alamofire
import Kingfisher

class ProductosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var cvProductos: UICollectionView!
    
    
    //agrego arreglo
    var listaProductos:[Products]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        cvProductos.dataSource=self
        cvProductos.delegate=self
        cargarProductos()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 2
        return CGSize(width: width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaProductos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row=collectionView.dequeueReusableCell(withReuseIdentifier: "row", for: indexPath) as! ItemProductoCollectionViewCell
        row.lblTitulo.text=listaProductos[indexPath.row].title
        let url=URL(string: listaProductos[indexPath.row].image)
        row.imgFoto.kf.setImage(with: url)
        return row
    }
    
    func cargarProductos(){
        AF.request("https://fakestoreapi.com/products")
            .responseDecodable(of: [Products].self){ data in
                //validar data
                guard let info=data.value else {return}
                self.listaProductos=info
                self.cvProductos.reloadData()
            }
    }
    

}
