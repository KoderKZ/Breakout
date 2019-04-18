
import SpriteKit
import Foundation

class ControlsNode:SKNode{
    var size:CGSize!
    var right:SKSpriteNode!
    var left:SKSpriteNode!
    var controlSize:CGFloat = 200
    init(withSize:CGSize){
    super.init()

        self.size = withSize

        createControls()
    }

    func createControls(){

        self.left = SKSpriteNode(imageNamed:"left.png")
        
        self.left.position = CGPoint(x:-self.size.width/2+controlSize/2,y:-self.size.height/2+controlSize/2)
        self.left.size = CGSize(width:controlSize, height:controlSize)
        self.left.alpha = 0.5
        
        self.addChild(self.left)
        

        self.right = SKSpriteNode(imageNamed:"right.png")
        
        self.right.position = CGPoint(x:self.size.width/2-controlSize/2,y:-self.size.height/2+controlSize/2)
        self.right.size = CGSize(width:controlSize, height:controlSize)
        self.right.alpha = 0.5
        
        self.addChild(self.right)

    }


    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
