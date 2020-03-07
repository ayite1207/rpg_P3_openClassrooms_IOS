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
        - normalAttack: count the number of time who normalAttack is used
        -  superAttack: count the number of time who superAttack is used
        -  coffreMagique: the type of attack a hero coffreMagique to use

    -  Enum:
        -  Cate: lets choose the type of héro

    - Méthods:
      
        - whatTechnic(player2: Player, heroPlayer2 : Hero, typeOfTechnic: Int) call the function corresponding to the chosen attack
        - normalAttack(player2: Player, heroPlayer2 : Hero) allows to make a basic attaque
*/
class Hero{
    private var name: String?
    private var type: String?
    private var life: Int = 0
    private var care = 0
    private var typeCate: Cate?
    private var attack = 0
    private var fight: Int = 0
    private var defense: Int = 0
    private var typeOfAttack = 0
    private var normalAttack = 0
    private var superAttack = 0
    private var numbOfCare = 0
    private var coffreMagique = 0
    
    enum Cate{
        case archer,guerrier, espion,magicien, MONSTRE
    }
    /**
     Méthods:
     - init(cate: Cate) : obligate to insert a parametre of type Cate for create an intance of the class hero

     */
    init(cate: Cate) {
        initialization(cate: cate)
    }
    /**
      func - initialization(cate: Cate): withe the parametre Cate, allows to initialate properties cate , name, life, attack
     
      - Parameters:
       - cate : allows to initialate the settings of tha Class Hero
     */
    func initialization(cate: Cate){
        switch cate {
        case .archer:
            name = "Green"
            life = 100
            attack = 20
            typeCate = .archer
            type = "L'Archer"
        case .guerrier:
            name = "Conan"
            life = 100
            attack = 35
            typeCate = .guerrier
            type = "Le Guerrier"
        case .espion:
            name = "Ninja"
            life = 100
            attack = 20
            care = 15
            typeCate = .espion
            type = "L'Espion"
        case .magicien:
            name = "Jafar"
            life = 80
            attack = 10
            care = 20
            typeCate = .magicien
            type = "Le Mage"
        case .MONSTRE:
            name = "Albus"
            life = 80
            attack = 45
            typeCate = .MONSTRE
            type = "Le Monstre"
        }
    }
    
    /**
       - heroTechnic() allows to choose  what technique can be used
     */
    
    func heroTechnics(player: Player){
        print("je suis dans la fonction hero technic DE LA CLASSE HERO")
    }
    
    func carLife(life: Int){
       if life == 0{
           self.life = 0
       }else {
           self.life += life
       }
    }
    
    func care(hero : Hero){
        hero.carLife(life: 15)
        print("\(hero.getName()) a 15 points de vie en plus !!")
    }
    
    /**
     function get allows to acces  properties
     */
    func getName()->String{
        return name!
    }
    
    func getType()->String{
        return type!
    }
    
    func getLife()->Int{
        return life
    }
    
    func getCare()->Int{
        return care
    }
    
    func getTypeCate()->Cate{
        return typeCate!
    }
    
    func getAttack()->Int{
        return attack
    }
    
    func getFight()->Int{
        return fight
    }
    
    func getDefense()->Int{
        return defense
    }
    
    func getTypeOfAttack()->Int{
        return typeOfAttack
    }
    
    func getNormalAttack()->Int{
        return normalAttack
    }
    
    func getSuperAttack()->Int{
        return superAttack
    }
    
    func getCoffreMagique()->Int{
        return coffreMagique
    }
    
    func getNumbOfCare()->Int{
        return numbOfCare
    }
    
    /**
     function set allows to change  properties
     */
    func setName(name: String){
        self.name = name
     }
     
    func setType(type: String){
        self.type = type
     }
     
    func setLife(life: Int){
        if life == 0{
            self.life = 0
        }else {
            self.life -= life
        }
     }
     
    func setCare(care: Int){
        self.care = care
     }
     
    func setFight(fight: Int){
        self.fight += fight
     }
     
    func setDefense(defense: Int){
        self.defense += defense
     }
     
    func setTypeOfAttack(typeOfAttack: Int){
        self.typeOfAttack =  typeOfAttack
     }
     
    func setNormalAttack(normalAttack: Int){
        self.normalAttack += normalAttack
     }
     
    func setSuperAttack(superAttack: Int){
        self.superAttack += superAttack
     }
    
    func setNumbOfCare(numbOfCare: Int){
        self.numbOfCare += numbOfCare
    }
    /**
     Call the function corresponding to the chosen attack
        
     ```
     Archer.whatTechnic(player2: player1, heroPlayer2 : Archer, typeOfTechnic: 1)
     ```
     - Parameters:
        - player2 : the player who will be attacked
        - heroPlayer2 :the hero who will attack
        - typeOfTechnic : the type of attack used
    */
    
    func whatTechnic(player2: Player, heroPlayer2 : Hero, typeOfTechnic: Int){
        print("je suis dans la fonction whatTechnic DE LA CLASSE HERO")
    }
    /**
     Allows to attack the hero selected in parameters
      
      ```
      Archer.normalAttack(heroPlayer2 : Archer)
      ```
      
     - Parameters:
          - heroPlayer2: hero who will be attacked
     */
    func normalAttack( heroPlayer2 : Hero){
         print("je suis dans la fonction normalAttack DE LA CLASSE HERO")
    }
    
}

