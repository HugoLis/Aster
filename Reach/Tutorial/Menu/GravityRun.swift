
import Foundation
import SpriteKit

public class GravityButton: RunButton {
    
    override public func startRun() {
        
        currentRun = 1
        
        let introDefault = UserDefaults.standard
        let wasShown = introDefault.integer(forKey: "introWasShown")
        
        numberOfDeaths = 0
        let parentNode = self.parent as! Menu
        let reveal = SKTransition.doorway(withDuration: 1)
        if wasShown==1 {
            //
        switch deviceType {
            case 0:
                if let gameScene = GameScene1(fileNamed: "GameScene0"){
                    gameScene.scaleMode = .aspectFill
                    parentNode.self.view?.presentScene(gameScene, transition: reveal)
                }
            case 1:
                if let gameScene = GameScene1(fileNamed: "GameScene"){
                    gameScene.scaleMode = .aspectFill
                    parentNode.self.view?.presentScene(gameScene, transition: reveal)
                }
            case 2:
                if let gameScene = GameScene1(fileNamed: "GameScene2"){
                    gameScene.scaleMode = .aspectFill
                    parentNode.self.view?.presentScene(gameScene, transition: reveal)
                }
            default: //case 3
                if let gameScene = GameScene1(fileNamed: "GameScene3"){
                    gameScene.scaleMode = .aspectFill
                    parentNode.self.view?.presentScene(gameScene, transition: reveal)
                }
        }
            
            
            //
            
        }
        else{
            
            switch deviceType {
            case 0:
                if let gameScene = GameScene0(fileNamed: "GameScene0"){//0
                    gameScene.scaleMode = .aspectFill
                    parentNode.self.view?.presentScene(gameScene, transition: reveal)
                }
            case 1:
                if let gameScene = GameScene0(fileNamed: "GameScene"){//0
                    gameScene.scaleMode = .aspectFill
                    parentNode.self.view?.presentScene(gameScene, transition: reveal)
                }
            case 2:
                if let gameScene = GameScene0(fileNamed: "GameScene2"){
                    gameScene.scaleMode = .aspectFill
                    parentNode.self.view?.presentScene(gameScene, transition: reveal)
                }
            default: //case 3
                if let gameScene = GameScene0(fileNamed: "GameScene3"){
                    gameScene.scaleMode = .aspectFill
                    parentNode.self.view?.presentScene(gameScene, transition: reveal)
                }
            }
            
            
            
        }
        
    }

}
