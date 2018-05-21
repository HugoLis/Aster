
import Foundation
import SpriteKit

public class MenuButton: RunButton {
    
    override public func startRun() {
        numberOfDeaths = 0
        let parentNode = self.parent as! GameScene
        let reveal = SKTransition.doorsCloseHorizontal(withDuration: 0.75)
        if let gameScene = Menu(fileNamed: "GameScene"){
            gameScene.scaleMode = .aspectFill
            parentNode.self.view?.presentScene(gameScene, transition: reveal)
        }
    }
    
}
