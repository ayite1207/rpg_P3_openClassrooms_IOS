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
    var life: Int = 0
    var care = 0
    var attack = 0
    
    var defense: Int = 0
    enum Cate{
        case archer,guerrier, espion,magicien, MONSTRE
    }
    
    init(name: String, cate: Cate) {
        self.name = name
        self.cate = cate
        
        initialization(cate: cate)
    }
    
    func initialization(cate: Cate){
        switch cate {
        case .archer:
            self.cate = .archer
            life = 100
            attack = 40
        case .guerrier:
            self.cate = .guerrier
            life = 100
            attack = 100
        case .espion:
            self.cate = .espion
            life = 100
            attack = 20
        case .magicien:
            self.cate = .magicien
            life = 80
            attack = 60
        case .MONSTRE:
            self.cate = .MONSTRE
            life = 120
            care = 20
        }
    }
}

