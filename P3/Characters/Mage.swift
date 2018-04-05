//
//  Mage.swift
//  P3
//
//  Created by De knyf Gregory on 5/04/18.
//  Copyright © 2018 Gregory De knyf. All rights reserved.
//

import Foundation

class Mage: Character {
    let defaultName = "Mage"

    init() {
        super.init(name: self.defaultName, weapon: Scepter(), lifePoint: 80, type: .normal)
    }
}
