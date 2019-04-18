import SpriteKit
import Foundation

class ConfettiNode:SKNode{
    var emitter:SKEmitterNode!
    let colors = [SKColor.red,SKColor.orange,SKColor.yellow,SKColor.green,SKColor.blue,SKColor.purple]
    
    override init() {
        super.init()
    }
    
    public func launchConfetti(){
        self.emitter = SKEmitterNode(fileNamed:"particle")

        self.emitter.position = CGPoint(x:0,y:0)

        self.emitter.particleColorSequence = nil
        self.emitter.particleColorBlendFactor = 1.0

        self.addChild(emitter)
        
        let action = SKAction.run({
            [unowned self] in
            let random = Int(arc4random_uniform(UInt32(self.colors.count)))

            self.emitter.particleColor = self.colors[random]
        })
        let wait = SKAction.wait(forDuration:0.05)

        self.run(SKAction.repeatForever(SKAction.sequence([action,wait])),withKey:"confetti")

        delay(2){
            self.removeAction(forKey:"confetti")
        }
    }
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func delay(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
