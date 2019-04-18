import Foundation
import UIKit
import SpriteKit
public class TileNode:SKNode{
    var size:CGSize!
    var tileSize:CGFloat!
    let margin:CGFloat = 5
    let tileHeight:CGFloat = 75
    
    let physicsBodies = NSMutableArray()

    let tileDict = NSMutableDictionary()
    init(withSize:CGSize){
        super.init()
        
        self.size = withSize
        
        tileDict["red"] = NSMutableArray()
        tileDict["orange"] = NSMutableArray()
        tileDict["yellow"] = NSMutableArray()
        tileDict["green"] = NSMutableArray()
        tileDict["blue"] = NSMutableArray()
        for var i in 0..<5{
            for var j in 0..<7{
                createTile(x:CGFloat(j),y:CGFloat(i))
            }
        }
    }
    
    func createTile(x:CGFloat,y:CGFloat){

        let tile = SKSpriteNode(imageNamed:"tile\(Int(-y)+5).png")
        
        tile.name = "tile"
        
        let width = (self.size.width-(margin*8))/7
        tile.run(SKAction.resize(toWidth:width,height:tileHeight,duration:0))
        
        self.tileSize = width

        let xMargin = ((x+1.0)*margin)
        let xSizeMargin = ((x+0.5)*self.tileSize)
        tile.position.x = (xMargin+xSizeMargin)-self.size.width/2
        let yMargin = ((y+1.0)*margin)
        let ySizeMargin = ((y+1.5)*tileHeight)
        tile.position.y = -(yMargin+ySizeMargin)+self.size.height/2

        tile.physicsBody = SKPhysicsBody(rectangleOf:tile.frame.size)

        tile.physicsBody?.affectedByGravity = false
        tile.physicsBody?.isDynamic = false

        tile.physicsBody?.categoryBitMask = Bitmasks.tile.rawValue
        tile.physicsBody?.collisionBitMask = Bitmasks.ball.rawValue
        tile.physicsBody?.contactTestBitMask = Bitmasks.ball.rawValue
        
        switch y{
        case 4:
            (tileDict["red"] as! NSMutableArray).add(tile)
            break
        case 3:
            (tileDict["orange"] as! NSMutableArray).add(tile)
            break
        case 2:
            (tileDict["yellow"] as! NSMutableArray).add(tile)
            break
        case 1:
            (tileDict["green"] as! NSMutableArray).add(tile)
            break
        case 0:
            (tileDict["blue"] as! NSMutableArray).add(tile)
            break
        default:
            break
        }

        self.addChild(tile)

    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
