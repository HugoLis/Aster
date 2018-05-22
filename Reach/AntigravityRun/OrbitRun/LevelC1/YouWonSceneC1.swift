import Foundation
import SpriteKit

public class YouWonSceneC1: YouWonScene {
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        //let gameScene = GameSceneC1(size: self.view!.frame.size)
        if let gameScene = GameSceneC2(fileNamed: "GameScene"){
            gameScene.scaleMode = .aspectFill
            self.view?.presentScene(gameScene, transition: reveal)
        }
    }
}
