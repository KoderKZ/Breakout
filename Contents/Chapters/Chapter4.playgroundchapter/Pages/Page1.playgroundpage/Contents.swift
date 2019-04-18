//#-hidden-code

import PlaygroundSupport
import SpriteKit

//#-end-hidden-code
//#-editable-code
/*:
 
 # Breakout
 ## Controls
 
 This next mode to play is with the physical controls. This is used by tapping the left and right buttons to make the paddle move.
 
 Observe how easy it is to use, and think about how creative it is.
 */

//instantiate GameViewController
let gameVC = GameViewController()

//set live ViewController
PlaygroundPage.current.liveView = gameVC
let gameScene = gameVC.scene!

//set up the game area
gameScene.setUpGameArea()
let gameArea = gameScene.gameArea!

gameScene.controls = <#Bool#>

//#-end-editable-code

