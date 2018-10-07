
import Foundation
import SpriteKit

public class StardustButton: RunButton {
    
    override public func startRun() {
        
        currentRun = 4
        
        numberOfDeaths = 0
        let parentNode = self.parent as! Menu
        let reveal = SKTransition.doorway(withDuration: 1)
        
        switch deviceType {
        case 1:
            if let gameScene = GameSceneD1(fileNamed: "GameScene"){//1
                gameScene.scaleMode = .aspectFill
                parentNode.self.view?.presentScene(gameScene, transition: reveal)
            }
        case 2:
            if let gameScene = GameSceneD1(fileNamed: "GameScene2"){//1
                gameScene.scaleMode = .aspectFill
                parentNode.self.view?.presentScene(gameScene, transition: reveal)
            }
        default: //case 3
            if let gameScene = GameSceneD1(fileNamed: "GameScene3"){//1
                gameScene.scaleMode = .aspectFill
                parentNode.self.view?.presentScene(gameScene, transition: reveal)
            }
        }
        
    }
    
}
