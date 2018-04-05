//
//  main.swift
//  P3
//
//  Created by Gregory De knyf on 5/04/18.
//  Copyright © 2018 Gregory De knyf. All rights reserved.
//

import Foundation

///Current game
var game: Game!

///All nickname used in the game
var nicknameUsed = [String]()

/**
 Ask the player what name he wants to use and check if it's correct(more than 3 characters) and free.
 
 - returns: String, whit the nickname choose
 */
private func chooseNickname() -> String {

    /**
     Check if the chosen nickname is free
     - parameter nickname: The nickame chosen by the user
     - returns: A bool, *true* if used and *false* if isn't used
     */
    func nicknameIsAlreadyUsed(_ nickname: String) -> Bool {

        var nicknameIsAlreadyUsed = false

        //browse the nickname table to see if it's already used
        for name in nicknameUsed where name == nickname {
            nicknameIsAlreadyUsed = true
        }

        return nicknameIsAlreadyUsed
    }

    ///The nickname chosen by the player
    var nickname: String!

    ///To know if the nickname meets the conditions
    var choiceIsCorrect = false

    //while the choice of the nickname isn't possible
    repeat {

        //Verify if input text isn't empty
        if let nicknameChoosed = readLine() {

            //Nickname need min 3 characters and max 14
            if nicknameChoosed.count >= 3 && nicknameChoosed.count < 15 {

                //same nickname isn't permitted
                if !nicknameIsAlreadyUsed(nicknameChoosed) {
                    nickname = nicknameChoosed
                    nicknameUsed.append(nickname)
                    choiceIsCorrect = true

                } else {
                    print("This name is already used.")
                }
            } else {
                print("The name must have at least 3 characters and max 14.")
            }
        }
    }while(!choiceIsCorrect)

    return nickname
}

/**
 Use the character's class as a nickname if the player does not want to choose one.

 - Returns: Bool, *true* If the player does not want to choose a nickname
 and *false* If the player wants to choose the nickname.
 */
func useCharcaterNameByDefault() -> Bool {
    var useDefaultName = false
    var userHasChosen = false

    print("\nDo you want to choose the nicks of your characters? ? (y/n)")
    while !userHasChosen {

        //Verify if input text isn't empty
        if let inputText = readLine() {

            if inputText == "y" {
                userHasChosen = true
            } else if inputText == "n" {
                userHasChosen = true
                useDefaultName = true
            } else {
                print("This is not a correct answer.")
            }
        }
    }

    return useDefaultName
}

/**
 Choose the three characters used during the game

 - returns: A table with 3 characters
 */
private func createTeamOfCharacter() -> [Character] {
    ///The characters chosen by the user
    var characters = [Character]()
    let useDefaultName: Bool

    print("\nHere are the characters available, you can choose 3:"
        + "\n"
        + "\n 1. Soldier - PV:100 / Attack:10 / Type:Water"
        + "\n 2. Mage - PV:80 / Healts:8 / Type:Normal"
        + "\n 3. Dward - PV:60 / Attack:15 / Type:Grass"
        + "\n 4. Colossus - PV:150 / Attack:7 / Type:Fire")

    useDefaultName = useCharcaterNameByDefault()

    for index in 1...3 {
        ///The number chosen by the user
        var userChoice: Int!
        ///The choice respects the constraints
        var choiceIsCorrect: Bool = false
        ///Character's class
        var character: Character!

        print("\n- Choice of character n°\(index)")

        //Choice the character
        repeat {
            //Save userchoice
            if let inputText = readLine() {
                //Verify if the choice as possible
                if inputText == "1" || inputText == "2" || inputText == "3" || inputText == "4" {
                    userChoice = Int(inputText)!
                    choiceIsCorrect = true
                } else {
                    print("Itsn't a possible choice")
                }
            }
        } while (!choiceIsCorrect)

        //Save the user choice
        switch userChoice {
        case 1: character = Soldier()
        case 2: character = Mage()
        case 3: character = Dwarf()
        case 4: character = Colossus()
        default: print("An unknown error has occurred.")
        }

        //Set the character's name
        if !useDefaultName {
            //Choice a name for the character
            print("\nChoose a name for your \(character.name)")
            character.name = chooseNickname()
        }

        //Append the new character
        characters.append(character)
    }
    return characters
}

/**
 Show the treasure randomly.

 - Returns: Bool, *true* if the treasure appear and *false* if not
 */
private func treasureWillAppear() -> Bool {
    //Random number to know if the treasur will appear or not
    let randomNumber1 = Int(arc4random_uniform(3))
    //Random number to know if the treasur will appear or not
    let randomNumber2 = Int(arc4random_uniform(3))

    return randomNumber1 == randomNumber2
}

/**
 Recover a random weapon

 - Parameters: The category of the weapon(Attack/Care)

 - Returns: The new random weapon
 */
