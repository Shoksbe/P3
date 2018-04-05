//
//  Soldier.swift
//  P3
//
//  Created by De knyf Gregory on 5/04/18.
//  Copyright © 2018 Gregory De knyf. All rights reserved.
//

import Foundation

class Soldier: Character {
    let defaultName = "Soldier"

    init() {
        super.init(name: self.defaultName, weapon: Sword(), lifePoint: 100, type: .water)
    }
}
