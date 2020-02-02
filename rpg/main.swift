//
//  main.swift
//  rpg
//
//  Created by ayite  on 30/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation
func createHeros(name : String, compteur: Int,sentenceTable: [String])-> Hero{
    let hero: Hero
    var heroType : Hero.Cate?
    print("\n\(sentenceTable[compteur])"
        + "\n 1. L'archer"
        + "\n 2. Le guerrier"
        + "\n 3. L'espion"
        + "\n 4. Le magicien"
        + "\n 5. Le MONSTRE")
    if let firsChoice = readLine() {
        switch firsChoice {
        case "1":
            heroType = .archer
        case "2":
            heroType = .guerrier
        case "3":
            heroType = .espion
        case "4":
            heroType = .magicien
        case "5":
            heroType = .MONSTRE
        default:
            print("Je n'ai pas compris la réponse")
        }
    }
    hero = Hero(cate: heroType!)
    return hero
}
func creatPlayers()-> [Player]{
    var nameP1 : String?
    var nameP2 : String?
    var player1 : Player
    var player2 : Player
    var heroTab1 : [Hero] = []
    var heroTab2 : [Hero] = []
    var joueurTab : [Player] = []
    var joueur2Tab : [Player] = []
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
                for i in 0...2 {
                    let sentenceTable = ["Fais ton premier choix","HA HA !tres bon choix \(nameP1)" + "\nFais ton second choix", "Fais ton dernier choix !!!"]
                    let heroPlayer1 = createHeros(name : nameP1!, compteur: i,sentenceTable: sentenceTable)
                    heroTab1.append(heroPlayer1)
                }
                player1 = Player(name: nameP1!, numberOfPlayers: 1,warriors1: heroTab1[0], warriors2: heroTab1[1], warriors3: heroTab1[2])
                joueurTab.append(player1)
                print("Félicitation tu possedes tes trois héros."
                    + "\n Commencons la partie")
            case "2" :
                print("La bagarre entre amis il n'y a que ca de vrai !"
                    + "Joueur 2 presentes toi !")
                if let namePlayer2 = readLine(){
                    nameP2 = namePlayer2
                    print("Vous devez avoir chacun trois Héros pour vous foutres dessus")
                    for i in 0...2 {
                        let sentencePlayer1Table = ["\(nameP1) Fais ton premier choix","HA HA !tres bon choix \(nameP1)" + "\nFais ton second choix", "\(nameP1) Fais ton dernier choix !!!"]
                        let heroPlayer1 = createHeros(name : nameP1!, compteur: i,sentenceTable: sentencePlayer1Table)
                        heroTab1.append(heroPlayer1)
                        let sentencePlayer2Table = ["\(nameP2) A ton tour, Fais ton premier choix","Bon choix \(nameP2)" + "\nFais ton second choix", "\(nameP2) Fais ton dernier choix !!!"]
                        let heroPlayer2 = createHeros(name : nameP2!, compteur: i,sentenceTable: sentencePlayer2Table)
                        heroTab1.append(heroPlayer2)
                    }
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


