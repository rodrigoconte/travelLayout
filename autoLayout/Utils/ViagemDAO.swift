//
//  TravelDAO.swift
//  Alura Viagens
//
//  Created by Ândriu Coelho on 04/08/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit

class TravelDAO: NSObject {
    
    func retornaTodasAsViagens() -> [Travel] {
        let ceara = Travel(title: "Ceará", days: 3, price: "1.800,59", imgPath: "img1.png")
        let rioDeJaneiro = Travel(title: "Rio de Janeiro", days: 6, price: "1.200,00", imgPath: "img2.jpg")
        let interiorSaoPaulo = Travel(title: "Atibaia - Sao Paulo", days: 1, price: "890,00", imgPath: "img3.jpg")
        let paraiba = Travel(title: "Paraíba", days: 3, price: "1.385,00", imgPath: "img4.jpg")
        let fortaleza = Travel(title: "Fortaleza", days: 4, price: "3.120,00", imgPath: "img5.jpg")
        let listaTravel:Array<Travel> = [rioDeJaneiro, ceara, interiorSaoPaulo, paraiba, fortaleza]
        
        return listaTravel
    }
}
