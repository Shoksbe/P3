//
//  Weapon.swift
//  P3
//
//  Created by De knyf Gregory on 5/04/18.
//  Copyright © 2018 Gregory De knyf. All rights reserved.
//

import Foundation

///A weapon used by the character
class Weapon {
    ///Weapon's name
    var name: String
    ///The rate of damage/care done by the weapon
    var damages: Int
    ///Weapon's category (attack or care)
    var category: Category

    /**
     Initialize a new Weapon with the provided specifications

     - Parameters:
     - name: Weapon's name
     - damages: The rate of damage/care done by the weapon
     - category: Weapon's category (attack or care)

     - Returns: A new weapon with the provided specifications
     */
    init(name: String, damages: Int, category: Category) {
        self.name = name
        self.damages = damages
        self.category = category
    }

    /**
     The different types of weapons

     - Care: The weapon gives care
     - Attack: The weapon causes damage
     */
    internal enum Category {
        case care, attack
    }

}
