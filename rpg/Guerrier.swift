//
//  Guerrier.swift
//  rpg
//
//  Created by ayite  on 31/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class Guerrier: Hero{
    
    init(){
           super.init(cate: .guerrier)
           presentation()
       }

       func presentation(){
           print("Je suis un guerrier!!")
       }
    
   func superAttack(){
        let fight = super.fight
        let defense = super.defense
        print("\(super.name) a attaqué \(fight) fois et c'est défendu \(defense) fois")
    }
}
