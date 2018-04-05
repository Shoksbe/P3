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

}
