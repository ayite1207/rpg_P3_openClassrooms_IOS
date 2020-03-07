//
//  Joueur.swift
//  rpg
//
//  Created by ayite  on 31/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class Player{
    private var name: String
    private var round = 0
    private var warriorsPlayer : [Hero] = []
    private var winner : Bool = false
    private var ordi: Bool = false
    
    init(name: String, numberOfPlayers: Int,warriors1: Hero, warriors2: Hero, warriors3: Hero, ordi: Bool) {
        self.name = name
        self.ordi = ordi
        warriorsPlayer.append(warriors1)
        warriorsPlayer.append(warriors2)
        warriorsPlayer.append(warriors3)
    }
    /**
     The get function allows to get the parameters of this class who are private
     */
    
    func getName()-> String {
        return name
    }
    func getRound()-> Int{
        return round
    }
    func getWarriorsPlayers()-> [Hero]{
        return warriorsPlayer
    }
    func getWinner()-> Bool{
        return winner
    }
    func getOrdi()-> Bool{
        return ordi
    }
    func setRonud(number: Int){
        round += number
    }
    
    func setWinner(winner: Bool){
        self.winner = winner
    }

}
