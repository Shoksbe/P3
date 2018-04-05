//
//  Type.swift
//  P3
//
//  Created by De knyf Gregory on 5/04/18.
//  Copyright © 2018 Gregory De knyf. All rights reserved.
//

import Foundation

enum Type: String {
    case fire = "Fire"
    case water = "Water"
    case grass = "Grass"
    case normal = "Normal"

    var strongAgainst: String {
        switch self {
        case .fire:
            return "Grass"
        case .grass:
            return "Water"
        case .water:
            return "Fire"
        case .normal:
            return "Nothing"
        }
    }

    var weaknessAgainst: String {
        switch self {
        case .fire:
            return "Water"
        case .grass:
            return "Fire"
        case .water:
            return "Grass"
        case .normal:
            return "Nothing"
        }
    }
}
