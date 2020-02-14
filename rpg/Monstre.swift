//
//  Monstre.swift
//  rpg
//
//  Created by ayite  on 31/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class Monstre: Hero{
    
    init(){
           super.init(cate: .MONSTRE)
           presentation()
       }

       func presentation(){
           print("Je suis un monstre!!")
       }
    
    func superAttack(){
        let fight = super.fight
        let defense = super.defense
        print("\(super.name) a attaqué \(fight) fois et c'est défendu \(defense) fois")
    }
}
