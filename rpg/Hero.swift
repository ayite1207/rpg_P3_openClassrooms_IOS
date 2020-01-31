//
//  Hero.swift
//  rpg
//
//  Created by ayite  on 30/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation
class Hero{
    var name: String?
    var cate: Cate?
    var type: String?
    var life: Int = 0
    var care = 0
    var attack = 0
    
    var defense: Int = 0
    enum Cate{
        case archer,guerrier, espion,magicien, MONSTRE
    }
    
    init(cate: Cate) {
        self.cate = cate
        
        initialization(cate: cate)
    }
    
    func initialization(cate: Cate){
        switch cate {
        case .archer:
            self.cate = .archer
            name = "Green Arrow"
            life = 100
            attack = 40
            type = "archer"
        case .guerrier:
            self.cate = .guerrier
            name = "Conan le Barbare"
            life = 100
            attack = 100
            type = "guerrier"
        case .espion:
            self.cate = .espion
            name = "Kakashi"
            life = 100
            attack = 20
            type = "espion"
        case .magicien:
            self.cate = .magicien
            name = "Kakashi"
            life = 80
            attack = 60
            type = "magicien"
        case .MONSTRE:
            self.cate = .MONSTRE
            name = "Albus Dumbledore"
            life = 120
            care = 20
            type = "Monstre"
        }
    }
}

