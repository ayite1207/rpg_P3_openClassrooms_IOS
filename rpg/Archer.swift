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
    
    override func attack(player2: Player, heroPlayer2 : Hero){
        var bonChoix = true
        print("JE SUIS DANS LA FONCTION ATTACK DE LA CLASSE ARCHER!!!!!!!")
        print("ROUND N° \(player2.round)")
        while bonChoix == true {
            if player2.round >= 2 {
                print("Ton archer à acquis de l'experience veux utiliser son attaque cloche !")
                if let choix = readLine(){
                    switch choix {
                    case "1":
                        superAttack(player2: player2, heroPlayer2 : heroPlayer2)
                        bonChoix = false
                    case "2":
                        if heroPlayer2.life > 0 {
                            heroPlayer2.life -= self.attack
                            heroPlayer2.defense += 1
                            self.fight += 1
                            if heroPlayer2.life > 0 {
                                print("\n\(self.name!) attaque ! \(heroPlayer2.name!) perd \(self.attack) point de vie !"
                                    + "\(heroPlayer2.name!) n'a plus que \(heroPlayer2.life) de vie !")
                            bonChoix = false
                            } else {
                                heroPlayer2.life = 0
                                print("\n\(self.name!) attaque !" + "\(heroPlayer2.name!) est mort!")
                            bonChoix = false
                            }
                        }else {
                            heroPlayer2.life = 0
                            print("\n\(heroPlayer2.name!) est déja mort dommage !")
                            bonChoix = false
                        }
                    default:
                        print("Je ne cromprend pas ton choix !")
                        bonChoix = true
                    }
                }
            } else {
                if heroPlayer2.life > 0 {
                    heroPlayer2.life -= self.attack
                    heroPlayer2.defense += 1
                    self.fight += 1
                    if heroPlayer2.life > 0 {
                        print("\n\(self.name!) attaque ! \(heroPlayer2.name!) perd \(self.attack) point de vie !"
                            + "\(heroPlayer2.name!) n'a plus que \(heroPlayer2.life) de vie !")
                        bonChoix = false
                    } else {
                        heroPlayer2.life = 0
                        print("\n\(self.name!) attaque !" + "\(heroPlayer2.name!) est mort!")
                        bonChoix = false
                    }
                }else {
                    heroPlayer2.life = 0
                    print("\n\(heroPlayer2.name!) est déja mort dommage !")
                    bonChoix = false
                }
            }
        }
    }
    
    func superAttack(player2: Player, heroPlayer2 : Hero){
        
    }
}
