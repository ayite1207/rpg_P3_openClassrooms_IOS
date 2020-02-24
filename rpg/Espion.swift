//
//  Espion.swift
//  rpg
//
//  Created by ayite  on 31/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class Espion: Hero{
    
    init(name: String){
        super.init(cate: .espion)
        self.name = name
    }
    
    func presentation(){
        print("Je suis un espion!!")
    }
    func coffre()-> Int{
        let numero: [Int] = [1,2,3]
        return numero.randomElement()!
    }
    
    /**
       - heroTechnic() allows to choose  what technique can be used
     */
    
    override func heroTechnics(){
        let leCoffre = coffre()
        let coffre1 = coffre()
        fight += 1
        var bonChoix = true
        if coffre1 >= leCoffre {
            while bonChoix == true {
                print("Un COFFRE apparait, Choisi une nouvelle arme !"
                    + "\n 1. COUTEAU 2. POISON")
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
    
    /**
     Call the function corresponding to the chosen attack
        
     ```
     Archer.whatTechnic(player2: player1, heroPlayer2 : Archer, typeOfTechnic: 1)
     ```
     - Parameters:
        - player2 : the player who will be attacked
        - heroPlayer :the hero who will attack
        - typeOfTechnic : the type of attack used
    */
    
    override func whatTechnic(player2: Player,heroPlayer2 : Hero, typeOfTechnic: Int){
        switch typeOfTechnic {
        case 1:
            normalAttack(heroPlayer2 : heroPlayer2)
        case 2:
            superAttack(heroPlayer2 : heroPlayer2)
        default:
            print("erreur dans la fonction whatTechnic !!!!")
        }
    }
    
    /**
     Allows to attack the hero selected in parameters
      
      ```
      Archer.normalAttack(heroPlayer2 : Archer)
      ```
      
     - Parameters:
          - heroPlayer2: hero who will be attacked
     */
    
    override func normalAttack(heroPlayer2 : Hero){
        var bonChoix = true
        print("JE SUIS DANS LA FONCTION ATTACK normal DE LA CLASSE ESPION!!!!!!!")
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
    
    /**
     Allows to attack whit a super attack the hero selected in parameters
      
      ```
      Archer.superAttack(heroPlayer2 : Archer)
      ```
      
     - Parameters:
          - heroPlayer2: hero who will be attacked
     */
    
    func superAttack(heroPlayer2 : Hero){
        print("JE SUIS DANS LA FONCTION SUPER ATTACK DE LA CLASSE EsPION   !!!!!!!")
        if heroPlayer2.life > 0 {
            let superAttack = attack * 2
            heroPlayer2.life -= superAttack
            heroPlayer2.defense += 1
            if heroPlayer2.life > 0{
                print("POISON VICIEUX ! \(heroPlayer2.name!) perd \(superAttack) point de vie !"
                    + "\(heroPlayer2.name!) n'a plus que \(heroPlayer2.life) de vie !")
            }else {
                heroPlayer2.life = 0
                print("\nLE POISON À FAIT EFFET PLUS VITE QUE PRÉVUE !" + "\(heroPlayer2.name!) est mort!")
            }
        }else {
            heroPlayer2.life = 0
            print("\n\(heroPlayer2.name!) est déja mort dommage !")
        }
    }
}
