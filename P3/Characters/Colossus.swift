//
//  Colossus.swift
//  P3
//
//  Created by De knyf Gregory on 5/04/18.
//  Copyright © 2018 Gregory De knyf. All rights reserved.
//

import Foundation

class Colossus: Character {
    let defaultName = "Colossus"

    init() {
        super.init(name: self.defaultName, weapon: Mace(), lifePoint: 130, type: .fire)
    }
}
