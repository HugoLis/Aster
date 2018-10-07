import SpriteKit

public class GameSceneD6: GameSceneC {
    
    let planet1 = SKSpriteNode(imageNamed: "globe2")
    let planet2 = SKSpriteNode(imageNamed: "globe4")
    let planet3 = SKSpriteNode(imageNamed: "globe6")
    
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity5")
    let visualGravity2 = SKEmitterNode (fileNamed:"Particles/VisualGravity4")
    let visualGravity3 = SKEmitterNode (fileNamed:"Particles/VisualGravity5")
    
    override func resetScene () {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        if let gameScene = GameSceneD6(fileNamed: "GameScene"){
            gameScene.scaleMode = .aspectFill
            self.view?.presentScene(gameScene, transition: reveal)
        }
    }
    
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
                    let youWonScene = YouWonSceneD6(size:gameSize)
                    youWonScene.scaleMode = .aspectFill
                    self.view?.presentScene(youWonScene, transition: reveal)
                })
            }
            self.run(SKAction.sequence([explosionAction, resetScene]))
        }
            //first stars
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
    
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)
        numberOfStars = 3
        rocket.zRotation = 0.8
        
        planet1.setScale(0.3)
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: planet1.size.height/2)
        planet1 .physicsBody?.isDynamic = false
        planet1.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet1.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet1.physicsBody?.usesPreciseCollisionDetection = true
        planet1.addChild(gravity)
        
        planet2.setScale(0.3)
        planet2.physicsBody = SKPhysicsBody(circleOfRadius: planet2.size.height/2)
        planet2 .physicsBody?.isDynamic = false
        planet2.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet2.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet2.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet2.physicsBody?.usesPreciseCollisionDetection = true
        planet2.addChild(gravity2)
        
        planet3.setScale(0.3)
        planet3.physicsBody = SKPhysicsBody(circleOfRadius: planet2.size.height/2)
        planet3 .physicsBody?.isDynamic = false
        planet3.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet3.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet3.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet3.physicsBody?.usesPreciseCollisionDetection = true
        planet3.addChild(gravity3)
        
        rocket.position = CGPoint (x: -95, y: -247)
        addChild(rocket)
        planet1.position = CGPoint (x: -100, y: 160)
        addChild(planet1)
        planet2.position = CGPoint (x: 140, y: 210)
        addChild(planet2)
        planet3.position = CGPoint (x: 30, y: -100)
        addChild(planet3)
        
        star.position = CGPoint (x: 110, y: -100)
        star.setScale(0.2)
        addChild(star)
        star2.position = CGPoint (x: -100, y: 240)
        star2.setScale(0.2)
        addChild(star2)
        star3.position = CGPoint (x: 140, y: 130)
        star3.setScale(0.2)
        addChild(star3)
        
        visualGravity!.position = planet1.position
        addChild(visualGravity!)
        visualGravity2!.position = planet2.position
        addChild(visualGravity2!)
        visualGravity3!.position = planet3.position
        addChild(visualGravity3!)
        
    }
    
    override public func setGravity(){
        gravity.strength = 13
        gravity2.strength = -9
        gravity3.strength = 13
    }
}










