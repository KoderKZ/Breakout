//#-hidden-code

import PlaygroundSupport
import SpriteKit

//#-end-hidden-code
//#-editable-code
/*:
 
 # Breakout
 ## Conclusion
 
 Let's recap on all of our results:
 
 ## Touch Move
 
 **Creative**:          2.5
 
 **Easy to use**:    8
 
 **Total**:                10.5
 
 
 ## Gyroscope
 
 **Creative**:          7.5
 
 **Easy to use**:    4.5
 
 **Total**:                12
 
 
 ## Controls
 
 **Creative**:          3
 
 **Easy to use**:    8
 
 **Total**:               11
 
 
 
 From these results, you can see that there are within a couple points of each other (from my rankings). This shows the hard decisions that developers make all the time. Although some might think that all that developers
 do is just code, there are actually lots of hard decisions behind all of it.
 
 Things like _design_ (just like our breakout game) can be seen from a user's eyes. There are many other desicions that
 aren't seen by users, such as code design, algorithms, and many other hard concepts that make the everyday apps you use today.
 You'll see some powerups that you can add to this game that I've included in the
 next page, which would go through the same process. The moving of the paddle is a metaphor for all of the design choices
 that developers make, whether it be visible or not.
 
 Go to the [next page](@next) to see the documentation for this app!
 */

//instantiate GameViewController
let gameVC = GameViewController()

//set live ViewController
PlaygroundPage.current.liveView = gameVC
let gameScene = gameVC.scene!

//set up the game area
gameScene.setUpGameArea()
let gameArea = gameScene.gameArea!

//#-end-editable-code
