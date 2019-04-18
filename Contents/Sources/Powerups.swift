import SpriteKit
import Foundation

class PowerupNode:SKNode{
    let width:CGFloat = 60
    var timer:Timer!
    var areaFrame:CGRect!
    var colors = [SKColor.red,SKColor.orange,SKColor.yellow,SKColor.green,SKColor.blue]
    
    var expandTexture: [SKTexture] {
        return (0...1).map {
            return SKTexture(imageNamed: "expand\($0)")
        }
    }
    var slowTexture: [SKTexture] {
        return (0...1).map {
            return SKTexture(imageNamed: "slow\($0)")
        }
    }
    var clearTexture: [SKTexture] {
        return (0...1).map {
            return SKTexture(imageNamed: "clear\($0)")
        }
    }
    
    init(time:Double,newFrame:CGRect){
        super.init()
        self.areaFrame = newFrame

        timer = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(self.createSprite), userInfo: nil, repeats: true)
        
    }
    
    public func createSprite(){
        var powerup = ""
        let randNum = Int(arc4random_uniform(3))
        let sprite:SKSpriteNode!
        if randNum == 0{
            powerup = "slow"
            sprite = SKSpriteNode(texture: slowTexture[0])
        }else if randNum == 1{
            powerup = "expand"
            sprite = SKSpriteNode(texture: expandTexture[0])
        }else{
            powerup = "clear"
            let colorRand = Int(arc4random_uniform(5))
            sprite = SKSpriteNode(texture:clearTexture[0])
            sprite.color = colors[colorRand]
            sprite.colorBlendFactor = 1.0
        }

        let x = (CGFloat(arc4random()) / CGFloat(UINT32_MAX)*1000)-500
        let y = (CGFloat(arc4random()) / CGFloat(UINT32_MAX)*self.areaFrame.size.height)+areaFrame.origin.y
        

        sprite.position = CGPoint(x:x,y:self.width-y)
        sprite.name = powerup
        sprite.size = CGSize(width:self.width, height:self.width)
        addChild(sprite)
        
        sprite.physicsBody = SKPhysicsBody(rectangleOf:CGSize(width:self.width,height:self.width))

        sprite.physicsBody?.affectedByGravity = false
        sprite.physicsBody?.isDynamic = true
        sprite.physicsBody?.allowsRotation = false

        sprite.physicsBody?.categoryBitMask = Bitmasks.powerup.rawValue
        sprite.physicsBody?.contactTestBitMask = Bitmasks.ball.rawValue
        
        sprite.removeAction(forKey: "fast")
        
        if randNum == 0{
            let animation = SKAction.animate(with: [slowTexture[0], slowTexture[1]],
                                         timePerFrame: 0.25, resize: true, restore: true)
            let loop = SKAction.repeatForever(animation)
            
            let action = SKAction.sequence([loop])
            
            sprite.run(action, withKey: "fast")
        }else if randNum == 1{
            let animation = SKAction.animate(with: [expandTexture[0], expandTexture[1]],
                                                    timePerFrame: 0.25, resize: true, restore: true)
            let loop = SKAction.repeatForever(animation)
            
            let action = SKAction.sequence([loop])
            
            sprite.run(action, withKey: "fast")
        }else{
            let animation = SKAction.animate(with: [clearTexture[0], clearTexture[1]],
                                             timePerFrame: 0.25, resize: true, restore: true)
            let loop = SKAction.repeatForever(animation)
            
            let action = SKAction.sequence([loop])
            
            sprite.run(action, withKey: "fast")
        }

    }


    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
