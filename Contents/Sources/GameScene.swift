import Foundation
import SpriteKit


public class GameScene:SKScene{
    public var gameArea:GameArea!
    var slowed:Bool = false
    var lost:Bool = false
    public var gyroscope:Bool = false
    public var autoMove:Bool = false
    public var touchMove:Bool = false
    public var powerups:Bool = false
    
    public var controls:Bool = false
    var left:Bool = false
    var right:Bool = false
    
    public func setUpGameArea(){
        let size = CGSize(width:1000,height:1000)
        self.gameArea = GameArea(withSize:size)
        self.gameArea?.xScale = 0.5
        self.gameArea?.yScale = 0.5
        self.scaleMode = .aspectFill
        self.addChild(self.gameArea!)
        
        self.physicsWorld.contactDelegate = self
    }
    
    public override func update(_ currentTime: TimeInterval){
        if self.gameArea!.ball != nil{
            let dx = self.gameArea.ball.physicsBody?.velocity.dx
            let dy = self.gameArea.ball.physicsBody?.velocity.dy
            let angle = atan2(dy!, dx!)

            if slowed{
                let vel = CGVector(dx:cos(angle)*200,dy:sin(angle)*200)
                self.gameArea!.ball.physicsBody?.velocity = vel
                self.gameArea!.ball.updateBallRotation()
            }else{
                let vel = CGVector(dx:cos(angle)*300,dy:sin(angle)*300)
                self.gameArea!.ball.physicsBody?.velocity = vel
                self.gameArea!.ball.updateBallRotation()
            }
            
            self.gameArea!.paddle.run(SKAction.moveTo(y:0,duration:0))
            self.gameArea!.paddle.physicsBody?.velocity = CGVector(dx:0,dy:0)

            if self.gameArea!.ball.position.y < -self.frame.size.height+30{
                self.gameArea!.ball.removeFromParent()
                if self.powerups{
                    self.gameArea!.powerups.removeFromParent()
                }
                self.gameArea!.end.run(SKAction.fadeIn(withDuration:0.25))
                self.gameArea!.end.alpha = 1
                if !lost{
                    self.run(Sounds.sharedInstance.lose)
                    lost = true
                }
            }

            if autoMove{
                self.gameArea!.paddle.run(SKAction.moveTo(x:self.gameArea!.ball.position.x,duration:0.1))
            }
            
            if self.controls{
                if self.left{
                    self.gameArea!.paddle.run(SKAction.move(by:CGVector(dx:-10,dy:0),duration:0.1))
                }
                if self.right{
                    self.gameArea!.paddle.run(SKAction.move(by:CGVector(dx:10,dy:0),duration:0.1))
                }
            }
            
            if !self.gameArea!.paddle.stationary{
                if self.gameArea!.paddle.left{
                    self.gameArea!.paddle.run(SKAction.move(by:CGVector(dx:-10,dy:0),duration:0.1))
                }else{
                    self.gameArea!.paddle.run(SKAction.move(by:CGVector(dx:10,dy:0),duration:0.1))
                }
            }
        }
    }

}

