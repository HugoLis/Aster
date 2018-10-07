import SpriteKit

public class GameSceneD5: GameSceneC {
    
    let planet1 = SKSpriteNode(imageNamed: "globe2")
    let planet2 = SKSpriteNode(imageNamed: "globe3")
    
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity5")
    let visualGravity2 = SKEmitterNode (fileNamed:"Particles/VisualGravity4")
    
    override func resetScene () {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        switch deviceType {
        case 1:
            if let gameScene = GameSceneD5(fileNamed: "GameScene"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        case 2:
            if let gameScene = GameSceneD5(fileNamed: "GameScene2"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        default: //case 3
            if let gameScene = GameSceneD5(fileNamed: "GameScene3"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }
    }
    
    override public func loadNextScene(size: CGSize){
        youWonScene = YouWonSceneD5(size: size)
        youWonScene.starCount = SKSpriteNode(imageNamed: "5-6stars")
    }
    
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)
        numberOfStars = 3
        rocket.zRotation = -1.4
        
        planet1.setScale(0.3)
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: planet1.size.height/2)
        planet1 .physicsBody?.isDynamic = false
        planet1.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet1.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet1.physicsBody?.usesPreciseCollisionDetection = true
        planet1.addChild(gravity)
        
        planet2.setScale(0.2)
        planet2.physicsBody = SKPhysicsBody(circleOfRadius: planet2.size.height/2)
        planet2 .physicsBody?.isDynamic = false
        planet2.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet2.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet2.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet2.physicsBody?.usesPreciseCollisionDetection = true
        planet2.addChild(gravity2)
        
        rocket.position = CGPoint (x: -95, y: -247)
        addChild(rocket)
        planet1.position = CGPoint (x: 0, y: 0)
        addChild(planet1)
        planet2.position = CGPoint (x: -160, y: 185)
        addChild(planet2)
        
        star.position = CGPoint (x: 80, y: 0)
        star.setScale(0.2)
        addChild(star)
        star2.position = CGPoint (x: 170, y: 0)
        star2.setScale(0.2)
        addChild(star2)
        star3.position = CGPoint (x: -160, y: 240)
        star3.setScale(0.2)
        addChild(star3)
        
        visualGravity!.position = planet1.position
        visualGravity!.setScale(1)
        addChild(visualGravity!)
        visualGravity2!.position = planet2.position
        visualGravity2?.setScale(0.7)
        addChild(visualGravity2!)
    }
    
    override public func setGravity(){
        gravity.strength = 25
        gravity2.strength = -15
    }
}










