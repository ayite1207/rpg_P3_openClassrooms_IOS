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
 
    - Properties:
        - name: the name of the héro selected
        -  cate: the category of the hero selected (archer, guerrier etc )
        -  care: the number of points which make it possible to treat someone
        -  attack: the number of points which make it possible to attack someone
        -  fight: the number of time a hero fight
        -  defense: the number of time a hero defense
        -  typeOfAttack: the type of attack a hero choose to use

    -  Enum:
        -  Cate: lets choose the type of héro

    - Méthods:
        - init(cate: Cate) : obligate to insert a parametre of type Cate for create an intance of the class hero
        - initialization(cate: Cate): withe the parametre Cate, allows to initialate properties cate , name, life, attack
        - heroTechnic(player: Player) allows to choose  what technique can be used in fonction of the number of rounds
        - whatTechnic(player2: Player, heroPlayer2 : Hero, typeOfTechnic: Int) call the function corresponding to the chosen attack
        - normalAttack(player2: Player, heroPlayer2 : Hero) allows to make a basic attaque
*/
class Hero{
    var name: String?
    var type: String?
    var life: Int = 0
    var care = 0
    var attack = 0
    var fight: Int = 0
    var defense: Int = 0
    var typeOfAttack = 0
    var normalAttack = 0
    var superAttack = 0
    var coffreMagique = 0
    enum Cate{
        case archer,guerrier, espion,magicien, MONSTRE
    }
    
    init(cate: Cate) {
        initialization(cate: cate)
    }
    
    func initialization(cate: Cate){
        switch cate {
        case .archer:
            name = "Green"
            life = 100
            attack = 20
            type = "L'Archer"
        case .guerrier:
            name = "Conan"
            life = 100
            attack = 35
            type = "Le Guerrier"
        case .espion:
            name = "Ninja"
            life = 100
            attack = 20
            type = "L'Espion"
        case .magicien:
            name = "Jafar"
            life = 80
            attack = 10
            care = 20
            type = "Le Mage"
        case .MONSTRE:
            name = "Albus"
            life = 80
            attack = 45
            type = "Le Monstre"
        }
    }
    
    func heroTechnics(player: Player){
        print("je suis dans la fonction hero technic DE LA CLASSE HERO")
    }

    func whatTechnic(player2: Player, heroPlayer2 : Hero, typeOfTechnic: Int){
        print("je suis dans la fonction whatTechnic DE LA CLASSE HERO")
    }
    
    func normalAttack(player2: Player, heroPlayer2 : Hero){
         print("je suis dans la fonction normalAttack DE LA CLASSE HERO")
    }
    
}

