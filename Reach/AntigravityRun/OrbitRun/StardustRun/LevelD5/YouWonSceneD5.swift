import Foundation
import SpriteKit

public class YouWonSceneD5: YouWonScene {
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        switch deviceType {
        case 1:
            if let gameScene = GameSceneD6(fileNamed: "GameScene"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        case 2:
            if let gameScene = GameSceneD6(fileNamed: "GameScene2"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        default: //case 3
            if let gameScene = GameSceneD6(fileNamed: "GameScene3"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }    }
}
