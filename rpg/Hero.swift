//
//  Hero.swift
//  rpg
//
//  Created by ayite  on 30/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

/**
Class Hero : Mother Class wich allows to create the other Class of hero  (archer, guerrier etc ).
 
 Contain all properties and methods common to other classes
 
    - Propriétés:
        - name: the name of the héro selected
        -  cate: the category of the hero selected (archer, guerrier etc )
        -  care: the number of points which make it possible to treat someone
        -  attack: the number of points which make it possible to attack someone
        -  fight: the number of time a hero fight
        -  defense: the number of time a hero defense
        -  typeOfAttack: the type of attack a hero choose to use
    
    -  Enum:
        -  Cate: lets choose the type of héro
 
*/
class Hero{
    var name: String?
    var cate: Cate?
    var life: Int = 0
    var care = 0
    var attack = 0
    var fight: Int = 0
    var defense: Int = 0
    var typeOfAttack = 0
    
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
        case .guerrier:
            self.cate = .guerrier
            name = "Conan"
            life = 100
            attack = 35
        case .espion:
            self.cate = .espion
            name = "Ninja"
            life = 100
            attack = 20
        case .magicien:
            self.cate = .magicien
            name = "Jafar"
            life = 80
            attack = 10
            care = 20
        case .MONSTRE:
            self.cate = .MONSTRE
            name = "Albus"
            life = 80
            attack = 45
        }
    }
    
    func heroTechnic(player: Player){
        print("je suis dans la fonction hero technic DE LA CLASSE HERO")
    }

    func whatTechnic(player2: Player, heroPlayer2 : Hero, typeOfTechnic: Int){
        print("je suis dans la fonction whatTechnic DE LA CLASSE HERO")
    }
    
    func normalAttack(player2: Player, heroPlayer2 : Hero){
        print("JE SUIS DANS LA FONCTION ATTACK DE LA CLASSE HERO!!!!!!!")
        if heroPlayer2.life > 0 {
            heroPlayer2.life -= attack
            heroPlayer2.defense += 1
            if heroPlayer2.life > 0 {
                print("\n\(name!) attaque ! \(heroPlayer2.name!) perd \(attack) point de vie !"
                    + "\(heroPlayer2.name!) n'a plus que \(heroPlayer2.life) de vie !")
            } else {
                heroPlayer2.life = 0
                print("\n\(name!) attaque !" + "\(heroPlayer2.name!) est mort!")
            }
        }else {
            heroPlayer2.life = 0
            print("\n\(heroPlayer2.name!) est déja mort dommage !")
        }
    }
    
}

