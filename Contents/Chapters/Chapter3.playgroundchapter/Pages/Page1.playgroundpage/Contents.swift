//#-hidden-code

import PlaygroundSupport
import SpriteKit

//#-end-hidden-code
//#-editable-code
/*:
 
 # Breakout
 ## Gyroscope
 
 This next mode to play is with the gyroscope within the iPad. This is used by tilting the iPad's sides *up* and *down* (along the **x-axis**).
 
 Observe how easy it is to use, and how much more fun it is to play with.
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
gameScene.gyroscope = <#Bool#>

//#-end-editable-code

