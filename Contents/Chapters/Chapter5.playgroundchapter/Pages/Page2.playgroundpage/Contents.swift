//#-hidden-code

import PlaygroundSupport
import SpriteKit

//#-end-hidden-code
//#-editable-code
/*:
 
 # Breakout
 ## Documentation
 
 Here is a free page for you to play the gamemodes freely!
 */

//instantiate GameViewController
let gameVC = GameViewController()

//set live ViewController
PlaygroundPage.current.liveView = gameVC
let gameScene = gameVC.scene!

//set up the game area
gameScene.setUpGameArea()
let gameArea = gameScene.gameArea!

//do whatever you want here! (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧  ~~~

//gameScene.touchMove = <#Bool#>
//gameScene.gyroscope = <#Bool#>
//gameScene.controls = <#Bool#>

//gameScene.autoMove = <#Bool#>

//gameScene.powerups = <#Bool#>

/*:
 
 **gameScene.gyroscope**:
 
 (Boolean) Control by gyroscope
 
 
 
 **gameScene.autoMove**:
 
 (Boolean) Do not need to control, will move by itself
 
 
 
 **gameScene.touchMove**:
 
 (Boolean) Control by touch
 
 
 
 **gameScene.controls**:
 
 (Boolean) Control with physical controls
 
 
 **gameScene.powerups**:
 
 (Boolean) Special powerups to enhance the game!
 
 ![expand](expand.png) : Will expand the ball for 5 seconds
 
 ![slow](slow.png)   : Will slow the ball for 5 seconds
 
 ![clear](clear.png) : Will clear all tiles of one color
 
 */

//#-end-editable-code


