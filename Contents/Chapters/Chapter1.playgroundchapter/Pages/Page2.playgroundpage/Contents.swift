//#-hidden-code

import PlaygroundSupport
import SpriteKit

//#-end-hidden-code
//#-editable-code
/*:
 
 # Breakout
 ## Problem
 
 If you didn't notice from the last page, you can't make the paddle move by yourself. This is where most developers make their app or game unique.
 
 The code below only makes the objects, like the ball, the tiles, and the end game scenario. Even though there is only one thing to change (moving the paddle), one change or modification can make your idea unique.
 
 In the next three chapters, you will learn three different ways to interpret this classic Breakout game to make it potentially different from others.
 */

//instantiate GameViewController
let gameVC = GameViewController()

//set live ViewController
PlaygroundPage.current.liveView = gameVC
let gameScene = gameVC.scene!

//set up the game area
gameScene.setUpGameArea()
let gameArea = gameScene.gameArea!

//learn how to play using the autoMove functionality
gameScene.autoMove = true

//#-end-editable-code

