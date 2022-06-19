//
//  Eggs.swift
//  EggTimerSelf
//
//  Created by Ömer Faruk Kılıçaslan on 19.06.2022.
//

import Foundation

class Eggs {
    
    enum EggType {
        case easy
        case medium
        case hard
        case soHard
    }
    
    static func eggType(type: EggType) -> [String] {
        
        switch type {
        case .easy:
            return ["Easy","egg-1"]
        case .medium:
            return ["Medium","egg-2"]
        case .hard :
            return ["Hard","egg-3"]
        case .soHard :
            return ["So Hard","egg-4"]
        }
    }
    
    static func cooking(style: EggType) -> Int{
            switch style {
            case .easy:
                return 120
            case .medium:
                return 180
            case .hard:
                return 240
            case .soHard:
                return 300
            }
        }
}
