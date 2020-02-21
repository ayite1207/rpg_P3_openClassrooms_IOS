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
    
    func statEndGame(player1: Player, player2: Player){
        print("Resumé de la partie")
        if player1.winner == true {
            print("le winner de ce battle est \(player1.name)")
            print("la partie a durée \(player1.round - 1) Rounds")
            statHero(player: player1)
        } else {
            print("le winner de ce battle est \(player2.name)")
            print("la partie a durée \(player1.round - 1) Rounds")
            statHero(player: player2)
        }
    }
    
    func statHero(player: Player){
        for hero in player.warriorsPlayer{
            print("\n\(hero.name!) \(hero.type!): "
            + "\nvie : \(hero.life)"
            + "\nattaques  : \(hero.fight) fois"
            + "\n   attaques normales   : \(hero.normalAttack) fois"
            + "\n   super attaques      : \(hero.superAttack) fois"
            + "\ndéfenses : \(hero.defense) fois")
        }
    }
}
