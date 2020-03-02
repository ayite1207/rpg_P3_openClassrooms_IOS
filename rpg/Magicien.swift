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
        setName(name: name)
    }
    
    func presentation(){
        print("Je suis un magicien!!")
    }
    
    /**
       - coffre() return a number between 1 and 3
     */
    
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
                    + "\n 1. JETER UN SORS 2. SORS ULTRA PUISSANT!")
                if player.getOrdi() == true{
                    setSuperAttack(superAttack: 1)
                    setTypeOfAttack(typeOfAttack: 2)
                    print("\(player.getName()) choisi le SORS ULTRA PUISSANT !!")
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
    
    override func whatTechnic(player2: Player, heroPlayer2 : Hero, typeOfTechnic: Int){
        switch typeOfTechnic {
        case 1:
            normalAttack(heroPlayer2 : heroPlayer2)
        case 2:
            superAttack(player2: player2, heroPlayer2 : heroPlayer2)
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
        print("JE SUIS DANS LA FONCTION ATTACK normal DE LA CLASSE Magicien!!!!!!!")
        while bonChoix == true {
            if heroPlayer2.getLife() > 0 {
                heroPlayer2.setLife(life: getAttack())
                heroPlayer2.setDefense(defense: 1)
                if heroPlayer2.getLife() > 0 {
                    print("\nABRACADABRA ! \(heroPlayer2.getName()) perd \(getAttack()) point de vie !"
                        + "\(heroPlayer2.getName()) n'a plus que \(heroPlayer2.getLife()) de vie !")
                    bonChoix = false
                } else {
                    heroPlayer2.setLife(life: 0)
                    print("\nnABRACADABRA !" + "\(heroPlayer2.getName()) est mort!")
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
    
    func superAttack(player2: Player, heroPlayer2 : Hero){
        print("Super ATTAQUE tour de Magie !!!!!" + "\nMerlin attaque tous les enemis vivants !!!!")
        let player2HeroTab = player2.getWarriorsPlayers()
        for i in 0...2{
            if player2HeroTab[i].getLife() > 0 {
                   let superAttack = 20
                   player2HeroTab[i].setLife(life: superAttack)
                   player2HeroTab[i].setDefense(defense: 1)
                if player2HeroTab[i].getLife() > 0 {
                    print("MAGIE ! \(player2HeroTab[i].getName()) perd \(superAttack) point de vie !"
                        + "\(player2HeroTab[i].getName()) n'a plus que \(player2HeroTab[i].getLife()) de vie !")
                }else {
                       player2HeroTab[i].setLife(life: 0)
                       print("\n\(getName()) attaque !" + "\(heroPlayer2.getName()) est mort!")
                   }
               }else {
                   player2HeroTab[i].setLife(life: 0)
                   print("\n\(heroPlayer2.getName()) est déja mort dommage !")
               }
        }
    }
}
