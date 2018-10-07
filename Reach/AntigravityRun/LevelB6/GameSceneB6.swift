import SpriteKit


public class GameSceneB6: GameScene {
    
    let planet1 = SKSpriteNode(imageNamed: "globe1")
    let planet2 = SKSpriteNode(imageNamed: "globe3")
    
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity5")
    let visualGravity2 = SKEmitterNode (fileNamed:"Particles/VisualGravity4")
    
    override func resetScene() {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        switch deviceType {
        case 1:
            if let gameScene = GameSceneB6(fileNamed: "GameScene"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        case 2:
            if let gameScene = GameSceneB6(fileNamed: "GameScene2"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        default: //case 3
            if let gameScene = GameSceneB6(fileNamed: "GameScene3"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }
    }
    
    override public func RocketDidCollideWithStar(rocket: SKSpriteNode, star: SKSpriteNode) {
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                let reveal = SKTransition.fade(withDuration: 1)
                let gameSize = self.size
                
                var youWonScene = YouWonSceneB6(size:gameSize)
                switch deviceType {
                case 1:
                    youWonScene = YouWonSceneB6(size: CGSize(width: 480, height: 640))
                case 2:
                    youWonScene = YouWonSceneB6(size: CGSize(width: 450, height: 800))
                default:
                    youWonScene = YouWonSceneB6(size: CGSize(width: 468.73, height: 1015))
                }
                
                youWonScene.scaleMode = .aspectFill
                self.view?.presentScene(youWonScene, transition: reveal)
            })
        }
        self.run(SKAction.sequence([explosionAction, resetScene]))
    }
    
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
        rocket.zRotation = 0.9
        
        planet1.setScale(0.5)
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: planet1.size.height/2)
        planet1 .physicsBody?.isDynamic = false
        planet1.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet1.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet1.physicsBody?.usesPreciseCollisionDetection = true
        planet1.addChild(gravity)
        
        
        planet2.setScale(0.4)
        planet2.physicsBody = SKPhysicsBody(circleOfRadius: planet2.size.height/2)
        planet2 .physicsBody?.isDynamic = false
        planet2.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet2.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet2.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet2.physicsBody?.usesPreciseCollisionDetection = true
        planet2.addChild(gravity2)
        
        rocket.position = CGPoint (x: -100, y: -255)
        addChild(rocket)
        planet1.position = CGPoint (x: 0, y: -50)
        addChild(planet1)
        planet2.position = CGPoint (x: -120, y: 100)
        addChild(planet2)
        star.position = CGPoint (x: 165, y: 235)
        addChild(star)
        
        visualGravity!.position = planet1.position
        addChild(visualGravity!)
        visualGravity2!.position = planet2.position
        addChild(visualGravity2!)
    }
    
    override public func setGravity(){
        gravity.strength = 4
        gravity2.strength = -1.6
    }
}