private func treasureOpening(whitWeaponType category: Weapon.Category) -> Weapon {
    //weapon in category : Care
    var careWeapons: [Weapon] = []
    //Weapon in category : Attack
    var attackWeapons: [Weapon] = []
    //Treasure with all weapons in the game
    let treasure: [Weapon] = game.weapons
    //The futur weapon
    var newWeapon: Weapon
    //A random number for get weapon
    let randomIndex: Int

    //implémentation of weapons tables
    for weapon in treasure {
        //Attack weapons
        if weapon.category == .attack {
            attackWeapons.append(weapon)
            //Care weapons
        } else {
            careWeapons.append(weapon)
        }
    }

    print("\n*****************************")
    print("* A treasure is appearing ! *")
    print("*****************************")

    switch category {

    //Collect a weapon of type "Attack".
    case .attack:
        //random index for choose a new weapon
        randomIndex = Int(arc4random_uniform(UInt32(attackWeapons.count)))

        //Get the weapon
        newWeapon = attackWeapons[randomIndex]

        //Describe the weapon received
        print("\n* You find : \(newWeapon.name) that make \(newWeapon.damages) damages. ")

    //Collect a weapon of type "Care".
    case .care:
        //random index for choose a new weapon
        randomIndex = Int(arc4random_uniform(UInt32(careWeapons.count)))

        //Get the weapon
        newWeapon = careWeapons[randomIndex]

        //Describe the weapon received
        print("\n* You find : \(newWeapon.name) that make \(newWeapon.damages) life. ")
    }

    return newWeapon
}

/**
 Ask if the player will play again and launch/quit the game
 */
func willYouPlayAgain() {
    print("Play again ? (y/n)")

    loop: while true {
        if let inputText = readLine() {
            if inputText == "y" {
                nicknameUsed = []
                playGame()
            } else if inputText == "n" {
                break loop
            } else {
                print("This is not a correct answer.")
            }
        }
    }
}

/**
 Introduction text with some explication
 */
func introductionText() {
    print("**********************")
    print("| Welkom : Project 3 |")
    print("**********************\n")
    print("Rules:")
    print("------")
    print("1) No resuscitation")
    print("2) +5 damage if you attack a character of the same type as your strength.")
    print("3) -5 damage if you attack a character of the same type as your weakness.\n")
    print("Character's type:")
    print("-----------------")
    print("Fire -> weakness: Water, strength: Grass")
    print("Water -> weakness: Grass, strength: Fire")
    print("Grass -> weakness: Fire, strength: Water")
    print("Normal - > weakness: Nothing, strength: Nothing\n")
    print("_________________________________________________")
    print("_________________________________________________\n\n")
}

/**
 Begin a new game
 */
func playGame() {

    introductionText()

    //
    // STEP 1 : TEAMS
    //

    print("\n* Please choose the nickname for Player 1. *")
    print("*-----------------------------------------*")
    let player1 = Player(name: chooseNickname(), teamOfCharacter: createTeamOfCharacter())

    print("\n* Please choose the nickname for Player 2. *")
    print("*-----------------------------------------*")
    let player2 = Player(name: chooseNickname(), teamOfCharacter: createTeamOfCharacter())

    game = Game([player1, player2])

    //
    // STEP 2 : FIGHT
    //

    while !game.isOver {

        //
        // Lap counter
        //
        //Increment lap
        game.lapCounter += 1
        print("\n*************\n* Round : \(game.lapCounter) *\n*************")

        //
        // Display team
        //
        print("\n# Team of: \(game.players[0].name)")
        print("*---------------------------*")
        game.players[0].displayTeam()

        print("\n# Team of: \(game.players[1].name)")
        print("*---------------------------*")
        game.players[1].displayTeam()

        //
        //Choose the fighter
        //
        print("\n* \(game.currentPlayer.name): Choose a fighter *")
        print("*-------------------------------*")
        let fighter = game.currentPlayer.chooseFighter(inTeamOf: game.currentPlayer)

        //
        //Treasure appartition
        //
        if treasureWillAppear() {
            //Get a new weapon
            let newWeapon = treasureOpening(whitWeaponType: fighter.weapon.category)
            //Affect the new weapon
            fighter.weapon = newWeapon
        }

        //
        //Attack/Heal
        //
        if fighter is Mage {
            print("\n* \(game.currentPlayer.name): Choose a character to heal *")
            print("*-------------------------------*")
            let characterToHeal = game.currentPlayer.chooseFighter(inTeamOf: game.currentPlayer)
            fighter.heal(characterToHeal)
        } else {
            print("\n* \(game.currentPlayer.name): Choose a opponent *")
            print("*-------------------------------*")
            let opponent = game.currentPlayer.chooseFighter(inTeamOf: game.opponentToCurrentPlayer)
            fighter.attack(opponent)
        }

        //Check if the next player have survivor, if not, game is over and the current player is the winner
        game.winner = game.opponentToCurrentPlayer.checkForSurvivor() ? nil : game.currentPlayer

        //
        //Next player
        //
        game.nextPlayer()
    }

    //
    //Winner
    //
    print("\n***************************")
    print("**** And the winner is ****")
    print("***************************")
    print("\n#\(game.winner!.name) in \(game.lapCounter) rounds.\n")

    //
    //Play again ?
    //
    willYouPlayAgain()
}

//Run the game
playGame()
