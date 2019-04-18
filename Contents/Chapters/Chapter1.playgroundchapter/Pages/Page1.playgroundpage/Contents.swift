//#-hidden-code

import PlaygroundSupport
import SpriteKit

//#-end-hidden-code
//#-editable-code
/*:
  
 # Breakout
 ## Introduction
 
 From the classic Atari Breakout, this game has been played in many different ways, mediums, and places.
 Through this game, you can learn how a single concept can be reimagined in many different ways, and see how developers make choices for the best user experience.
 That means for **YOU**!
 
 First, to start the game, we need to create the game area!
 
 If you haven't played before, learn how to play through the autoMove gamemode!
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
