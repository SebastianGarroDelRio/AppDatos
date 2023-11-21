//
//  ItemTableViewCell.swift
//  AppDatos
//
//  Created by DAMII on 2/10/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFoto: UIImageView!
    
    @IBOutlet weak var lblNombres: UILabel!
    
    @IBOutlet weak var lblCodigo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