extension GameScene:SKPhysicsContactDelegate{
    public func didEnd(_ contact: SKPhysicsContact) {
        if !(contact.bodyA.node != self.gameArea!.ball && contact.bodyB.node != self.gameArea!.ball){
            let other = contact.bodyA.node == self.gameArea!.ball ? contact.bodyB.node! : contact.bodyA.node!
            if other.name == "tile"{
                if self.gameArea!.tiles.children.count == 1{
                    self.gameArea!.ball.removeFromParent()
                    self.gameArea!.end.run(SKAction.fadeIn(withDuration:0.25))
                    self.gameArea!.confetti.launchConfetti()
                    self.run(Sounds.sharedInstance.win)
                    if self.powerups{
                        self.gameArea!.powerups.removeFromParent()
                    }
                }else{
                    self.run(Sounds.sharedInstance.tile)
                }
                other.removeFromParent()
            }else if other.name == "slow"{
                self.slowed = true
                other.removeFromParent()
                self.run(Sounds.sharedInstance.slow)
                delay(5){
                    self.slowed = false
                }
            }else if other.name == "expand"{
                self.gameArea!.ball.expanded = true
                self.gameArea!.ball.setUpPhysicsBody()
                self.gameArea!.ball.setUpAnimation()
                other.removeFromParent()
                self.run(Sounds.sharedInstance.expand)
                delay(5){
                    self.gameArea!.ball.expanded = false
                    self.gameArea!.ball.setUpPhysicsBody()
                    self.gameArea!.ball.setUpAnimation()
                }
            }else if other.name == "clear"{
                let color = (other as! SKSpriteNode).color
                var colorString = ""
                switch color{
                case SKColor.red:
                    colorString = "red"
                    break
                case SKColor.orange:
                    colorString = "orange"
                    break
                case SKColor.yellow:
                    colorString = "yellow"
                    break
                case SKColor.green:
                    colorString = "green"
                    break
                case SKColor.blue:
                    colorString = "blue"
                    break
                default:
                    break
                }
                for var i in (self.gameArea!.tiles.tileDict[colorString] as! NSArray){
                    let tile = i as! SKSpriteNode
                    if tile.parent != nil{
                        tile.removeFromParent()
                    }
                }
                if self.gameArea!.tiles.children.count == 0{
                    self.gameArea!.ball.removeFromParent()
                    self.gameArea!.end.run(SKAction.fadeIn(withDuration:0.25))
                    self.gameArea!.confetti.launchConfetti()
                    self.run(Sounds.sharedInstance.win)
                    if self.powerups{
                        self.gameArea!.powerups.removeFromParent()
                    }
                }
                self.run(Sounds.sharedInstance.clear)
                other.removeFromParent()
            }else if other.name == "paddle"{
                self.run(Sounds.sharedInstance.wall)
                self.gameArea!.ball.launchBall()
            }else if other.name == "wall"{
                self.run(Sounds.sharedInstance.wall)
            }
        }
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.gameArea!.start.alpha == 1{
            self.gameArea!.start.run(SKAction.fadeOut(withDuration:0.25))
            self.gameArea!.start.alpha = 0
            self.gameArea!.spawnBall()
            if self.powerups{
                self.gameArea!.spawnPowerups(time:15)
            }
            if self.gyroscope{
                self.gameArea!.paddle.setUpGyroscope()
            }
            if self.controls{
                self.gameArea!.setUpControls()
            }

            self.lost = false
        }else if self.gameArea!.end.alpha == 1{
            self.gameArea!.end.run(SKAction.fadeOut(withDuration:0.25))
            self.gameArea!.end.alpha = 0
            if self.powerups{
                self.gameArea!.spawnPowerups(time:15)
            }
            self.gameArea!.paddle.removeFromParent()
            self.gameArea!.setUpViews()
            self.gameArea!.spawnBall()
            if self.gyroscope{
                self.gameArea!.paddle.setUpGyroscope()
            }
            if self.controls{
                self.gameArea!.controls.removeFromParent()
                self.gameArea!.setUpControls()
            }
            self.gameArea!.end.removeFromParent()
            self.gameArea!.addChild(self.gameArea!.end)
            self.lost = false
        }else if self.touchMove && self.gameArea!.ball.parent != nil{
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            self.gameArea!.paddle.run(SKAction.moveTo(x:touchLocation.x*1.35,duration:0))
        }else if self.controls && self.gameArea!.ball.parent != nil{
            let touch = touches.first
            let touchLocation = touch!.location(in: self.gameArea!)
            if touchLocation.x < 0{
                self.left = true
            }else{
                self.right = true
            }
        }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.touchMove && self.gameArea!.ball.parent != nil{
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            self.gameArea!.paddle.run(SKAction.moveTo(x:touchLocation.x*1.35,duration:0))
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first
        let touchLocation = touch!.location(in: self.gameArea!)

        if touchLocation.x < 0{
            self.left = false
        }else{
            self.right = false
        }
    }
    
    func delay(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
