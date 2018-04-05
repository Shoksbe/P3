//
//  Game.swift
//  P3
//
//  Created by De knyf Gregory on 5/04/18.
//  Copyright © 2018 Gregory De knyf. All rights reserved.
//

import Foundation

class Game {
    ///The players who are in the game.
    let players: [Player]
    ///All game's weapons
    let weapons: [Weapon] = [Mace(), HeavyAx(), Scepter(), Sword(), Stick(),
                             MagicWand(), Bow(), BigPotion(), SmallPotion()]
    ///Who is playing
    var currentPlayer: Player
    ///the opponent of the player who is playing
    var opponentToCurrentPlayer: Player
    ///How many rounds were played
    var lapCounter: Int = 0
    ///Game's winner
    var winner: Player?
    ///To know if the game is over
    var isOver: Bool {
        return winner != nil
    }

    /**
     Initialize a new player with the provided specifications

     - Parameters:
     - players: The players who will participate in the game.

     - Returns: A new Game with the provided specifications
     */
    init(_ players: [Player]) {
        self.players = players

        //Make a random first player
        let randomNumber = Int(arc4random_uniform(UInt32(players.count)))
        self.currentPlayer = players[randomNumber]

        //Assign the opponent
        if self.currentPlayer.name == players[0].name {
            self.opponentToCurrentPlayer = players[1]
        } else {
            self.opponentToCurrentPlayer = players[0]
        }
    }
}
