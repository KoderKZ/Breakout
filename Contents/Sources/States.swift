import SpriteKit
import Foundation

class StartNode:SKNode{
    var background:SKShapeNode!
    var label:SKLabelNode!
    var size:CGSize!
    init(withSize:CGSize){
        super.init()
        self.size = withSize
        createNode()
    }
    
    public func createNode(){
        self.background = SKShapeNode(rectOf:CGSize(width:self.size.width,height:self.size.height))
        self.background.position = CGPoint(x:0,y:0)
        self.background.fillColor = .black
        self.background.alpha = 0.5
        self.addChild(self.background)
        
        self.label = SKLabelNode(text:"Tap to Start Game")
        self.label.fontSize = 75
        self.label.position = CGPoint(x:0,y:0)
        self.label.fontColor = .white
        self.addChild(self.label)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class EndNode:SKNode{
    var background:SKShapeNode!
    var label:SKLabelNode!
    var size:CGSize!
    init(withSize:CGSize){
        super.init()
        self.size = withSize
        createNode()
    }
    
    public func createNode(){
        self.background = SKShapeNode(rectOf:CGSize(width:self.size.width,height:self.size.height))
        self.background.position = CGPoint(x:0,y:0)
        self.background.fillColor = .black
        self.background.alpha = 0.5
        self.addChild(self.background)
        
        self.label = SKLabelNode(text:"Tap to Restart Game")
        self.label.fontSize = 75
        self.label.position = CGPoint(x:0,y:0)
        self.label.fontColor = .white
        self.addChild(self.label)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
