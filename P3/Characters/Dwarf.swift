//
//  Dwarf.swift
//  P3
//
//  Created by De knyf Gregory on 5/04/18.
//  Copyright © 2018 Gregory De knyf. All rights reserved.
//

import Foundation

class Dwarf: Character {
    let defaultName = "Dwarf"

    init() {
        super.init(name: self.defaultName, weapon: HeavyAx(), lifePoint: 90, type: .fire)
    }
}
