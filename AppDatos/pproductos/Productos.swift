//
//  productos.swift
//  AppDatos
//
//  Created by DAMII on 6/11/23.
//

import UIKit

struct Products: Codable {
    
    var id:Int
    var title:String
    var price:Double
    var description:String
    var category:String
    var image:String
    var rating:Rating

}
