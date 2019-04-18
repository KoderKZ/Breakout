import Foundation
import SpriteKit

enum Bitmasks: UInt32 {
    case ball     = 0b00000001
    case wall     = 0b00000010
    case bottom   = 0b00000100
    case tile     = 0b00001000
    case paddle   = 0b00010000
    case powerup  = 0b00100000
}

enum CollisionBitmasks: UInt32 {
    case none     = 0b00000000
}

enum ContactTestBitmasks: UInt32 {
    case ball     = 0b00000001
}

