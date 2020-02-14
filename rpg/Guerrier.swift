//
//  Guerrier.swift
//  rpg
//
//  Created by ayite  on 31/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class Guerrier: Hero{
    
    init(){
           super.init(cate: .guerrier)
           presentation()
       }

       func presentation(){
           print("Je suis un guerrier!!")
       }
    
    override func heroTechnic(player: Player){
       var bonChoix = true
       self.fight += 1
       if player.round >= 2 {
           while bonChoix == true {
               print("Ton archer à acquis de l'experience, tu as débloqué COUP D'ÉPÉ SURPUISSANT !"
                   + "\n 1. ATTACK NORMAL 2. SUPER ATTACK")
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
       print("JE SUIS DANS LA FONCTION ATTACK normal DE LA CLASSE GUERRIER!!!!!!!")
       print("ROUND N° \(player2.round)")
       while bonChoix == true {
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
   
   func superAttack(player2: Player, heroPlayer2 : Hero){
       print("JE SUIS DANS LA FONCTION SUPER ATTACK DE LA CLASSE GUERRIER!!!!!!!")
       if heroPlayer2.life > 0 {
           let superAttack = attack * 2
           heroPlayer2.life -= superAttack
           heroPlayer2.defense += 1
           fight += 1
           print("COUPS D ÉPÉ SURPUISSANT! \(heroPlayer2.name!) perd \(superAttack) point de vie !"
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
