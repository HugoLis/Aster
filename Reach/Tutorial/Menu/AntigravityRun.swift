
import Foundation
import SpriteKit

public class AntigravityButton: RunButton {
    
    override public func startRun() {
        
        currentRun = 2

        numberOfDeaths = 0
        let parentNode = self.parent as! Menu
        let reveal = SKTransition.doorway(withDuration: 1)
        if let gameScene = GameSceneB1(fileNamed: "GameScene"){//B1
            gameScene.scaleMode = .aspectFill
            parentNode.self.view?.presentScene(gameScene, transition: reveal)
        }
    }
    
}
