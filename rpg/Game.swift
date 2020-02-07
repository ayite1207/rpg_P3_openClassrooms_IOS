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
    var round = 0
    
//    init(namePlayer1 : String,namePlayer2 : String,soloOuPas: String) {
//        self.nameP1 = namePlayer1
//        if namePlayer2 == "Ordi" {
//            player2 = creationOrdi()
//            creatPlayers(soloOuPas: soloOuPas)
//            begining()
//        } else {
//            self.nameP2 = namePlayer2
//            creatPlayers(soloOuPas: soloOuPas)
//            begining()
//        }
//    }
    
    func startGame(){
        print("\n----------------------------------------")
        print("           BATTLE ROYALE")
        print("----------------------------------------")

        print("\nBienvenue dans le BATTLE ROYALE")

        print("\nQu'elle est ton nom jeune guerrier ?\n")
        if let namePlayer1 = readLine() {
            print("===============================")
            print("     Bienvenue toi \(namePlayer1)")
            print("===============================")
            print("\nEs tu venu avec un autre guerrier ou "
                + "\nveux tu te frotter a notre ORDI TUEUR"
                + "\n\n1.SOLO / 2.AMIGO\n")
            if let soloOuPas = readLine(){
                switch soloOuPas {
                case "1":
                    player2 = creationOrdi()
                    creatPlayers(soloOuPas: "1", namePlayer1: namePlayer1,namePlayer2: nil)
                    startBattle()
                case "2":
                    print("La bagarre entre amis il n'y a que ca de vrai !"
                        + "\nJoueur 2 presentes toi !")
                    if let namePlayer2 = readLine(){
                        let nameP2 = namePlayer2
                        print("Vous devez avoir chacun trois Héros pour vous foutres dessus")
                        creatPlayers(soloOuPas: "2", namePlayer1: namePlayer1, namePlayer2: nameP2)
                        startBattle()
                    }
                default :
                    print("tu begailles ma parole !")
                }
            }
        }
    }
    
    
    
    var endGame = false
    
    func creationOrdi()-> Player{
        let tabEnum = [Hero.Cate.archer,Hero.Cate.guerrier,Hero.Cate.espion,Hero.Cate.magicien,Hero.Cate.MONSTRE]
        let hero1 = Hero(cate: tabEnum.randomElement()!)
        let hero2 = Hero(cate: tabEnum.randomElement()!)
        let hero3 = Hero(cate: tabEnum.randomElement()!)
        let  ordi = Player(name: "Rachid 2.0", numberOfPlayers: 1,warriors1: hero1, warriors2: hero2, warriors3: hero3)
        return ordi
    }
    
    func creatPlayers(soloOuPas: String, namePlayer1: String,  namePlayer2: String?){
        var heroTab1 : [Hero] = []
        var heroTab2 : [Hero] = []
        switch soloOuPas {
        case "1" :
            print("\nTu choisis de venir seul ! COURAGEUX")
            print("Choisi tes trois héros!!")
            for i in 0...2 {
                let sentenceTable = ["Fais ton premier choix","HA HA !tres bon choix \(namePlayer1)" + "\nFais ton second choix", "Fais ton dernier choix !!!"]
                let heroPlayer1 = createHeros(name : namePlayer1, compteur: i,sentenceTable: sentenceTable)
                heroTab1.append(heroPlayer1)
            }
            player1 = Player(name: namePlayer1, numberOfPlayers: 1,warriors1: heroTab1[0], warriors2: heroTab1[1], warriors3: heroTab1[2])
            print("\nFélicitation tu possedes tes trois héros.")
        case "2" :
            for i in 0...2 {
                let sentencePlayer1Table = ["\(namePlayer1) Fais ton premier choix","HA HA !tres bon choix \(namePlayer1)" + "\nFais ton second choix", "\(namePlayer1) Fais ton dernier choix !!!"]
                let heroPlayer1 = createHeros(name :namePlayer1, compteur: i,sentenceTable: sentencePlayer1Table)
                heroTab1.append(heroPlayer1)
                let sentencePlayer2Table = ["\(namePlayer2) A ton tour, Fais ton premier choix","Bon choix \(namePlayer2)" + "\nFais ton second choix", "\(namePlayer2) Fais ton dernier choix !!!"]
                let heroPlayer2 = createHeros(name : namePlayer2!, compteur: i,sentenceTable: sentencePlayer2Table)
                heroTab2.append(heroPlayer2)
            }
            player1 = Player(name: namePlayer1, numberOfPlayers: 1,warriors1: heroTab1[0], warriors2: heroTab1[1], warriors3: heroTab1[2])
            player2 = Player(name: namePlayer2!, numberOfPlayers: 2,warriors1: heroTab2[0], warriors2: heroTab2[1], warriors3: heroTab2[2])
        default:
            print("tu begailles ma parole !")
        }
    }
    
    func createHeros(name : String, compteur: Int,sentenceTable: [String])-> Hero{
        var hero: Hero?
        print("\n\(sentenceTable[compteur])"
            + "\n 1. L'archer"
            + "\n 2. Le guerrier"
            + "\n 3. L'espion"
            + "\n 4. Le magicien"
            + "\n 5. Le MONSTRE")
        if let firsChoice = readLine() {
            switch firsChoice {
            case "1":
                hero = Archer()
            case "2":
                hero = Guerrier()
            case "3":
                hero = Espion()
            case "4":
                hero = Magicien()
            case "5":
                 hero = Monstre()
            default:
                print("Je n'ai pas compris la réponse")
            }
        }
        print("===============================")
<<<<<<< HEAD
        return hero!
=======
        hero = Hero(cate: heroType!)
        return hero
    }
    // Avoir a faire sauter le switch 
    
    func creatPlayers(soloOuPas: String){
        var heroTab1 : [Hero] = []
        var heroTab2 : [Hero] = []
        switch soloOuPas {
        case "1" :
            print("\nTu choisis de venir seul ! COURAGEUX")
            print("Tu dois avoir trois guerriers dans ton équipe")
            for i in 0...2 {
                let sentenceTable = ["Fais ton premier choix","HA HA !tres bon choix \(nameP1)" + "\nFais ton second choix", "Fais ton dernier choix !!!"]
                let heroPlayer1 = createHeros(name : nameP1, compteur: i,sentenceTable: sentenceTable)
                heroTab1.append(heroPlayer1)
            }
            player1 = Player(name: nameP1, numberOfPlayers: 1,warriors1: heroTab1[0], warriors2: heroTab1[1], warriors3: heroTab1[2])
            print("\nFélicitation tu possedes tes trois héros.")
        case "2" :
            for i in 0...2 {
                let sentencePlayer1Table = ["\(nameP1) Fais ton premier choix","HA HA !tres bon choix \(nameP1)" + "\nFais ton second choix", "\(nameP1) Fais ton dernier choix !!!"]
                let heroPlayer1 = createHeros(name : nameP1, compteur: i,sentenceTable: sentencePlayer1Table)
                heroTab1.append(heroPlayer1)
                let sentencePlayer2Table = ["\(nameP2!) A ton tour, Fais ton premier choix","Bon choix \(nameP2!)" + "\nFais ton second choix", "\(nameP2!) Fais ton dernier choix !!!"]
                let heroPlayer2 = createHeros(name : nameP2!, compteur: i,sentenceTable: sentencePlayer2Table)
                heroTab2.append(heroPlayer2)
            }
            player1 = Player(name: nameP1, numberOfPlayers: 1,warriors1: heroTab1[0], warriors2: heroTab1[1], warriors3: heroTab1[2])
            player2 = Player(name: nameP2!, numberOfPlayers: 2,warriors1: heroTab2[0], warriors2: heroTab2[1], warriors3: heroTab2[2])
        default:
            print("tu begailles ma parole !")
        }
>>>>>>> 2cba237784b6ff48fc8f24f9f717673ecb96471a
    }
    
    func presentationPlayerHero(player: Player?){
        if let player1 = player {
            print("\(player1.name) possède trois héros :\n"
                + "\n\(player1.warriorsPlayer[0].name!)     | life: \(player1.warriorsPlayer[0].life)   | attack: \(player1.warriorsPlayer[0].attack)   | care: \(player1.warriorsPlayer[0].care)  "
                + "\n\(player1.warriorsPlayer[1].name!)     | life: \(player1.warriorsPlayer[1].life)   | attack: \(player1.warriorsPlayer[1].attack)   | care: \(player1.warriorsPlayer[1].care)  "
                + "\n\(player1.warriorsPlayer[2].name!)     | life: \(player1.warriorsPlayer[2].life)   | attack: \(player1.warriorsPlayer[2].attack)   | care: \(player1.warriorsPlayer[2].care)  \n")
        }
        
    }
    func begining(){
        print("C'est le moment que tout le monde attend, LA BAGARRE!"
            + "\n\nCommencons par présenter nos deux guerriers!")
        if player2?.name == "RAchid"{
            print("\nAujourd'hui c'est \(player1!.name) et l'ORDI \(player2!.name) qui s'affrontent.\n")
            presentationPlayerHero(player: player1!)
            presentationPlayerHero(player: player2!)
        }else {
            print("\nAujourd'hui c'est \(player1!.name) et \(player2!.name) qui s'affrontent.\n")
            presentationPlayerHero(player: player1!)
            presentationPlayerHero(player: player2!)
        }
    }
    
    func startBattle(){
            print("=============================")
            print("\nQUE LA BATAILLE COMMENCE\n")
            print("=============================")
            var continu = true
            player1?.round += 1
            player2?.round += 1
            
            while continu {
                if player1?.round == player2?.round{
                    print("\nround \((player1?.round)!)")
                    print("---------------------------\n")
                    player1?.round += 1
                    print((player1?.name)! + " choisi un de tes heros!"
                        + "\n1. \(player1!.warriorsPlayer[0].name!)" + "     | 2. \(player1!.warriorsPlayer[1].name!)" + "     | 3. \(player1!.warriorsPlayer[2].name!)")
                    print("life:\(player1!.warriorsPlayer[0].life)" + "     | life:\(player1!.warriorsPlayer[1].life)" + "     | life: \(player1!.warriorsPlayer[2].life)")
                    print("attack:\(player1!.warriorsPlayer[0].attack)" + "    | attack:\(player1!.warriorsPlayer[1].attack)" + "   | attack: \(player1!.warriorsPlayer[2].attack)")
                    
                    if let hero1 = readLine(){
                        let hero = Int(hero1)! - 1
                        let heroAttaque = player1!.warriorsPlayer[hero]
                        print("Qui veux tu attaquer ?"
                            + "\n1. \(player2!.warriorsPlayer[0].name!)" + "     | 2. \(player2!.warriorsPlayer[1].name!)" + "     | 3. \(player2!.warriorsPlayer[2].name!)")
                        print("life:\(player2!.warriorsPlayer[0].life)" + "     | life:\(player2!.warriorsPlayer[1].life)" + "     | life: \(player2!.warriorsPlayer[2].life)")
                        print("attack:\(player2!.warriorsPlayer[0].attack)" + "    | attack:\(player2!.warriorsPlayer[1].attack)" + "     | attack: \(player2!.warriorsPlayer[2].attack)")
                        if let hero2 = readLine() {
                            let hero3 = Int(hero2)! - 1
                            let heroDefence = player2!.warriorsPlayer[hero3]
                            heroAttaque.attack(player2: player2!, heroPlayer2: heroDefence)
//                            attaque(player: player1!, hero1: heroAttaque, hero2: heroDefence)
                        }
                    }
                } else {
                    player2?.round += 1
                    print("\(player2!.name) choisi un de tes heros!\n"
                        + "\n1. \(player2!.warriorsPlayer[0].name!)" + "     2. \(player2!.warriorsPlayer[1].name!)" + "     3. \(player2!.warriorsPlayer[2].name!)")
                    print(" life:\(player2!.warriorsPlayer[0].life)" + "     life:\(player2!.warriorsPlayer[1].life)" + "     life: \(player2!.warriorsPlayer[2].life)")
                    if let hero1 = readLine(){
                        let hero1P2 = Int(hero1)! - 1
                        let heroAttaqueP2 = player2!.warriorsPlayer[hero1P2]
                        print("Qui veux tu attaquer ?"
                            + "\n1. \(player1!.warriorsPlayer[0].name!)" + "     2. \(player1!.warriorsPlayer[1].name!)" + "     3. \(player1!.warriorsPlayer[2].name!)")
                        print("  life:\(player1!.warriorsPlayer[0].life)" + "      life:\(player1!.warriorsPlayer[1].life)" + "     life: \(player1!.warriorsPlayer[2].life)")
                        if let hero2 = readLine() {
                            let hero2P1 = Int(hero2)! - 1
                            let heroDefense2 = player1!.warriorsPlayer[hero2P1]
                            heroAttaqueP2.attack(player2: player1!, heroPlayer2: heroDefense2)
//                           attaque(player: player2!, hero1: heroAttaqueP2, hero2: heroDefense2)
                        }
                    }
                    displayHeroLife(hero1: player1!,hero2: player2! )
                }
                continu = whoseWin()
            }
        }
    
    
    func whoseWin()-> Bool{
        
        var lifePlayer1: Int = 0
        for warrior in player1!.warriorsPlayer{
            lifePlayer1 += warrior.life
        }
        print(lifePlayer1)
        var lifePlayer2: Int = 0
        for warrior in player2!.warriorsPlayer{
            lifePlayer2 += warrior.life
        }
        print(lifePlayer2)
        if lifePlayer1 <= 0 {
            print("\n\n=============================")
            print("     VICTOIRE de \(player2!.name) ")
            print("=============================")
            //                whoseWin()
            return false
        } else if lifePlayer2 <= 0 {
            print("\n\n=============================")
            print("     VICTOIRE de \(player1!.name) ")
            print("=============================")
            //                whoseWin()
            return false
        }
        return true
    }
    
    func displayHeroLife(hero1: Player,hero2: Player ){
        let count = hero1.warriorsPlayer.count
        print("\n    \(hero1.name)                 \(hero2.name)")
        print("-------------------------------------------")
        for hero in 0...count - 1 {
            if player1!.warriorsPlayer[hero].life > 0 && player2!.warriorsPlayer[hero].life > 0{
                print("\((player1!.warriorsPlayer[hero].name)!) / \(player1!.warriorsPlayer[hero].life) de vie ||   \((player2!.warriorsPlayer[hero].name)!) / \(player2!.warriorsPlayer[hero].life) de vie")
            } else if player1!.warriorsPlayer[hero].life <= 0 && player2!.warriorsPlayer[hero].life <= 0 {
                print("\((player1!.warriorsPlayer[hero].name)!) EST MORT ||   \((player2!.warriorsPlayer[hero].name)!) / EST MORT")
            } else if player1!.warriorsPlayer[hero].life > 0 && player2!.warriorsPlayer[hero].life <= 0 {
                print("\((player1!.warriorsPlayer[hero].name)!) / \(player1!.warriorsPlayer[hero].life) de vie  ||   \((player2!.warriorsPlayer[hero].name)!) / EST MORT")
            }else if player1!.warriorsPlayer[hero].life <= 0 && player2!.warriorsPlayer[hero].life > 0 { print("\((player1!.warriorsPlayer[hero].name)!) / EST MORT  ||   \((player2!.warriorsPlayer[hero].name)!) / \((player2!.warriorsPlayer[hero].life)) de vie")
            }
        }
    }

    func superAttack(hero: Hero){
        print("\(hero.name) a attaqué \(hero.fight) fois et c'est défendu \(hero.defense) fois")
    }

}
