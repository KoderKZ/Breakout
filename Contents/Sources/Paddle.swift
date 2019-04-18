
import Foundation
import UIKit
import SpriteKit
import CoreMotion
public class PaddleNode:SKNode{
    var size:CGSize?
    var motionManager = CMMotionManager()
    var paddle:SKShapeNode!
    
    var left:Bool = false
    var stationary:Bool = true
    var starting:Double = 0
    init(withSize:CGSize){
        super.init()
        
        self.size = withSize
        createPaddle()
    }
    
    func createPaddle(){
        
        paddle = SKShapeNode(rectOf:CGSize(width:350,height:25))

        paddle.position = CGPoint(x:0,y:-size!.height/2+75)
        paddle.fillColor = .white
        self.name = "paddle"



        self.addChild(paddle)



        self.physicsBody = SKPhysicsBody(rectangleOf:CGSize(width:350,height:25),center:paddle.position)

        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false

        self.physicsBody?.categoryBitMask = Bitmasks.paddle.rawValue
        self.physicsBody?.contactTestBitMask = Bitmasks.ball.rawValue | Bitmasks.wall.rawValue
        self.physicsBody?.collisionBitMask = Bitmasks.ball.rawValue | Bitmasks.wall.rawValue
        
    }
    
    func setUpGyroscope(){
        motionManager.gyroUpdateInterval = 0.1
        motionManager.startGyroUpdates(to: .main) { (data,error) in
            if let myData = data{
                self.starting += myData.rotationRate.x
                if self.starting > 0.5{
                    self.left = true
                    self.stationary = false
                }else if self.starting < -0.5{
                    self.left = false
                    self.stationary = false
                }else{
                    self.stationary = true
                }
            }
        }
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
