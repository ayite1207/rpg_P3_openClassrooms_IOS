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
        
    }
    
    func presentation(){
        print("Je suis un monstre!!")
    }
    
    override func heroTechnics(player: Player){
        var bonChoix = true
        fight += 1
        if player.round >= 3 {
            while bonChoix == true {
                print("Ton espion à acquis de l'experience, tu as débloqué COUP FATAL  !"
                    + "\n 1. ATTACK NORMAL 2. COUP FATAL")
                if let choix = readLine(){
                    switch choix {
                    case "1":
                        typeOfAttack = 1
                        bonChoix = false
                    case "2":
                        typeOfAttack = 2
                        bonChoix = false
                    default:
                        print("Je ne cromprend pas ton choix !")
                        bonChoix = true
                    }
                }
            }
        } else {
            typeOfAttack = 1
        }
    }
    
    override func whatTechnic(player2: Player, heroPlayer2 : Hero, typeOfTechnic: Int){
        switch typeOfTechnic {
        case 1:
            normalAttack(player2: player2, heroPlayer2 : heroPlayer2)
        case 2:
            superAttack(player2: player2, heroPlayer2 : heroPlayer2)
        default:
            print("erreur dans la fonction whatTechnic !!!!")
        }
    }
    
    override func normalAttack(player2: Player, heroPlayer2 : Hero){
        var bonChoix = true
        print("JE SUIS DANS LA FONCTION ATTACK normal DE LA CLASSE MONSTRE!!!!!!!")
        print("ROUND N° \(player2.round)")
        while bonChoix == true {
            if heroPlayer2.life > 0 {
                heroPlayer2.life -= attack
                heroPlayer2.defense += 1
                if heroPlayer2.life > 0 {
                    print("\n\(name!) attaque ! \(heroPlayer2.name!) perd \(attack) point de vie !"
                        + "\(heroPlayer2.name!) n'a plus que \(heroPlayer2.life) de vie !")
                    bonChoix = false
                } else {
                    heroPlayer2.life = 0
                    print("\n\(name!) attaque !" + "\(heroPlayer2.name!) est mort!")
                    bonChoix = false
                }
            }else {
                heroPlayer2.life = 0
                print("\n\(heroPlayer2.name!) est déja mort dommage !")
                bonChoix = false
            }
        }
    }
    
    func superAttack(player2: Player, heroPlayer2 : Hero){
        print("JE SUIS DANS LA FONCTION SUPER ATTACK DE LA CLASSE MONSTRE   !!!!!!!")
        if heroPlayer2.life > 0 {
            let superAttack = attack * 2
            heroPlayer2.life -= superAttack
            heroPlayer2.defense += 1
            print("MAGIE ! \(heroPlayer2.name!) perd \(superAttack) point de vie !"
                + "\(heroPlayer2.name!) n'a plus que \(heroPlayer2.life) de vie !")
            if heroPlayer2.life < 0 {
                heroPlayer2.life = 0
                print("\n\(name!) attaque !" + "\(heroPlayer2.name!) est mort!")
            }
        }else {
            heroPlayer2.life = 0
            print("\n\(heroPlayer2.name!) est déja mort dommage !")
        }
    }
}
