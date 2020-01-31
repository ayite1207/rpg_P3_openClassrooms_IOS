//
//  main.swift
//  rpg
//
//  Created by ayite  on 30/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation
func createHeros(name : String)-> [Hero]{
    var heroTable : [Hero] = []
    var heroTypeTable : [Hero.Cate] = []
    let sentenceTable = ["Fais ton premier choix","HA HA !tres bon choix" + "\nFais ton second choix", "Fais ton dernier choix !!!"]
    
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
    return heroTable
}
func creatPlayers()-> [Player]{
    var nameP1 : String?
    var nameP2 : String?
    var player1 : Player
    var heroTab : [Hero] = []
    var joueurTab : [Player] = []
    print("\nHA HA Un nouveau guerrier est la !!!"
        + "\nQu'elle est ton nom ?")
    if let namePlayer1 = readLine() {
        nameP1 = namePlayer1
        print("Bienvenue toi \(namePlayer1)")
        print("Es tu avec un autre guerrier ou "
            + "\nveux tu te frotter a notre ORDI TUEUR"
            + "\n1.SOLO / 2.AMIGO")
        if let soloOuPas = readLine(){
            switch soloOuPas {
            case "1" :
                print("Tu choisis de venir seul ! COURAGEUX")
                print("Tu dois avoir trois guerriers dans ton équipe")
                heroTab = createHeros(name : nameP1!)
                player1 = Player(name: nameP1!, numberOfPlayers: 1,warriors1: heroTab[0], warriors2: heroTab[1], warriors3: heroTab[2])
                joueurTab.append(player1)
                print("Félicitation tu possedes tes trois héros."
                    + "\n Commencons la partie")
            case "2" :
                print("La bagarre entre amis il n'y a que ca de vrai !"
                    + "Joueur 2 presentes toi !")
                if let namePlayer2 = readLine(){
                    nameP2 = namePlayer2
                }
            default :
                print("tu begailles ma parole !")
            }
        }
    }
    return joueurTab
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
        var player1 = creatPlayers()
        //    var newGame = Game(player1 : player1,player2 : player2)
        //    newGame.begining()
    // newGame.round()
    default :
        print("Je n'ai pas compris la réponse")
    }
}


