//
//  Stat.swift
//  rpg
//
//  Created by ayite  on 20/02/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class Stat {
    let player1: Player
    let player2: Player

    init(player1 : Player, player2: Player){
        self.player1 = player1
        self.player2 = player2
    }
    /**
    statEndGame() allows to diplay the winner of the game
     
     - Parameters:
        - player1 :allows to recover the the parameter winner
        - player2 :allows to recover the the parameter winner
    */
    func statEndGame(player1: Player, player2: Player){
        print("Resumé de la partie")
        if player1.getWinner() == true {
            print("le winner de ce battle est \(player1.getName())")
            print("la partie a durée \(player1.getRound() - 1) Rounds")
            statHero(player: player1)
        } else {
            print("le winner de ce battle est \(player2.getName())")
            print("la partie a durée \(player1.getRound() - 1) Rounds")
            statHero(player: player2)
        }
    }
    
    /**
    statHero() allows to diplay statistics of the winner
     
     - Parameters:
        - player :allows to recover  the parameter of the winner
    */
    
    func statHero(player: Player){
        for hero in player.getWarriorsPlayers(){
            print("\n\(hero.getName()) \(hero.getType()): "
            + "\nvie : \(hero.getLife())"
            + "\nattaques  : \(hero.getFight()) fois"
            + "\n   attaques normales   : \(hero.getNormalAttack()) fois"
            + "\n   super attaques      : \(hero.getSuperAttack()) fois"
            + "\ndéfenses : \(hero.getDefense()) fois"
            + "\nsoins apportés : \(hero.getNumbOfCare()) fois")
        }
    }
}
