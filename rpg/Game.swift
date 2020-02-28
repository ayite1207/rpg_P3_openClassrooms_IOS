//
//  Game.swift
//  rpg
//
//  Created by ayite  on 31/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class Game{
    var player1 : Player?
    var player2 : Player?
    var heroName: [String] = []
    var endGame = false
    
    func startGame(){
        var answer = true
        print("\n----------------------------------------")
        print("           BATTLE ROYALE")
        print("----------------------------------------")
        
        print("\nBienvenue dans le BATTLE ROYALE")
        
        print("\nQu'elle est ton nom jeune guerrier ?\n")
        if let namePlayer1 = readLine() {
            print("===============================")
            print("     Bienvenue toi \(namePlayer1)")
            print("===============================")
            while answer == true {
                print("\nEs tu venu avec un autre guerrier ou "
                    + "\nveux tu te frotter a notre ORDI TUEUR"
                    + "\n\n1.SOLO / 2.AMIGO")
                if let soloOuPas = readLine(){
                    switch soloOuPas {
                    case "1":
                        print("SOLO!!")
                        player2 = creationOrdi()
                        creatPlayers(soloOuPas: "1", namePlayer1: namePlayer1,namePlayer2: nil)
                        startBattle()
                        answer = false
                    case "2":
                        print("\nLa bagarre entre amis il n'y a que ca de vrai !"
                            + "\nJoueur 2 presentes toi !")
                        if let namePlayer2 = readLine(){
                            let nameP2 = namePlayer2
                            print("\nVous devez avoir chacun trois Héros pour vous foutres dessus")
                            creatPlayers(soloOuPas: "2", namePlayer1: namePlayer1, namePlayer2: nameP2)
                            startBattle()
                            answer = false
                        }
                    default :
                        print("tu begailles ma parole !")
                        answer = true
                    }
                }
            }
        }
    }
    
    func creationOrdi()-> Player{
        print("FUNCTION creationOrdi !!!!!!")
        let tabTypeHero = ["1","2","3","4","5"]
        var tabHero: [Hero] = []
        for _ in 0...2 {
            let hero = chooseYourHero(choice: tabTypeHero.randomElement()!, ordi: true)
            tabHero.append(hero)
        }
        let  ordi = Player(name: "Rachid 2.0", numberOfPlayers: 1,warriors1: tabHero[0], warriors2: tabHero[1], warriors3: tabHero[2])
        return ordi
    }
    
    func createHeros(compteur: Int,sentenceTable: [String])-> Hero{
        var hero: Hero?
        var answere = true
        while answere == true {
            print("\n\(sentenceTable[compteur])"
                + "\n 1. L'archer"
                + "\n 2. Le guerrier"
                + "\n 3. L'espion"
                + "\n 4. Le magicien"
                + "\n 5. Le MONSTRE")
            if let firsChoice = readLine() {
                switch firsChoice {
                case "1":
                    hero = chooseYourHero(choice: "1", ordi: false)
                    answere = false
                case "2":
                    hero = chooseYourHero(choice: "2", ordi: false)
                    answere = false
                case "3":
                    hero = chooseYourHero(choice: "3", ordi: false)
                    answere = false
                case "4":
                    hero = chooseYourHero(choice: "4", ordi: false)
                    answere = false
                case "5":
                    hero = chooseYourHero(choice: "5", ordi: false)
                    answere = false
                default:
                    print("Je n'ai pas compris la réponse")
                    answere = true
                }
            }
        }
        return hero!
    }
    func ifNameExiste(name: String)-> Bool{
        for i in heroName{
            print(i)
        }
        var answer = false
        if heroName.count == 0 {
            print("le non n'existe pas !!!")
            answer = true
            heroName.append(name)
        }else {
            for hName in heroName{
                if hName == name{
                    answer = false
                    break
                }else {
                    print("le non n'existe pas !!!")
                    answer = true
                }
            }
        }
        if answer == true && heroName.count != 0 {
            heroName.append(name)
        }
        return answer
    }
    
    func chooseYourHero(choice: String, ordi: Bool)-> Hero{
        var hero: Hero?
        var nom = true
        if ordi == true {
            switch choice {
            case "1":
                hero = Archer(name: "Robin")
            case "2":
                hero = Guerrier(name: "Conan")
            case "3":
                hero = Espion(name: "Kakashi")
            case "4":
                hero = Magicien(name: "Merlin")
            case "5":
                hero = Monstre(name: "Broly")
            default:
                print("Je n'ai pas compris la réponse")
            }
        } else {
            while nom == true {
                switch choice {
                case "1":
                    print("Comment s'appelle ton archer ?")
                    if let name = readLine(){
                        let testName = ifNameExiste(name: name)
                        if testName == true {
                            hero = Archer(name: name)
                            nom = false
                        } else {
                            print("Ce prenon existe déjà choisis en un autre !")
                            nom = true
                        }
                    }
                case "2":
                    print("Comment s'appelle ton guerrier ?")
                    if let name = readLine(){
                        let testName = ifNameExiste(name: name)
                        if testName == true {
                            hero = Guerrier(name: name)
                            nom = false
                        } else {
                            print("Ce prenon existe déjà choisis en un autre !")
                            nom = true
                        }
                    }
                case "3":
                    print("Comment s'appelle ton espion ?")
                    if let name = readLine(){
                        let testName = ifNameExiste(name: name)
                        if testName == true {
                            hero = Espion(name: name)
                            nom = false
                        } else {
                            print("Ce prenon existe déjà choisis en un autre !")
                            nom = true
                        }
                    }
                case "4":
                    print("Comment s'appelle ton mage ?")
                    if let name = readLine(){
                        let testName = ifNameExiste(name: name)
                        if testName == true {
                            hero = Magicien(name: name)
                            nom = false
                        } else {
                            print("Ce prenon existe déjà choisis en un autre !")
                            nom = true
                        }
                    }
                case "5":
                    print("Comment s'appelle ton Monstre ?")
                    if let name = readLine(){
                        let testName = ifNameExiste(name: name)
                        if testName == true {
                            hero = Monstre(name: name)
                            nom = false
                        } else {
                            print("Ce prenon existe déjà choisis en un autre !")
                            nom = true
                        }
                    }
                default:
                    print("Je n'ai pas compris la réponse")
                }
            }
        }
        return hero!
    }
    
    func creatPlayers(soloOuPas: String, namePlayer1: String,namePlayer2: String?){
        print("FONCTION creatPlayers !!!!!!!!!")
        var heroTab1 : [Hero] = []
        var heroTab2 : [Hero] = []
        let sentenceTable = ["Fais ton premier choix","HA HA !tres bon choix \(namePlayer1)" + "\nFais ton second choix", "Fais ton dernier choix !!!"]
        let sentencePlayer1Table = ["\(namePlayer1) Fais ton premier choix","HA HA !tres bon choix \(namePlayer1)" + "\nFais ton second choix", "\(namePlayer1) Fais ton dernier choix !!!"]
        switch soloOuPas {
        case "1" :
            print("\nTu choisis de venir seul ! COURAGEUX")
            print("Tu dois avoir trois guerriers dans ton équipe")
            for i in 0...2 {
                let heroPlayer1 = createHeros(compteur: i,sentenceTable: sentenceTable)
                heroTab1.append(heroPlayer1)
            }
            player1 = Player(name: namePlayer1, numberOfPlayers: 1,warriors1: heroTab1[0], warriors2: heroTab1[1], warriors3: heroTab1[2])
            print("\nFélicitation tu possedes tes trois héros.")
        case "2" :
            for i in 0...2 {
                let sentencePlayer2Table = ["\(namePlayer2!) A ton tour, Fais ton premier choix","Bon choix \(namePlayer2!)" + "\nFais ton second choix", "\(namePlayer2!) Fais ton dernier choix !!!"]
                let heroPlayer1 = createHeros(compteur: i,sentenceTable: sentencePlayer1Table)
                heroTab1.append(heroPlayer1)
                let heroPlayer2 = createHeros(compteur: i,sentenceTable: sentencePlayer2Table)
                heroTab2.append(heroPlayer2)
            }
            player1 = Player(name: namePlayer1, numberOfPlayers: 1,warriors1: heroTab1[0], warriors2: heroTab1[1], warriors3: heroTab1[2])
            player2 = Player(name: namePlayer2!, numberOfPlayers: 2,warriors1: heroTab2[0], warriors2: heroTab2[1], warriors3: heroTab2[2])
        default:
            print("tu begailles ma parole !")
        }
    }
    
    func presentationPlayerHero(player: Player?){
        let heroTab = player?.getWarriorsPlayers()
        if let player1 = player {
            print("\(player1.getName()) possède trois héros :\n"
                + "\n\(heroTab![0].getName())     | life: \(heroTab![0].getLife())   | attack: \(heroTab![0].getAttack())   | care: \(heroTab![0].getCare())  "
                + "\n\(heroTab![1].getName())     | life: \(heroTab![1].getLife())   | attack: \(heroTab![1].getAttack())   | care: \(heroTab![1].getCare())  "
                + "\n\(heroTab![2].getName())     | life: \(heroTab![2].getLife())   | attack: \(heroTab![2].getAttack())   | care: \(heroTab![2].getAttack())  \n")
        }
    }
    func begining(){
        print("\n\nCommencons par présenter nos deux guerriers!")
        if player2?.getName() == "RAchid"{
            print("\nAujourd'hui c'est \(player1!.getName()) et l'ORDI \(player2!.getName()) qui s'affrontent.\n")
            presentationPlayerHero(player: player1!)
            presentationPlayerHero(player: player2!)
        }else {
            print("\nAujourd'hui c'est \(player1!.getName()) et \(player2!.getName()) qui s'affrontent.\n")
            presentationPlayerHero(player: player1!)
            presentationPlayerHero(player: player2!)
        }
    }
    
    
    func startBattle(){
        begining()
        print("C'est le moment que tout le monde attend, LA BAGARRE!")
        print("=============================")
        print("\nQUE LA BATAILLE COMMENCE\n")
        print("=============================")
        var continu = true
        let player1HeroTab = player1?.getWarriorsPlayers()
        let player2HeroTab = player2?.getWarriorsPlayers()
        player1?.setRonud(number: 1)
        player2?.setRonud(number: 1)
        
        while continu {
            if player1?.getRound() == player2?.getRound(){
                print("\nround \((player1?.getRound())!)")
                print("---------------------------\n")
                player1?.setRonud(number: 1)
                print((player1?.getName())! + " choisi un de tes heros!"
                    + "\n1. \(player1HeroTab![0].getName())" + "     | 2. \(player1HeroTab![1].getName())" + "     | 3. \(player1HeroTab![2].getName())")
                print("life:\(player1HeroTab![0].getLife())" + "     | life:\(player1HeroTab![1].getLife())" + "     | life: \(player1HeroTab![2].getLife())")
                print("attack:\(player1HeroTab![0].getAttack())" + "    | attack:\(player1HeroTab![1].getAttack())" + "   | attack: \(player1HeroTab![2].getAttack())")
                if let hero1 = readLine(){
                    let hero = Int(hero1)! - 1
                    let heroAttaque = player1HeroTab![hero]
                        heroAttaque.heroTechnics()
                    print("Qui veux tu attaquer ?"
                        + "\n1. \(player2HeroTab![0].getName())" + "     | 2. \(player2HeroTab![1].getName())" + "     | 3. \(player2HeroTab![2].getName())")
                    print("life:\(player2HeroTab![0].getLife())" + "     | life:\(player2HeroTab![1].getLife())" + "     | life: \(player2HeroTab![2].getLife())")
                    print("attack:\(player2HeroTab![0].getAttack())" + "    | attack:\(player2HeroTab![1].getAttack())" + "     | attack: \(player2HeroTab![2].getAttack())")
                    if let hero2 = readLine() {
                        let hero3 = Int(hero2)! - 1
                        let heroDefence = player2HeroTab![hero3]
                        heroAttaque.whatTechnic(player2: player2!, heroPlayer2: heroDefence, typeOfTechnic: heroAttaque.getTypeOfAttack())
                    }
                }
            } else {
                player2?.setRonud(number: 1)
                print("\(player2!.getName()) choisi un de tes heros!\n"
                    + "\n1. \(player2HeroTab![0].getName())" + "     2. \(player2HeroTab![1].getName())" + "     3. \(player2HeroTab![2].getName())")
                print(" life:\(player2HeroTab![0].getLife())" + "     life:\(player2HeroTab![1].getLife())" + "     life: \(player2HeroTab![2].getLife())")
                if let hero1 = readLine(){
                    let heroP2 = Int(hero1)! - 1
                    let heroAttaqueP2 = player2HeroTab![heroP2]
                        heroAttaqueP2.heroTechnics()
                    print("Qui veux tu attaquer ?"
                        + "\n1. \(player1HeroTab![0].getName())" + "     2. \(player1HeroTab![1].getName())" + "     3. \(player1HeroTab![2].getName())")
                    print("  life:\(player1HeroTab![0].getLife())" + "      life:\(player1HeroTab![1].getLife())" + "     life: \(player1HeroTab![2].getLife())")
                    if let hero2 = readLine() {
                        let hero2P1 = Int(hero2)! - 1
                        let heroDefense2 = player1HeroTab![hero2P1]
                        heroAttaqueP2.whatTechnic(player2: player1!, heroPlayer2: heroDefense2, typeOfTechnic:heroAttaqueP2.getTypeOfAttack() )
                    }
                }
                displayHeroLife(hero1: player1!,hero2: player2! )
            }
            continu = whoseWin()
        }
    }
    
    func whoseWin()-> Bool{
        let stat = Stat(player1: player1!, player2: player2!)
        var lifePlayer1: Int = 0
        for warrior in player1!.getWarriorsPlayers(){
            lifePlayer1 += warrior.getLife()
        }
        print(lifePlayer1)
        var lifePlayer2: Int = 0
        for warrior in player2!.getWarriorsPlayers(){
            lifePlayer2 += warrior.getLife()
        }
        print(lifePlayer2)
        if lifePlayer1 <= 0 {
            print("\n\n=============================")
            print("     VICTOIRE de \(player2!.getName()) ")
            print("=============================")
            player2?.setWinner(winner: true)
            stat.statEndGame(player1: player1!, player2: player2!)
            return false
        } else if lifePlayer2 <= 0 {
            print("\n\n=============================")
            print("     VICTOIRE de \(player1!.getName()) ")
            print("=============================")
            player1?.setWinner(winner: true)
            stat.statEndGame(player1: player1!, player2: player2!)
            return false
        }
        return true
    }
    
    func displayHeroLife(hero1: Player,hero2: Player ){
        let count = hero1.getWarriorsPlayers().count
        let heroPlayer1 = hero1.getWarriorsPlayers()
        let heroPlayer2 = hero2.getWarriorsPlayers()
        print("\n    \(hero1.getName())                 \(hero2.getName())")
        print("-------------------------------------------")
        for hero in 0...count - 1 {
            if heroPlayer1[hero].getLife() > 0 && heroPlayer2[hero].getLife() > 0{
                print("\((heroPlayer1[hero].getName())) / \(heroPlayer1[hero].getLife()) de vie ||   \((heroPlayer2[hero].getName())) / \(heroPlayer2[hero].getLife()) de vie")
            } else if heroPlayer1[hero].getLife() <= 0 && heroPlayer2[hero].getLife() <= 0 {
                print("\((heroPlayer1[hero].getName())) EST MORT ||   \((heroPlayer2[hero].getName())) / EST MORT")
            } else if heroPlayer1[hero].getLife() > 0 && heroPlayer2[hero].getLife() <= 0 {
                print("\((heroPlayer1[hero].getName())) / \(heroPlayer1[hero].getLife()) de vie  ||   \((heroPlayer2[hero].getName())) / EST MORT")
            }else if heroPlayer1[hero].getLife() <= 0 && heroPlayer2[hero].getLife() > 0 { print("\((heroPlayer1[hero].getName())) / EST MORT  ||   \((heroPlayer2[hero].getName())) / \((heroPlayer2[hero].getLife())) de vie")
            }
        }
    }
}

