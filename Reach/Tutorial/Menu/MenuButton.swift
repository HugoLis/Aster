
import Foundation
import SpriteKit

public class MenuButton: RunButton {
    
    override public func startRun() {
        if inTransition == false{
            numberOfDeaths = 0
            let parentNode = self.parent as! GameScene
            let reveal = SKTransition.doorsCloseHorizontal(withDuration: 0.75)
            
        switch deviceType {
            case 1:
                if let gameScene = Menu(fileNamed: "GameScene"){
                    gameScene.scaleMode = .aspectFill
                    parentNode.self.view?.presentScene(gameScene, transition: reveal)
                }
            case 2:
                if let gameScene = Menu(fileNamed: "GameScene"){
                    gameScene.scaleMode = .aspectFill
                    parentNode.self.view?.presentScene(gameScene, transition: reveal)
                }
            default: //case 3
                if let gameScene = Menu(fileNamed: "GameScene2"){
                    gameScene.scaleMode = .aspectFill
                    parentNode.self.view?.presentScene(gameScene, transition: reveal)
                }
        }
            
            
            

            
            
        }
    }
    
}
