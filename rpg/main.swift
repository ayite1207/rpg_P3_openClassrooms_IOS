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

print("\nBienvenue dans le BATTLE ROYALE")

print("\nQu'elle est ton nom jeune guerrier ?\n")
if let namePlayer1 = readLine() {
    let nameP1 = namePlayer1
    print("===============================")
    print("     Bienvenue toi \(namePlayer1)")
    print("===============================")
    print("\nEs tu venu avec un autre guerrier ou "
        + "\nveux tu te frotter a notre ORDI TUEUR"
        + "\n\n1.SOLO / 2.AMIGO\n")
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
    
    let player1 = game?.player1
    let player2 = game?.player2
    print("=============================")
    print("\nQUE LA BATAILLE COMMENCE\n")
    print("=============================")
    var continu = true
    game!.player1?.round += 1
    game!.player2?.round += 1
    
    while continu {
        if player1?.round == player2?.round{
            print("\nround \((player1?.round)!)")
            print("---------------------------\n")
             player1?.round += 1
            print((player1?.name)! + " choisi un de tes heros!"
                + "\n1. \(player1!.warriorsPlayer[0].name!)"
                + "     2. \(player1!.warriorsPlayer[1].name!)"
                + "     3. \(player1!.warriorsPlayer[2].name!)")
            if let hero1 = readLine(){
                let hero = Int(hero1)! - 1
                let heroAttaque = player1!.warriorsPlayer[hero]
                print("Qui veux tu attaquer ?"
                    + "\n1. \(player2!.warriorsPlayer[0].name!)"
                    + "     2. \(player2!.warriorsPlayer[1].name!)"
                    + "     3. \(player2!.warriorsPlayer[2].name!)")
                if let hero2 = readLine() {
                    let hero3 = Int(hero2)! - 1
                    let heroDefence = player2!.warriorsPlayer[hero3]
                    game?.attaque(player: player1!, hero1: heroAttaque, hero2: heroDefence)
                }
            }
        } else {
            player2?.round += 1
            print("\(player2!.name) choisi un de tes heros!\n"
                + "\n1. \(player2!.warriorsPlayer[0].name!)"
                + "     2. \(player2!.warriorsPlayer[1].name!)"
                + "     3. \(player2!.warriorsPlayer[2].name!)")
            if let hero1 = readLine(){
                let hero1P2 = Int(hero1)! - 1
                let heroAttaqueP2 = player2!.warriorsPlayer[hero1P2]
                print("Qui veux tu attaquer ?"
                    + "\n1. \(player1!.warriorsPlayer[0].name!)"
                    + "     2. \(player1!.warriorsPlayer[1].name!)"
                    + "     3. \(player1!.warriorsPlayer[2].name!)")
                if let hero2 = readLine() {
                    let hero2P1 = Int(hero2)! - 1
                    let heroDefense2 = player1!.warriorsPlayer[hero2P1]
                    game?.attaque(player: player2!, hero1: heroAttaqueP2, hero2: heroDefense2)
                }
            }
            game?.displayHeroLife(hero1: player1!,hero2: player2! )
        }
    }
}






