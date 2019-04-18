//#-hidden-code

import PlaygroundSupport
import SpriteKit

//#-end-hidden-code
//#-editable-code
/*:
 
 # Breakout
 ## Touch Move
 
 From experiencing touch move, you can see that it is fairly easy to use.
 
 We can start to rank the different modes by 2 categories:
 
 **Creative**:          2.5
 
 **Easy to use**:    8
 
 Most would agree that this way to play is easy to use. However, by using your hand to touch the move, it might block the paddle. In addition, this way is not very creative.
 Let's go to the [next chapter](@next) to see the next way to play: the gyroscope.
 */

//instantiate GameViewController
let gameVC = GameViewController()

//set live ViewController
PlaygroundPage.current.liveView = gameVC
let gameScene = gameVC.scene!

//set up the game area
gameScene.setUpGameArea()
let gameArea = gameScene.gameArea!

gameScene.touchMove = true

//#-end-editable-code

