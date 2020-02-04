//
//  main.swift
//  rpg
//
//  Created by ayite  on 30/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation
var game: Game?

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
             game = Game(namePlayer1: nameP1, namePlayer2: "Ordi",soloOuPas: "1")
        case "2":
            print("La bagarre entre amis il n'y a que ca de vrai !"
                + "\nJoueur 2 presentes toi !")
            if let namePlayer2 = readLine(){
                let nameP2 = namePlayer2
                print("Vous devez avoir chacun trois Héros pour vous foutres dessus")
                game = Game(namePlayer1: nameP1, namePlayer2: nameP2,soloOuPas: "2")
            }
        default :
        print("tu begailles ma parole !")
        }
    }
    
    print("\n\nQUE LA BATAILLE COMMENCE\n\n")
    if game!.player1?.round == game!.player1?.round{
        print((game!.player1?.name)! + " choisi un de tes heros!"
            + "\n1. \(game!.player1!.warriorsPlayer[0].name!)"
            + "\n2. \(game!.player1!.warriorsPlayer[1].name!)"
            + "\n3. \(game!.player1!.warriorsPlayer[2].name!)")
        if let hero1 = readLine(){
            let heroAttaque = game!.player1!.warriorsPlayer[Int(hero1)!]
            print("Qui veux tu attaquer ?"
                + "\n1. \(game!.player2!.warriorsPlayer[0].name!)"
                + "\n2. \(game!.player2!.warriorsPlayer[1].name!)"
                + "\n3. \(game!.player2!.warriorsPlayer[2].name!)")
            if let hero2 = readLine() {
                 let heroAttaque2 = game!.player2!.warriorsPlayer[Int(hero2)!]
                 game?.round(SoigneouAttaque: heroAttaque, estSoignéouAttaqueé: heroAttaque2)
            }
        }
    }
}






