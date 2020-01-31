//
//  Joueur.swift
//  rpg
//
//  Created by ayite  on 31/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class Player{
    var name: String
    var numberOfPlayers = 0
    var round = 0
    var warriorsPlayer : [Hero] = []
    var winner : Bool = false
    
    init(name: String, numberOfPlayers: Int,warriors1: Hero, warriors2: Hero, warriors3: Hero) {
        self.numberOfPlayers = numberOfPlayers
        self.name = name
        warriorsPlayer.append(warriors1)
        warriorsPlayer.append(warriors2)
        warriorsPlayer.append(warriors3)
    }
}
