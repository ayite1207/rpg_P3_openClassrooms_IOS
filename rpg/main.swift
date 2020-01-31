//
//  main.swift
//  rpg
//
//  Created by ayite  on 30/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

func creatPlayer()-> Player{
    var name : String = ""
    var player1 : Player
    var heroTable : [Hero] = []
    var heroTypeTable : [Hero.Cate] = []
    let sentenceTable = ["Fais ton premier choix","HA HA !tres bon choix" + "\nFais ton second choix", "Fais ton dernier choix !!!"]
    print("\nHA HA Un nouveau guerrier est la !!!"
        + "\nQu'elle est ton nom ?")
    if let namePlayer1 = readLine() {
        name = namePlayer1
        print("Bienvenue toi \(namePlayer1)")
        print("\(namePlayer1) es tu avec un autre guerrier ou "
            + "\nveux tu te frotter a notre ORDI TUEUR"
            + "\n1.SOLO / 2.AMIGO")
        if let soloOuPas = readLine(){
            switch soloOuPas {
            case "1" :
                print("Choisi trois guerriers")
                for i in 0...2{
                    print("\n\(sentenceTable[i])"
                        + "\n 1. L'archer"
                        + "\n 2. Le guerrier"
                        + "\n 3. L'espion"
                        + "\n 4. Le magicien"
                        + "\n 5. Le MONSTRE")
                    if let firsChoice = readLine() {
                        switch firsChoice {
                        case "1":
                            heroTypeTable.append(.archer)
                        case "2":
                            heroTypeTable.append(.guerrier)
                        case "3":
                            heroTypeTable.append(.espion)
                        case "4":
                            heroTypeTable.append(.magicien)
                        case "5":
                            heroTypeTable.append(.MONSTRE)
                        default:
                            print("Je n'ai pas compris la réponse")
                        }
                        print(heroTypeTable[i])
                    }
                    let hero = Hero(cate: heroTypeTable[i])
                    heroTable.append(hero)
                }
            case "2" :
                print("la bagarre entre amis il n'y a que ca de vrai")
            default :
                print("tu begailles ma parole !")
            }
        }
        
        
    }
    player1 = Player(name: name, numberOfPlayers: 1,warriors1: heroTable[0], warriors2: heroTable[1], warriors3: heroTable[2])
    print("Félicitation tu possedes tes trois héros."
        + "\n Commencons la partie")
    return player1
}



print("\n----------------------------------------")
print("           BATTLE ROYALE")
print("----------------------------------------")

print("         Créé ton personnage !"
    + "   \n              OUI / NON")
if let answer = readLine(){
    switch answer {
    case "NON":
        print("\nQue les faibles quittent cette arène!!!")
    case "OUI":
        var player1 = creatPlayer()
        //    var newGame = Game(player1 : player1,player2 : player2)
        //    newGame.begining()
    // newGame.round()
    default :
        print("Je n'ai pas compris la réponse")
    }
}


