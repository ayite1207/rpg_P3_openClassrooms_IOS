//
//  main.swift
//  rpg
//
//  Created by ayite  on 30/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation
var game: Game

print("\n----------------------------------------")
print("           BATTLE ROYALE")
print("----------------------------------------")

print("Bienvenue dans le BATTLE ROYALE")

print("\nQu'elle est ton nom jeune guerrier ?")
if let namePlayer1 = readLine() {
    let nameP1 = namePlayer1
    print("Bienvenue toi \(namePlayer1)")
    print("Es tu venu avec un autre guerrier ou "
        + "\nveux tu te frotter a notre ORDI TUEUR"
        + "\n1.SOLO / 2.AMIGO")
    if let soloOuPas = readLine(){
        switch soloOuPas {
        case "1":
            var game = Game(namePlayer1: nameP1, namePlayer2: "Ordi",soloOuPas: "1")
        case "2":
            print("La bagarre entre amis il n'y a que ca de vrai !"
                + "Joueur 2 presentes toi !")
            if let namePlayer2 = readLine(){
                let nameP2 = namePlayer2
                print("Vous devez avoir chacun trois Héros pour vous foutres dessus")
                game = Game(namePlayer1: nameP1, namePlayer2: nameP2,soloOuPas: "2")
            }
        default :
        print("tu begailles ma parole !")
        }
        
    }
}






