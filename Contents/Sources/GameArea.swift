import Foundation
import SpriteKit

public class GameArea:SKCropNode{
    var size:CGSize!
    var ball:BallNode!
    var paddle:PaddleNode!
    var walls:WallNode!
    var powerups:PowerupNode!
    var start:StartNode!
    var end:EndNode!
    var tiles:TileNode!
    var controls:ControlsNode!
    var confetti:ConfettiNode!
    init(withSize size: CGSize) {
        super.init()
        self.size = size
        
        setUpViews()
        setUpStates()
    }
    
    func setUpViews(){
        setUpTiles()
        setUpPaddle()
        setWalls()
        setUpConfetti()
    }
    
    func setUpTiles(){
        tiles = TileNode(withSize:self.size)
        
        self.addChild(tiles)

    }
    
    func setUpPaddle(){
        paddle = PaddleNode(withSize:self.size)
        
        self.addChild(paddle)
    }
    
    public func spawnBall(){
        ball = BallNode()
        let paddlePosition = -self.size!.height/2+65
        ball.run(SKAction.move(to:CGPoint(x:0,y:paddlePosition+ball.radius+50),duration:0))
        self.addChild(ball)
    }
    
    public func setWalls(){
        walls = WallNode(withSize:self.size)
        self.addChild(walls)
    }
    
    public func spawnPowerups(time:Int){
        let yMargin = CGFloat((4.0+1.0)*5)
        let ySizeMargin = CGFloat((4+2)*75)
        let finalY = -(yMargin+ySizeMargin)+self.size.height/2
        
        let frame = CGRect(x:-self.frame.size.width/2,y:finalY,width:self.frame.size.width,height:self.frame.size.height-(paddle.paddle.position.y+25)-finalY)
        self.powerups = PowerupNode(time:Double(time),newFrame:frame)
        self.addChild(powerups)
    }
    
    public func setUpControls(){
        self.controls = ControlsNode(withSize:self.size)
        self.addChild(self.controls)
    }
    
    func setUpStates(){
        start = StartNode(withSize:self.size)
        self.addChild(start)
        
        end = EndNode(withSize:self.size)
        end.alpha = 0
        self.addChild(end)
    }
    
    func setUpConfetti(){
        confetti = ConfettiNode()
        addChild(confetti)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
