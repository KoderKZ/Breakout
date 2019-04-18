import Foundation
import SpriteKit

public class BallNode:SKNode{
    var sprite:SKSpriteNode!
    
    let radius:CGFloat = 40
    
    var expanded:Bool = false
    
    var ballTexture: [SKTexture] {
        return (0...2).map {
            if self.expanded{
                return SKTexture(imageNamed: "ball\($0)_expand")
            }else{
                return SKTexture(imageNamed: "ball\($0)")
            }
        }
    }
    
    
    override init() {
        super.init()
        setUpSprite()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSprite(){
        self.sprite = SKSpriteNode(texture: ballTexture[0])
        
        
        self.addChild(self.sprite!)
        
        setUpPhysicsBody()
        
        setUpAnimation()
        
        launchBall()
    }
    
    public func setUpAnimation(){
        self.sprite.removeAction(forKey: "fast")
        
        let animation = SKAction.animate(with: [ballTexture[0], ballTexture[1], ballTexture[2]],
                                         timePerFrame: 0.1, resize: true, restore: true)
        let loop = SKAction.repeatForever(animation)
        
        let action = SKAction.sequence([loop])
        
        self.sprite.run(action, withKey: "fast")
    }
    
    public func setUpPhysicsBody(){
        var vel:CGVector?
        if self.physicsBody?.velocity != nil{
            vel = (self.physicsBody?.velocity)!
        }
        
        if self.expanded{
            self.physicsBody = SKPhysicsBody(circleOfRadius:self.radius)
        }else{
            self.physicsBody = SKPhysicsBody(circleOfRadius:self.radius*1.5)
        }
        
        self.physicsBody = SKPhysicsBody(circleOfRadius:self.radius)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.friction = 0
        self.physicsBody?.restitution = 1
        
        self.physicsBody?.categoryBitMask = Bitmasks.ball.rawValue
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.collisionBitMask = Bitmasks.bottom.rawValue | Bitmasks.wall.rawValue | Bitmasks.tile.rawValue | Bitmasks.paddle.rawValue
        self.physicsBody?.contactTestBitMask = Bitmasks.tile.rawValue | Bitmasks.paddle.rawValue | Bitmasks.wall.rawValue | Bitmasks.powerup.rawValue
        
        if vel != nil{
            self.physicsBody?.velocity = vel!
        }
    }
    
    public func launchBall(){
        let randomNum = (Double(arc4random_uniform(120))+30.0)/180*M_PI
        
        let vel = CGVector(dx:cos(randomNum)*300,dy:sin(randomNum)*300)
        self.physicsBody?.velocity = vel
        
        updateBallRotation()
    }

    func updateBallRotation() {
        
        let dx = self.physicsBody!.velocity.dx
        let dy = self.physicsBody!.velocity.dy
        let angle = atan2(dy, dx)
        
        let action = SKAction.rotate(toAngle: angle - CGFloat(M_PI), duration: 0)
        
        self.run(action)
    }
    
    
}



