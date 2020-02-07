//
//  Archer.swift
//  rpg
//
//  Created by ayite  on 31/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class Archer: Hero{
    
    init(){
        super.init(cate: .archer)
        presentation()
    }

    func presentation(){
        print("Je suis un archer!!")
    }
    
    
    override func superAttack(){
        let fight = super.fight
        let defense = super.defense
        print("\(super.name) a attaqué \(fight) fois et c'est défendu \(defense) fois")
    }
}
