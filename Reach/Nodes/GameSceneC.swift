import Foundation
import SpriteKit
    
public class GameSceneC: GameScene{
    
    override public func RocketDidCollideWithStar(rocket: SKSpriteNode, star: SKSpriteNode) {

        if numberOfStars == 1 {
            //last star
            let explosionAction = SKAction.run(){
                let explosion = SKEmitterNode(fileNamed:"Particles/Confetti")!
                explosion.position = CGPoint(x: star.position.x, y: star.position.y)
                self.addChild(explosion)
                self.run(SKAction.playSoundFileNamed("Sounds/winSound.wav", waitForCompletion: false))
                
                rocket.removeFromParent()
                star.removeFromParent()
                //self.numberOfStars = self.numberOfStars - 1
                
                self.run(SKAction.wait(forDuration: 1.3)) {
                    explosion.removeFromParent()
                }
            }

            let resetScene = SKAction.run(){
                //Delay to let the explosion end
                inTransition = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    inTransition = false
                    let reveal = SKTransition.fade(withDuration: 1)
                    let gameSize = self.size
                    self.loadNextScene(size: gameSize)
                    self.youWonScene.scaleMode = SKSceneScaleMode.aspectFill
                    self.view?.presentScene(self.youWonScene, transition: reveal)
                })
            }
            self.run(SKAction.sequence([explosionAction, resetScene]))
        }
        // first stars
        else {
            
            let explosionAction = SKAction.run(){
                let explosion = SKEmitterNode(fileNamed:"Particles/MiniConfetti")!
                explosion.position = CGPoint(x: star.position.x, y: star.position.y)
                self.addChild(explosion)
                self.run(SKAction.playSoundFileNamed("Sounds/winSound.wav", waitForCompletion: false))
                
                //decrease numberOfStars if it wasn't removed
                if ((star.parent) != nil) {
                    numberOfStars = numberOfStars - 1
                }

                star.removeFromParent()
                //print (numberOfStars)
                self.run(SKAction.wait(forDuration: 1.3)) {
                    explosion.removeFromParent()
                }
            }

            self.run(SKAction.sequence([explosionAction]))

            
        }
        
        
        
    }
}
