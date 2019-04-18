//#-hidden-code

import PlaygroundSupport
import SpriteKit

//#-end-hidden-code
//#-editable-code
/*:
 
 # Breakout
 ## Controls
 
 Out of all of the other options, it is the easiest to use (for me, you might have a different opinion). However, this doesn't set it apart from the other modes. This is just a regular breakout game.
 
 I would rank the controls with:
 
 **Creative**:          3
 
 **Easy to use**:    8
 
 This way to play is the best way for the user to have the best user experience. However, it isn't very creative, and wouldn't be very successful as a product.
 Go to the [last chapter](@next) for the conclusion.
 */

//instantiate GameViewController
let gameVC = GameViewController()

//set live ViewController
PlaygroundPage.current.liveView = gameVC
let gameScene = gameVC.scene!

//set up the game area
gameScene.setUpGameArea()
let gameArea = gameScene.gameArea!

//set this to true!
gameScene.controls = true

//#-end-editable-code
