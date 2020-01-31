//
//  Game.swift
//  rpg
//
//  Created by ayite  on 31/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class Game{
    let player1 : Player
    let player2 : Player
    var round = 0
    
    init(player1 : Player,player2 : Player) {
        self.player1 = player1
        self.player2 = player2
        begining()
    }
    
    var endGame = false
    
    func begining(){
        print("|| Bienvenue dans le nouveau battle Royale || \n ")
        print("---------------------------------------------")
        print("\nAujourd'hui c'est \(player1.name) et \(player2.name) qui s'affrontent.\n")
        print("\(player1.name) tu possèdes trois héros :"
            + "\n\n\(player1.warriorsPlayer[0].name) est un \(player1.warriorsPlayer[0].cate) "
            + "\n\(player1.warriorsPlayer[1].name) est un \(player1.warriorsPlayer[1].cate)  "
            + "\n\(player1.warriorsPlayer[2].name) est un \(player1.warriorsPlayer[2].cate)")
        print("\n\(player2.name) tu possèdes trois héros :"
            + "\n\n\(player2.warriorsPlayer[0].name) est un \(player2.warriorsPlayer[0].cate) "
            + "\n\(player2.warriorsPlayer[1].name) est un \(player2.warriorsPlayer[1].cate)"
            + "\n\(player2.warriorsPlayer[2].name) est un \(player2.warriorsPlayer[2].cate)")
        print("\nQue le battle commence\n")
    }
    
    
    func whoseWin()-> Bool{
        var lifePlayer1: Int = 0
        for warrior in player1.warriorsPlayer{
            lifePlayer1 += warrior.life
        }
        var lifePlayer2: Int = 0
        for warrior in player2.warriorsPlayer{
            lifePlayer2 += warrior.life
        }
        if lifePlayer1 <= 0 {
            print("\n\n=============================")
            print("     VICTOIRE de \(player2.name) ")
            print("=============================")
            return true
        } else if lifePlayer2 <= 0 {
            print("\n\n=============================")
            print("     VICTOIRE de \(player1.name) ")
            print("=============================")
            return true
        }
        return false
    }
    func displayHeroLife(hero1: Player,hero2: Player ){
        let count = hero1.warriorsPlayer.count
        print("\n    \(hero1.name)                 \(hero2.name)")
        print("-------------------------------------------")
        for hero in 0...count - 1 {
            if player1.warriorsPlayer[hero].life > 0 && player2.warriorsPlayer[hero].life > 0{
                print("\(player1.warriorsPlayer[hero].name) / \(player1.warriorsPlayer[hero].life) de vie ||   \(player2.warriorsPlayer[hero].name) / \(player2.warriorsPlayer[hero].life) de vie")
            } else if player1.warriorsPlayer[hero].life <= 0 && player2.warriorsPlayer[hero].life <= 0 {
                print("\(player1.warriorsPlayer[hero].name) EST MORT ||   \(player2.warriorsPlayer[hero].name) / EST MORT")
            } else if player1.warriorsPlayer[hero].life > 0 && player2.warriorsPlayer[hero].life < 0 {
                print("\(player1.warriorsPlayer[hero].name) / \(player1.warriorsPlayer[hero].life) de vie  ||   \(player2.warriorsPlayer[hero].name) / EST MORT")
            }else if player1.warriorsPlayer[hero].life < 0 && player2.warriorsPlayer[hero].life > 0 {
                print("\(player1.warriorsPlayer[hero].name) / EST MORT  ||   \(player2.warriorsPlayer[hero].name) / \(player2.warriorsPlayer[hero].life) de vie")
            }
        }
    }
    
    func round(SoigneouAttaque hero1: Hero,estSoignéouAttaqueé hero2: Hero ){
        
        if player1.round == player2.round {
            player1.round += 1
            print("\nround \(player1.round)")
            attaque(player: player1, hero1: hero1, hero2: hero2)
        }else {
            player2.round += 1
            attaque(player: player2,hero1: hero1, hero2: hero2)
            displayHeroLife(hero1: player1, hero2: player2)
        }
    }
    
    func attaque(player: Player, hero1 : Hero,hero2 : Hero){
        if whoseWin() == false {
            switch hero1.cate {
            case .archer:
                if hero2.life > 0 {
                    hero2.life -= 15
                    if hero2.life > 0 {
                        print("\n\(player.name) attaque !" + "\(hero2.name) n'a plus que  \(hero2.life) de vie !")
                    } else {
                        print("\n\(player.name) attaque !" + "\(hero2.name) est mort!")
                    }
                }else {
                    print("\n\(hero2.name) est déja mort dommage !")
                }
            case .guerrier:
                if hero2.life > 0 {
                    hero2.life -= 25
                    if hero2.life > 0 {
                        print("\n\(player.name) attaque !" + "\(hero2.name) n'a plus que  \(hero2.life) de vie !")
                    } else {
                        print("\n\(player.name) attaque !" + "\(hero2.name) est mort!")
                    }
                }else {
                    print("\n\(hero2.name) est déja mort dommage !")
                }
            case .espion:
                if hero2.life > 0 {
                    hero2.life -= 10
                    if hero2.life > 0 {
                        print("\n\(player.name) attaque !" + "\(hero2.name) n'a plus que  \(hero2.life) de vie !")
                    } else {
                        print("\n\(player.name) attaque !" + "\(hero2.name) est mort!")
                    }
                }else {
                    print("\n\(hero2.name) est déja mort dommage !")
                }
            case .magicien:
                if hero2.life > 0 {
                    hero2.life += 10
                    if hero2.life > 0 {
                        print("\n\(player.name) soigne !" + " \(hero2.name) a \(hero2.life) !")
                    } else {
                        print("\n\(player.name) soigne" + "\(hero2.name),mais il est déjà mort!")
                    }
                }else {
                    print("\(hero2.name) est déja mort dommage !")
                }
            case .MONSTRE:
                if hero2.life > 0 {
                    hero2.life -= 35
                    if hero2.life > 0 {
                        print("\n\(player.name) attaque !" + "\(hero2.name) n'a plus que  \(hero2.life) de vie !")
                    } else {
                        print("\n\(player.name) attaque !" + "\(hero2.name) est mort!")
                    }
                }else {
                    print("\n\(hero2.name) est déja mort dommage !")
                }
            default :
                print("erreur dans la fonction attaque() de la classe Game")
            }
        }
    }
}
