//
//  Character.swift
//  P3
//
//  Created by De knyf Gregory on 5/04/18.
//  Copyright © 2018 Gregory De knyf. All rights reserved.
//

import Foundation

///Represents a character(Mage, fighter, colossus, dwarf, etc...).
class Character {
    ///Character's name
    var name: String
    ///Character's weapon
    var weapon: Weapon
    ///Character's life
    var lifePoint: Int
    ///Character's type
    let type: Type
    /**
     Initialize a new character with the provided specifications

     - Parameters:
     - name: Character's name
     - classe: His class (mage, fighter, colossus, ...)

     - Returns: A new character with the provided specifications
     */
    init(name: String, weapon: Weapon, lifePoint: Int, type: Type) {
        self.name = name
        self.weapon = weapon
        self.lifePoint = lifePoint
        self.type = type
    }

    /**
     Make a character's description

     - Returns: String with the character's description
     */
    func description() -> String {
        let description: String

        if self.lifePoint == 0 { // if it's dead
            description = "\(self.name) is dead."
        } else {
            description = "\(self.name)(\(self.type.rawValue)): \(self.lifePoint) PV • \(self.weapon.damages) attack"
        }

        return description
    }

    /**
     Check if the character still has life.

     - Returns: A bool, *true* if the character still has life and *false* if not
     */
    func isAlive() -> Bool {
        return self.lifePoint > 0
    }
}
