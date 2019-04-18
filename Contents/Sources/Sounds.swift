import SpriteKit
class Sounds{
    
    static let sharedInstance : Sounds = {
        let instance = Sounds()
        return instance
    }()
    
    init() {
    }
    
    let wall      = SKAction.playSoundFileNamed("wall", waitForCompletion: false)
    let tile      = SKAction.playSoundFileNamed("tile", waitForCompletion: false)
    let win       = SKAction.playSoundFileNamed("win", waitForCompletion: false)
    let lose      = SKAction.playSoundFileNamed("lose", waitForCompletion: false)
    let expand    = SKAction.playSoundFileNamed("expand", waitForCompletion: false)
    let slow      = SKAction.playSoundFileNamed("slow", waitForCompletion: false)
    let clear     = SKAction.playSoundFileNamed("clear", waitForCompletion: false)

}
