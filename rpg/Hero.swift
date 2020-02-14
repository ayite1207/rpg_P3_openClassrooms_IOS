//
//  Hero.swift
//  rpg
//
//  Created by ayite  on 30/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation
class Hero{
    var name: String?
    var cate: Cate?
    var type: String?
    var life: Int = 0
    var care = 0
    var attack = 0
    var fight: Int = 0
    var defense: Int = 0
    
    enum Cate{
        case archer,guerrier, espion,magicien, MONSTRE
    }
    
    init(cate: Cate) {
        self.cate = cate
        initialization(cate: cate)
    }
    
    func initialization(cate: Cate){
        switch cate {
        case .archer:
            self.cate = .archer
            name = "Green"
            life = 100
            attack = 20
            type = "archer"
        case .guerrier:
            self.cate = .guerrier
            name = "Conan"
            life = 100
            attack = 35
            type = "guerrier"
        case .espion:
            self.cate = .espion
            name = "Ninja"
            life = 100
            attack = 20
            type = "espion"
        case .magicien:
            self.cate = .magicien
            name = "Jafar"
            life = 80
            attack = 10
            care = 20
            type = "magicien"
        case .MONSTRE:
            self.cate = .MONSTRE
            name = "Albus"
            life = 80
            attack = 45
            type = "Monstre"
        }
    }
    
    func attack(player2: Player, heroPlayer2 : Hero){
        print("JE SUIS DANS LA FONCTION ATTACK DE LA CLASSE HERO!!!!!!!")
        if heroPlayer2.life > 0 {
            heroPlayer2.life -= self.attack
            heroPlayer2.defense += 1
            self.fight += 1
            if heroPlayer2.life > 0 {
                print("\n\(self.name!) attaque ! \(heroPlayer2.name!) perd \(self.attack) point de vie !"
                    + "\(heroPlayer2.name!) n'a plus que \(heroPlayer2.life) de vie !")
            } else {
                heroPlayer2.life = 0
                print("\n\(self.name!) attaque !" + "\(heroPlayer2.name!) est mort!")
            }
        }else {
            heroPlayer2.life = 0
            print("\n\(heroPlayer2.name!) est déja mort dommage !")
        }
    }
    
    func superAttack(){
        
    }
}

