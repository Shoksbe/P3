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
 Begin a new game
 */
func playGame() {

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
}
