//
//  Magicien.swift
//  rpg
//
//  Created by ayite  on 31/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class Magicien: Hero{
    
    init(name: String){
        super.init(cate: .magicien)
        self.name = name
    }
    
    func presentation(){
        print("Je suis un magicien!!")
    }
    
    override func heroTechnics(player: Player){
        var bonChoix = true
        self.fight += 1
        if player.round >= 3 {
            while bonChoix == true {
                print("Ton MAGE à acquis de l'experience, tu as débloqué tour de MAGIE  !"
                    + "\n 1. ATTACK NORMAL 2. TOUR DE MAGIE")
                if let choix = readLine(){
                    switch choix {
                    case "1":
                        normalAttack += 1
                        typeOfAttack = 1
                        bonChoix = false
                    case "2":
                        superAttack += 1
                        typeOfAttack = 2
                        bonChoix = false
                    default:
                        print("Je ne cromprend pas ton choix !")
                        bonChoix = true
                    }
                }
            }
        } else {
            normalAttack += 1
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
        print("JE SUIS DANS LA FONCTION ATTACK normal DE LA CLASSE Magicien!!!!!!!")
        print("ROUND N° \(player2.round)")
        while bonChoix == true {
            if heroPlayer2.life > 0 {
                heroPlayer2.life -= attack
                heroPlayer2.defense += 1
                if heroPlayer2.life > 0 {
                    print("\nABRACADABRA ! \(heroPlayer2.name!) perd \(attack) point de vie !"
                        + "\(heroPlayer2.name!) n'a plus que \(heroPlayer2.life) de vie !")
                    bonChoix = false
                } else {
                    heroPlayer2.life = 0
                    print("\nnABRACADABRA !" + "\(heroPlayer2.name!) est mort!")
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
        print("JE SUIS DANS LA FONCTION SUPER ATTACK DE LA CLASSE MageICIEN   !!!!!!!")
        print("Super ATTAQUE tour de Magie !!!!!" + "\nJAFAR attaque tous les enemis vivants !!!!")
        for i in 0...2{
            if player2.warriorsPlayer[i].life > 0 {
                   let superAttack = 20
                   player2.warriorsPlayer[i].life -= superAttack
                   player2.warriorsPlayer[i].defense += 1
                if player2.warriorsPlayer[i].life > 0 {
                    print("MAGIE ! \(player2.warriorsPlayer[i].name!) perd \(superAttack) point de vie !"
                        + "\(player2.warriorsPlayer[i].name!) n'a plus que \(player2.warriorsPlayer[i].life) de vie !")
                }else {
                       player2.warriorsPlayer[i].life = 0
                       print("\n\(name!) attaque !" + "\(heroPlayer2.name!) est mort!")
                   }
               }else {
                   player2.warriorsPlayer[i].life = 0
                   print("\n\(heroPlayer2.name!) est déja mort dommage !")
               }
        }
    }
}
