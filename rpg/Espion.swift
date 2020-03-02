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
        setName(name: name)
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
    
    override func heroTechnics(player: Player){
        let leCoffre = coffre()
        let coffre1 = coffre()
        setFight(fight: 1)
        var bonChoix = true
        if coffre1 >= leCoffre {
            while bonChoix == true {
                print("Un COFFRE apparait, Choisi une nouvelle arme !"
                    + "\n 1. COUTEAU 2. POISON")
                if player.getOrdi() == true{
                    setSuperAttack(superAttack: 1)
                    setTypeOfAttack(typeOfAttack: 2)
                    print("\(player.getName()) choisi le POISON !!")
                    bonChoix = false
                } else {
                    if let choix = readLine(){
                         switch choix {
                         case "1":
                             setNormalAttack(normalAttack: 1)
                             setTypeOfAttack(typeOfAttack: 1)
                             bonChoix = false
                         case "2":
                             setSuperAttack(superAttack: 1)
                             setTypeOfAttack(typeOfAttack: 2)
                             bonChoix = false
                         default:
                             print("Je ne cromprend pas ton choix !")
                             bonChoix = true
                         }
                     }
                }
            }
        } else {
            setNormalAttack(normalAttack: 1)
            setTypeOfAttack(typeOfAttack: 1)
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
            if heroPlayer2.getLife() > 0 {
                heroPlayer2.setLife(life: getAttack())
                heroPlayer2.setDefense(defense: 1)
                if heroPlayer2.getLife() > 0 {
                    print("\n\(heroPlayer2.getName()) perd \(getAttack()) point de vie !"
                        + "\(heroPlayer2.getName()) n'a plus que \(heroPlayer2.getLife()) de vie !")
                    bonChoix = false
                } else {
                    heroPlayer2.setLife(life: 0)
                    print("\(heroPlayer2.getName()) est mort!")
                    bonChoix = false
                }
            }else {
                heroPlayer2.setLife(life: 0)
                print("\n\(heroPlayer2.getName()) est déja mort dommage !")
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
        if heroPlayer2.getLife() > 0 {
            let superAttack = getAttack() + 10
            heroPlayer2.setLife(life: superAttack)
            heroPlayer2.setDefense(defense: 1)
            if heroPlayer2.getLife() > 0{
                print("ATTAQUE POISON VICIEUX ! \(heroPlayer2.getName()) perd \(superAttack) point de vie !"
                    + "\(heroPlayer2.getName()) n'a plus que \(heroPlayer2.getLife()) de vie !")
            }else {
                heroPlayer2.setLife(life: 0)
                print("\nBOOM ! \(getName()) attaque !" + "\(heroPlayer2.getName()) est mort!")
            }
        }else {
            heroPlayer2.setLife(life: 0)
            print("\n LE POISON À FAIT EFFET PLUS VITE QUE PRÉVUE !\(heroPlayer2.getName()) est déja mort dommage !")
        }
    }
}

