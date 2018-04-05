//
//  Player.swift
//  P3
//
//  Created by Gregory De knyf on 5/04/18.
//  Copyright © 2018 Gregory De knyf. All rights reserved.
//

import Foundation

///A player in the game
class Player {

    ///The name of the player
    var name: String

    ///The characters of his team
    var teamOfCharacter: [Character]

    /**
     Initialize a new player with the provided specifications
     
     - Parameters:
     - name: Player's name
     - teamOfCharacters: The characters of the player team
     
     - Returns: A new player with the provided specifications
     */
    init(name: String, teamOfCharacter: [Character]) {
        self.name = name
        self.teamOfCharacter = teamOfCharacter
    }

    /**
     Displays the characters of the team with their description
     */
    func displayTeam() {
        var index: Int = 1

        for character in self.teamOfCharacter {
            print("\(index). " + character.description())

            index += 1
        }
    }

    /**
     Selection of the character who will fight

     - Parameter player: The player who must choose a character

     - Returns: The character who will fight
     */
    func chooseFighter(inTeamOf player: Player) -> Character {

        var userChoice: Int
        var fighter: Character!
        var choiceIsCorrect: Bool = false

        //Choose who will fight
        repeat {
            if let inputText = readLine() {
                if inputText == "1" || inputText == "2" || inputText == "3" {
                    userChoice = Int(inputText)!
                    fighter = player.teamOfCharacter[userChoice-1]
                    if fighter.isAlive() {
                        choiceIsCorrect = true
                    } else {
                        print("This one looks dead, please choose another!")
                    }
                } else {
                    print("It is not a valid choice")
                }
            }
        }while(!choiceIsCorrect)

        return fighter
    }

    /**
     Check if there are any survivors in the team.

     - Returns: Bool, *true* if he've survivor and *false* if not
     */
    func checkForSurvivor() -> Bool {
        var haveSurvivor: Bool = false

        for character in self.teamOfCharacter where character.lifePoint > 0 {
            haveSurvivor =  true
        }

        return haveSurvivor
    }
}
