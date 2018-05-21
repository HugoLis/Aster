
import Foundation
import SpriteKit

public class OrbitButton: RunButton {
    
    override public func startRun() {
        
        currentRun = 3
        
        numberOfDeaths = 0
        let parentNode = self.parent as! Menu
        let reveal = SKTransition.doorway(withDuration: 1)
        if let gameScene = GameScene1(fileNamed: "GameScene"){
            gameScene.scaleMode = .aspectFill
            parentNode.self.view?.presentScene(gameScene, transition: reveal)
        }
    }
    
}
