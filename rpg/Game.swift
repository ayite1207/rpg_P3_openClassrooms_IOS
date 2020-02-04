//
//  Game.swift
//  rpg
//
//  Created by ayite  on 31/01/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class Game{
    var nameP1: String
    var nameP2: String?
    var player1 : Player?
    var player2 : Player?
    var round = 0
    
    init(namePlayer1 : String,namePlayer2 : String,soloOuPas: String) {
        self.nameP1 = namePlayer1
        if namePlayer2 == "Ordi" {
            print("création d'un player ordi")
            player2 = creationOrdi()
            creatPlayers(soloOuPas: soloOuPas)
            begining()
        } else {
            self.nameP2 = namePlayer2
            creatPlayers(soloOuPas: soloOuPas)
            begining()
        }
    }
    
    var endGame = false
    func creationOrdi()-> Player{
        let tabEnum = [Hero.Cate.archer,Hero.Cate.guerrier,Hero.Cate.espion,Hero.Cate.magicien,Hero.Cate.MONSTRE]
        let hero1 = Hero(cate: tabEnum.randomElement()!)
        let hero2 = Hero(cate: tabEnum.randomElement()!)
        let hero3 = Hero(cate: tabEnum.randomElement()!)
        let  ordi = Player(name: "Rachid 2.0", numberOfPlayers: 1,warriors1: hero1, warriors2: hero2, warriors3: hero3)
        nameP2 = ordi.name
        return ordi
    }
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
    
    func creatPlayers(soloOuPas: String){
        var heroTab1 : [Hero] = []
        var heroTab2 : [Hero] = []
        switch soloOuPas {
        case "1" :
            print("Tu choisis de venir seul ! COURAGEUX")
            print("Tu dois avoir trois guerriers dans ton équipe")
            for i in 0...2 {
                let sentenceTable = ["Fais ton premier choix","HA HA !tres bon choix \(nameP1)" + "\nFais ton second choix", "Fais ton dernier choix !!!"]
                let heroPlayer1 = createHeros(name : nameP1, compteur: i,sentenceTable: sentenceTable)
                heroTab1.append(heroPlayer1)
            }
            player1 = Player(name: nameP1, numberOfPlayers: 1,warriors1: heroTab1[0], warriors2: heroTab1[1], warriors3: heroTab1[2])
            print("Félicitation tu possedes tes trois héros."
                + "\n Commencons la partie")
        case "2" :
            for i in 0...2 {
                let sentencePlayer1Table = ["\(nameP1) Fais ton premier choix","HA HA !tres bon choix \(nameP1)" + "\nFais ton second choix", "\(nameP1) Fais ton dernier choix !!!"]
                let heroPlayer1 = createHeros(name : nameP1, compteur: i,sentenceTable: sentencePlayer1Table)
                heroTab1.append(heroPlayer1)
                let sentencePlayer2Table = ["\(nameP2) A ton tour, Fais ton premier choix","Bon choix \(nameP2)" + "\nFais ton second choix", "\(nameP2) Fais ton dernier choix !!!"]
                let heroPlayer2 = createHeros(name : nameP2!, compteur: i,sentenceTable: sentencePlayer2Table)
                heroTab2.append(heroPlayer2)
            }
            player1 = Player(name: nameP1, numberOfPlayers: 1,warriors1: heroTab1[0], warriors2: heroTab1[1], warriors3: heroTab1[2])
            player2 = Player(name: nameP2!, numberOfPlayers: 2,warriors1: heroTab2[0], warriors2: heroTab2[1], warriors3: heroTab2[2])
        default:
            print("tu begailles ma parole !")
        }
    }
    
    func presentationPlayerHero(player: Player?){
        if let player1 = player {
            print("\(player1.name) tu possèdes trois héros :\n"
                + "\n\(player1.warriorsPlayer[0].name!)     | life: \(player1.warriorsPlayer[0].life)   | attack: \(player1.warriorsPlayer[0].attack)   | care: \(player1.warriorsPlayer[0].care)  "
                + "\n\(player1.warriorsPlayer[1].name!)     | life: \(player1.warriorsPlayer[1].life)   | attack: \(player1.warriorsPlayer[1].attack)   | care: \(player1.warriorsPlayer[1].care)  "
                + "\n\(player1.warriorsPlayer[2].name!)     | life: \(player1.warriorsPlayer[2].life)   | attack: \(player1.warriorsPlayer[2].attack)   | care: \(player1.warriorsPlayer[2].care)  \n")
        }
        
    }
    func begining(){
        print("C'est le moment que tout le monde attend, LA BAGARRE!"
            + "\nCommencons par présenter nos deux guerriers!")
        if nameP2 == "RAchid"{
            print("\nAujourd'hui c'est \(player1!.name) et l'ORDI \(player2!.name) qui s'affrontent.\n")
            presentationPlayerHero(player: player1!)
            presentationPlayerHero(player: player2!)
        }else {
            print("\nAujourd'hui c'est \(player1!.name) et \(player2!.name) qui s'affrontent.\n")
            presentationPlayerHero(player: player1!)
            presentationPlayerHero(player: player2!)
        }
    }
    
        func whoseWin()-> Bool{
            var lifePlayer1: Int = 0
            for warrior in player1!.warriorsPlayer{
                lifePlayer1 += warrior.life
            }
            var lifePlayer2: Int = 0
            for warrior in player2!.warriorsPlayer{
                lifePlayer2 += warrior.life
            }
            if lifePlayer1 <= 0 {
                print("\n\n=============================")
                print("     VICTOIRE de \(player2!.name) ")
                print("=============================")
                return true
            } else if lifePlayer2 <= 0 {
                print("\n\n=============================")
                print("     VICTOIRE de \(player1!.name) ")
                print("=============================")
                return true
            }
            return false
        }
    
        func displayHeroLife(hero1: Player,hero2: Player ){
            let count = hero1.warriorsPlayer.count
            print("\n    \(hero1.name)                 \(hero2.name)")
            print("-------------------------------------------")
            for hero in 0...count - 1 {
                if player1!.warriorsPlayer[hero].life > 0 && player2!.warriorsPlayer[hero].life > 0{
                    print("\(player1!.warriorsPlayer[hero].name) / \(player1!.warriorsPlayer[hero].life) de vie ||   \(player2!.warriorsPlayer[hero].name) / \(player2!.warriorsPlayer[hero].life) de vie")
                } else if player1!.warriorsPlayer[hero].life <= 0 && player2!.warriorsPlayer[hero].life <= 0 {
                    print("\(player1!.warriorsPlayer[hero].name) EST MORT ||   \(player2!.warriorsPlayer[hero].name) / EST MORT")
                } else if player1!.warriorsPlayer[hero].life > 0 && player2!.warriorsPlayer[hero].life < 0 {
                    print("\(player1!.warriorsPlayer[hero].name) / \(player1!.warriorsPlayer[hero].life) de vie  ||   \(player2!.warriorsPlayer[hero].name) / EST MORT")
                }else if player1!.warriorsPlayer[hero].life < 0 && player2!.warriorsPlayer[hero].life > 0 {
                    print("\(player1!.warriorsPlayer[hero].name) / EST MORT  ||   \(player2!.warriorsPlayer[hero].name) / \(player2!.warriorsPlayer[hero].life) de vie")
                }
            }
        }
    
        func round(SoigneouAttaque hero1: Hero,estSoignéouAttaqueé hero2: Hero ){
    
            if player1!.round == player2!.round {
                player1!.round += 1
                print("\nround \(player1!.round)")
                attaque(player: player1!, hero1: hero1, hero2: hero2)
            }else {
                player2!.round += 1
                attaque(player: player2!,hero1: hero1, hero2: hero2)
                displayHeroLife(hero1: player1!, hero2: player2!)
            }
        }
    
    func attaque(player: Player, hero1 : Hero,hero2 : Hero){
        if whoseWin() == false {
            switch hero1.cate {
            case .archer:
                if hero2.life > 0 {
                    hero2.life -= 15
                    if hero2.life > 0 {
                        print("\n\(player.name) attaque !" + "\(hero2.name) n'a plus que  \(hero2.life) de vie !")
                    } else {
                        print("\n\(player.name) attaque !" + "\(hero2.name) est mort!")
                    }
                }else {
                    print("\n\(hero2.name) est déja mort dommage !")
                }
            case .guerrier:
                if hero2.life > 0 {
                    hero2.life -= 25
                    if hero2.life > 0 {
                        print("\n\(player.name) attaque !" + "\(hero2.name) n'a plus que  \(hero2.life) de vie !")
                    } else {
                        print("\n\(player.name) attaque !" + "\(hero2.name) est mort!")
                    }
                }else {
                    print("\n\(hero2.name) est déja mort dommage !")
                }
            case .espion:
                if hero2.life > 0 {
                    hero2.life -= 10
                    if hero2.life > 0 {
                        print("\n\(player.name) attaque !" + "\(hero2.name) n'a plus que  \(hero2.life) de vie !")
                    } else {
                        print("\n\(player.name) attaque !" + "\(hero2.name) est mort!")
                    }
                }else {
                    print("\n\(hero2.name) est déja mort dommage !")
                }
            case .magicien:
                if hero2.life > 0 {
                    hero2.life += 10
                    if hero2.life > 0 {
                        print("\n\(player.name) soigne !" + " \(hero2.name) a \(hero2.life) !")
                    } else {
                        print("\n\(player.name) soigne" + "\(hero2.name),mais il est déjà mort!")
                    }
                }else {
                    print("\(hero2.name) est déja mort dommage !")
                }
            case .MONSTRE:
                if hero2.life > 0 {
                    hero2.life -= 35
                    if hero2.life > 0 {
                        print("\n\(player.name) attaque !" + "\(hero2.name) n'a plus que  \(hero2.life) de vie !")
                    } else {
                        print("\n\(player.name) attaque !" + "\(hero2.name) est mort!")
                    }
                }else {
                    print("\n\(hero2.name) est déja mort dommage !")
                }
            default :
                print("erreur dans la fonction attaque() de la classe Game")
            }
        }
    }
}
