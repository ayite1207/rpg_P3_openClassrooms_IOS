//
//  Game.swift
//  rpg
//
//  Created by ayite  on 31/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation
/**
the class Game organize all the game
 
*/
class Game{
    var player1 : Player?
    var player2 : Player?
    var heroName: [String] = []
    
    func unwrap(playerToUnwrap: Player?)-> Player{
        guard let player = playerToUnwrap else{return playerToUnwrap!}
        return player
    }
    /**
    startGame() allows you to choose the game mode. solo or two
    */
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
    /**
    creationOrdi() create the virtual palyer return a player object
    */
    func creationOrdi()-> Player{
        let tabTypeHero = ["1","2","3","4","5"]
        var tabHero: [Hero] = []
        for _ in 0...2 {
            let hero = createAHero(choice: tabTypeHero.randomElement()!, ordi: true)
            tabHero.append(hero)
        }
        let  ordi = Player(name: "Rachid 2.0", numberOfPlayers: 1,warriors1: tabHero[0], warriors2: tabHero[1], warriors3: tabHero[2],ordi: true)
        return ordi
    }
    
    /**
    createHeros() create the hero.  return a Hero object
     
    - Parameters:
        - compteur : allows to choose the sentence who will be display
        - sentenceTable : a table of sentences who will be display
    */
    
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
                    hero = createAHero(choice: "1", ordi: false)
                    answere = false
                case "2":
                    hero = createAHero(choice: "2", ordi: false)
                    answere = false
                case "3":
                    hero = createAHero(choice: "3", ordi: false)
                    answere = false
                case "4":
                    hero = createAHero(choice: "4", ordi: false)
                    answere = false
                case "5":
                    hero = createAHero(choice: "5", ordi: false)
                    answere = false
                default:
                    print("Je n'ai pas compris la réponse")
                    answere = true
                }
            }
        }
        return hero!
    }
    
    /**
    ifNameExiste() check if the name chosen by the player exist or not
     
    - Parameters:
        - name : we check if the name in parameter is already used
    */
    
    func ifNameExiste(name: String)-> Bool{
        var answer = false
        if heroName.count == 0 {
            answer = true
            heroName.append(name)
        }else {
            for hName in heroName{
                if hName == name{
                    answer = false
                    break
                }else {
                    answer = true
                    heroName.append(name)
                }
            }
        }
        return answer
    }
    
    /**
    createAHero() allows to create a hero object from the choise of the player
     
    - Parameters:
        - choice : allows to know what hero the player choose
        - ordi : allows to know if the player is virtual or not
    */
    
    func createAHero(choice: String, ordi: Bool)-> Hero{
        var hero: Hero?
        var name = ""
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
                switch choice {
                case "1":
                    name = checkTheName(index: "1")
                    hero = Archer(name: name)
                case "2":
                    name = checkTheName(index: "2")
                    hero = Guerrier(name: name)
                case "3":
                    name = checkTheName(index: "3")
                    hero = Espion(name: name)
                case "4":
                    name = checkTheName(index: "4")
                    hero = Magicien(name: name)
                case "5":
                    name = checkTheName(index: "5")
                    hero = Monstre(name: name)
                default:
                    print("Je n'ai pas compris la réponse")
                }
        }
        return hero!
    }
    /**
    checkTheName() check if the name of the player's hero exist or not
     
    - Parameters:
        - index : for display the sentence of the array esntenceTab
    */
    
    func checkTheName(index: String)-> String{
        var answer = ""
        let esntenceTab: [String] = ["Comment s'appelle ton archer ?","Comment s'appelle ton guerrier ?","Comment s'appelle ton espion ?","Comment s'appelle ton mage ?","Comment s'appelle ton Monstre ?"]
        var nom = true
        while nom == true {
            print(esntenceTab[Int(index)! - 1])
            if let name = readLine(){
                let testName = ifNameExiste(name: name)
                if testName == true {
                    answer = name
                    nom = false
                } else {
                    print("Ce prenon existe déjà choisis en un autre !")
                    nom = true
                }
            }
        }
        return answer
    }
    /**
    creatPlayers() allows to choose the three heros when create your team
     
    - Parameters:
        - soloOuPas : for know if there is one or two players
        - namePlayer1 : the name of the player one
        - namePlayer2 : the name of the player two
    */
    
    func creatPlayers(soloOuPas: String, namePlayer1: String,namePlayer2: String?){
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
            player1 = Player(name: namePlayer1, numberOfPlayers: 1,warriors1: heroTab1[0], warriors2: heroTab1[1], warriors3: heroTab1[2], ordi: false)
            print("\nFélicitation tu possedes tes trois héros.")
        case "2" :
            for i in 0...2 {
                let sentencePlayer2Table = ["\(namePlayer2!) A ton tour, Fais ton premier choix","Bon choix \(namePlayer2!)" + "\nFais ton second choix", "\(namePlayer2!) Fais ton dernier choix !!!"]
                let heroPlayer1 = createHeros(compteur: i,sentenceTable: sentencePlayer1Table)
                heroTab1.append(heroPlayer1)
                let heroPlayer2 = createHeros(compteur: i,sentenceTable: sentencePlayer2Table)
                heroTab2.append(heroPlayer2)
            }
            player1 = Player(name: namePlayer1, numberOfPlayers: 1,warriors1: heroTab1[0], warriors2: heroTab1[1], warriors3: heroTab1[2], ordi: false)
            player2 = Player(name: namePlayer2!, numberOfPlayers: 2,warriors1: heroTab2[0], warriors2: heroTab2[1], warriors3: heroTab2[2], ordi: false)
        default:
            print("tu begailles ma parole !")
        }
    }
    
    /**
    presentationPlayerHero() display the heros of each player
     
    - Parameters:
        - player : allows to display the heros
    */
    
    func presentationPlayerHero(player: Player?){
        let heroTab = player?.getWarriorsPlayers()
        print( "\n1. \(heroTab![0].getName()) : \(heroTab![0].getType())     | life: \(heroTab![0].getLife())   | attack: \(heroTab![0].getAttack())   | care: \(heroTab![0].getCare())  "
                + "\n2. \(heroTab![1].getName()) : \(heroTab![1].getType())     | life: \(heroTab![1].getLife())   | attack: \(heroTab![1].getAttack())   | care: \(heroTab![1].getCare())  "
                + "\n3. \(heroTab![2].getName()) : \(heroTab![2].getType())     | life: \(heroTab![2].getLife())   | attack: \(heroTab![2].getAttack())   | care: \(heroTab![2].getCare())  \n")
    }
    /**
    begining() display the heros of each player
    */
    func begining(){
        print("\n\nCommencons par présenter nos deux guerriers!")
            print("\nAujourd'hui c'est \(player1!.getName()) et \(player2!.getName()) qui s'affrontent.\n")
            guard let playerOneName = player1?.getName(), let playertTwoName = player2?.getName() else {return}
            print("\(playerOneName)")
            presentationPlayerHero(player: player1!)
            print("\(playertTwoName)")
            presentationPlayerHero(player: player2!)
        
    }
    /**
     the startBattle() organize all battle
     */
    
    func startBattle(){
        begining()
        let p1 = unwrap(playerToUnwrap: player1)
        let p2 = unwrap(playerToUnwrap: player2)
        print("C'est le moment que tout le monde attend, LA BAGARRE!")
        print("=============================")
        print("\nQUE LA BATAILLE COMMENCE\n")
        print("=============================")
        var continu = true
        p1.setRonud(number: 1)
        p2.setRonud(number: 1)
        
        while continu {
            if p1.getRound() == p2.getRound(){
                print("\nround \((p1.getRound()))")
                print("---------------------------\n")
                attack(player1Attack: p1, player2Defence: p2)
            } else {
                if p2.getName() == "Rachid 2.0"{
                    p2.setRonud(number: 1)
                    let ordiHeroAttaque = ordiChooseYourHero(ordi: p2)
                    ordiHeroAttaque.heroTechnics(player: p2)
                    let heroDefense2 = ordiChooseThePlayersHero(player: p1)
                    ordiHeroAttaque.whatTechnic(player2: p1, heroPlayer2: heroDefense2, typeOfTechnic: ordiHeroAttaque.getTypeOfAttack())
                    displayHeroLife(hero1: player1!,hero2: player2! )
                }else {
                    attack(player1Attack: p2, player2Defence: p1)
                    displayHeroLife(hero1: player1!,hero2: player2! )
                }
            }
            continu = whoseWin()
        }
    }
    /**
    attacko() allows to attack or Treat
     
    - Parameters:
        - player1Attack : the player who attack or treat
        - player2Defence : the player who is attack or treat
    */
    func attack(player1Attack: Player, player2Defence: Player){
        let player1HeroTab = player1Attack.getWarriorsPlayers()
        let player2HeroTab = player2Defence.getWarriorsPlayers()
        var reponse = false
        player1Attack.setRonud(number: 1)
        print((player1Attack.getName()) + " choisi un de tes heros!")
        presentationPlayerHero(player: player1Attack)
        if let hero1 = readLine(){
            let hero = Int(hero1)! - 1
            var heroAttaque = player1HeroTab[hero]
            while heroAttaque.getLife() == 0 {
                print("Je ne sais pas si tu es au courant mais \(heroAttaque.getName()) est MORT!"
                + "\n choisi un autre joueur!!")
                 presentationPlayerHero(player: player1Attack)
                if let hero1 = readLine(){
                    let hero = Int(hero1)! - 1
                    heroAttaque = player1HeroTab[hero]
                }
            }
            if heroAttaque.getTypeCate() == .espion || heroAttaque.getTypeCate() == .magicien {
                print("tu as choisi \(heroAttaque.getType()) veux tu"
                + "\n1. soigner     2. attaquer")
                while reponse == false{
                    if let choice = readLine() {
                        switch choice {
                        case "1":
                            print("Qui veux tu soigner ?")
                            presentationPlayerHero(player: player1Attack)
                            if let hero = readLine() {
                                let numberHero = Int(hero)! - 1
                                let hero = player1HeroTab[numberHero]
                                heroAttaque.care(hero : hero)
                            }
                            reponse = true
                        case "2":
                            heroAttaque.heroTechnics(player: player1Attack)
                            print("Qui veux tu attaquer ?")
                            presentationPlayerHero(player: player2Defence)
                            if let hero2 = readLine() {
                                let numberHero = Int(hero2)! - 1
                                let heroDefence = player2HeroTab[numberHero]
                                heroAttaque.whatTechnic(player2: player2Defence, heroPlayer2: heroDefence, typeOfTechnic: heroAttaque.getTypeOfAttack())
                            }
                            reponse = true
                        default:
                            reponse = false
                        }
                    }
                }
            }else {
                heroAttaque.heroTechnics(player: player1Attack)
                print("Qui veux tu attaquer ?")
                presentationPlayerHero(player: player2Defence)
                if let hero2 = readLine() {
                    let numberHero = Int(hero2)! - 1
                    let heroDefence = player2HeroTab[numberHero]
                    heroAttaque.whatTechnic(player2: player2Defence, heroPlayer2: heroDefence, typeOfTechnic: heroAttaque.getTypeOfAttack())
                }
            }
        }
    }
    /**
     whoseWin() check if one of the player win
     */
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
    
    /**
     ordiChooseYourHero() choose a hero of the virtual player
     
     - Parameters:
        - ordi : the virtual player
     */
    
    func ordiChooseYourHero(ordi: Player)-> Hero{
        var attack = 0
        let ordisHerosTab = ordi.getWarriorsPlayers()
        var heroChosen: Hero?
        for i in 0...2 {
            if ordisHerosTab[i].getAttack() >= attack && ordisHerosTab[i].getLife() > 0{
                attack = ordisHerosTab[i].getAttack()
                heroChosen = ordisHerosTab[i]
            }
        }
        print("\n\(ordi.getName()) choisi \(heroChosen!.getName()) pour attaquer !!\n")
        return heroChosen!
    }
    
    /**
     ordiChooseThePlayersHero() allows to choose a hero who will be attacked
     
     - Parameters:
        - player : the player who will be attacked
     */
    
    func ordiChooseThePlayersHero(player: Player)-> Hero{
        var attack = 0
        let playerHerosTab = player.getWarriorsPlayers()
        var heroChosen: Hero?
        for i in 0...2 {
            if playerHerosTab[i].getAttack() >= attack && playerHerosTab[i].getLife() > 0{
                attack = playerHerosTab[i].getAttack()
                heroChosen = playerHerosTab[i]
            }
        }
        return heroChosen!
    }
    
    /**
     displayHeroLife() allows to display  the life of each heros in each rounds
     
     - Parameters:
        - hero1 : the hero of the player one
        - hero2 : the hero of the player two
     */
    
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

