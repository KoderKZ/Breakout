import Foundation
import UIKit
import SpriteKit

public class GameViewController:UIViewController{
    
    var skView:SKView?

    public var scene:GameScene?

    public init() {

        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad(){
        super.viewDidLoad()


        self.skView = SKView()
        
        self.skView?.center = self.view.center
        self.skView?.frame.size = CGSize(width:500,height:500)

        self.view.addSubview(self.skView!)

        presentGameScene()

    }

    override public func viewDidLayoutSubviews() {
        
        self.skView?.center = self.view.center
        self.skView?.frame.size = CGSize(width:500,height:500)
        
    }

    func presentGameScene(){
        if let skView = self.skView{
            scene = GameScene(size:CGSize(width:500,height:500))

            scene?.anchorPoint = CGPoint(x:0.5,y:0.5)
            scene?.scaleMode = .aspectFill

            skView.presentScene(scene)
        }
    }
    
    
    
}
