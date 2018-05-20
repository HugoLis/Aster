
import Foundation
import SpriteKit

public class GravityButton: RunButton {
    
    override public func startRun() {
        
        let parentNode = self.parent as! Menu
        let reveal = SKTransition.doorway(withDuration: 1)
        if let gameScene = GameScene1(fileNamed: "GameScene"){
            gameScene.scaleMode = .aspectFill
            parentNode.self.view?.presentScene(gameScene, transition: reveal)
        }
    }

}
