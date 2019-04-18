import SpriteKit
import Foundation

class WallNode:SKNode{
    var size:CGSize!
    init(withSize:CGSize){
        super.init()
        
        self.size = withSize

        
        createWalls()
    }
    
    func createWalls(){
        
        let border = SKShapeNode(rectOf:CGSize(width:size.width,height:size.height+40))
        border.position = CGPoint(x:0,y:-20)
        border.name = "wall"
        self.addChild(border)
        
        self.name = "wall"
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom:border.frame)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.friction = 0
        
        self.physicsBody?.categoryBitMask = Bitmasks.wall.rawValue
        self.physicsBody?.collisionBitMask = Bitmasks.ball.rawValue
        self.physicsBody?.contactTestBitMask = Bitmasks.ball.rawValue

    }

    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
