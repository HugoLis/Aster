import Foundation
import SpriteKit

public class YouWonSceneB2: YouWonScene {
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        if let gameScene = GameSceneB3(fileNamed: "GameScene"){
            gameScene.scaleMode = .aspectFill
            self.view?.presentScene(gameScene, transition: reveal)
        }
    }
}
