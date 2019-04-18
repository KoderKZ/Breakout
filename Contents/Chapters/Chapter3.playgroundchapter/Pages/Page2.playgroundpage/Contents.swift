//#-hidden-code

import PlaygroundSupport
import SpriteKit

//#-end-hidden-code
//#-editable-code
/*:
 
 # Breakout
 ## Gyroscope
 
 From my perspective, I feel like using the gyroscope in this situation is not the best, but does work well. It is definitely more creative than using a touch based move.
 
 I would rank the gyroscope with:
 
 **Creative**:          7.5
 
 **Easy to use**:    4.5
 
 
 Most would agree that this way to play is the creative way to make this app unique. However, the controls are somewhat **hard** to use.
 Let's go to the [next chapter](@next) to see the next way to play: controls.
 */

//instantiate GameViewController
let gameVC = GameViewController()

//set live ViewController
PlaygroundPage.current.liveView = gameVC
let gameScene = gameVC.scene!

//set up the game area
gameScene.setUpGameArea()
let gameArea = gameScene.gameArea!

gameScene.gyroscope = true

//#-end-editable-code

