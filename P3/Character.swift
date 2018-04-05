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
}
