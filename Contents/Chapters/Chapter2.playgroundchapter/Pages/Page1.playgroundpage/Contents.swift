//#-hidden-code

import PlaygroundSupport
import SpriteKit

//#-end-hidden-code
//#-editable-code
/*:
 
 # Breakout
 ## Touch Move
 
 The first mode we are going to explore is by using touch detection to move. I've already built this in, so all you have to do is to make the touchMove variable true, and you will be able to move the paddle according to **touch**.
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
gameScene.touchMove = <#Bool#>

//#-end-editable-code

