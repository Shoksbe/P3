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
            if self is Mage {
                description = "\(self.name)(\(self.type.rawValue)): \(self.lifePoint)PV • \(self.weapon.damages) care"
            } else {
                description = "\(self.name)(\(self.type.rawValue)): \(self.lifePoint)PV • \(self.weapon.damages) attack"
            }
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

    /**
     Check if the attacker's type is strong against the opponent's type

     - Returns: A bool, *true* if the attacker is strong against the opponent type and *false* if not
     */
    private func typeOfAttackerIsStrong(against opponentType: Type) -> Bool {
        var isStrong: Bool = false

        if self.type.strongAgainst == opponentType.rawValue {
            isStrong = true
        }

        return isStrong
    }

    /**
     Check if the attacker's type is weakness against the opponent's type

     - Returns: A bool, *true* if the attacker is weakness against the opponent type and *false* if not
     */
    private func typeOfattackerIsWeakness(against opponentType: Type) -> Bool {
        var isWeakness: Bool = false

        if self.type.weaknessAgainst == opponentType.rawValue {
            isWeakness = true
        }

        return isWeakness
    }
    /**
     Attack another character

     - Parameters: The character to attack
     */
    func attack(_ opponent: Character) {

        ///The damage caused by the weapon.
        var weaponDamages = self.weapon.damages

        ///A description of the bonus/weakness caused
        var weaponDamagesDescription: String = ""

        //Damage bonus
        if typeOfAttackerIsStrong(against: opponent.type) {
            weaponDamages = self.weapon.damages + 5
            weaponDamagesDescription = "+ 5"

        } else if typeOfattackerIsWeakness(against: opponent.type) {
            weaponDamages = self.weapon.damages - 5
            weaponDamagesDescription = "- 5"
        }

        //The character's life can not go below zero.
        if opponent.lifePoint < weaponDamages {
            opponent.lifePoint = 0
        } else {
            opponent.lifePoint -= weaponDamages
        }

        //Resume action
        print("\n- Batlle's description :")
        print("\n\(self.name)(\(self.type.rawValue)) ⚔️ \(opponent.name)(\(opponent.type.rawValue))")
        print("\nHe inflicts, \(weaponDamages) damage (\(self.weapon.damages) \(weaponDamagesDescription)).")

        if opponent.lifePoint == 0 {
            print("\(opponent.name) is dead !\n")
        } else {
            print("He has \(opponent.lifePoint)PV\n")
        }
    }

    /**
     Heal a character in the same team

     - Parameters: The character to heal
     */
    func heal(_ characterToHeal: Character) {
        characterToHeal.lifePoint += self.weapon.damages

        //Resume action
        print("\n- Description of the battle:\n")
        print("\(self.name) cared \(characterToHeal.name) and gave him \(self.weapon.damages)PV.\n")
        print("He has now \(characterToHeal.lifePoint)PV\n")
    }
}
