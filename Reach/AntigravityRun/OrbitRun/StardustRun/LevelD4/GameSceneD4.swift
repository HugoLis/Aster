import SpriteKit

public class GameSceneD4: GameSceneC {
    
    let planet1 = SKSpriteNode(imageNamed: "globe7")
    let planet2 = SKSpriteNode(imageNamed: "globe7")
    let planet3 = SKSpriteNode(imageNamed: "globe7")
    let planet4 = SKSpriteNode(imageNamed: "globe7")
    
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity6")
    let visualGravity2 = SKEmitterNode (fileNamed:"Particles/VisualGravity6")
    let visualGravity3 = SKEmitterNode (fileNamed:"Particles/VisualGravity6")
    let visualGravity4 = SKEmitterNode (fileNamed:"Particles/VisualGravity6")
    
    override func resetScene () {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        if let gameScene = GameSceneD4(fileNamed: "GameScene"){
            gameScene.scaleMode = .aspectFill
            self.view?.presentScene(gameScene, transition: reveal)
        }
    }
    
    override public func loadNextScene(size: CGSize){
        youWonScene = YouWonSceneD4(size: size)
        youWonScene.starCount = SKSpriteNode(imageNamed: "4-6stars")
    }
    
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)
        numberOfStars = 4
        rocket.zRotation = -0.45
        
        planet1.setScale(0.35)
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: planet1.size.height/2)
        planet1.physicsBody?.isDynamic = false
        planet1.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet1.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet1.physicsBody?.usesPreciseCollisionDetection = true
        planet1.addChild(gravity)
        
        planet2.setScale(0.35)
        planet2.physicsBody = SKPhysicsBody(circleOfRadius: planet2.size.height/2)
        planet2.physicsBody?.isDynamic = false
        planet2.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet2.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet2.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet2.physicsBody?.usesPreciseCollisionDetection = true
        planet2.addChild(gravity2)
        
        planet3.setScale(0.35)
        planet3.physicsBody = SKPhysicsBody(circleOfRadius: planet3.size.height/2)
        planet3.physicsBody?.isDynamic = false
        planet3.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet3.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet3.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet3.physicsBody?.usesPreciseCollisionDetection = true
        planet3.addChild(gravity3)
        
        planet4.setScale(0.35)
        planet4.physicsBody = SKPhysicsBody(circleOfRadius: planet4.size.height/2)
        planet4.physicsBody?.isDynamic = false
        planet4.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet4.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet4.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet4.physicsBody?.usesPreciseCollisionDetection = true
        planet4.addChild(gravity4)
        
        rocket.position = CGPoint (x: -115, y: -247)
        addChild(rocket)
        planet1.position = CGPoint (x: 120, y: 100)
        addChild(planet1)
        planet2.position = CGPoint (x: -160, y: 30)
        addChild(planet2)
        planet3.position = CGPoint (x: 0, y: 190)
        addChild(planet3)
        planet4.position = CGPoint (x: 80, y: -130)
        addChild(planet4)
        
        star.position = CGPoint (x: 50, y: 50)
        star.setScale(0.2)
        addChild(star)
        star2.position = CGPoint (x: -80, y: 30)
        star2.setScale(0.2)
        addChild(star2)
        star3.position = CGPoint (x: 0, y: 110)
        star3.setScale(0.2)
        addChild(star3)
        star4.position = CGPoint (x: -20, y: -140)
        star4.setScale(0.2)
        addChild(star4)

        
        visualGravity!.position = planet1.position
        visualGravity!.setScale(0.7)
        addChild(visualGravity!)
        visualGravity2!.position = planet2.position
        visualGravity2!.setScale(0.7)
        addChild(visualGravity2!)
        visualGravity3!.position = planet3.position
        visualGravity3!.setScale(0.7)
        addChild(visualGravity3!)
        visualGravity4!.position = planet4.position
        visualGravity4!.setScale(0.5)
        addChild(visualGravity4!)
    }
    
    override public func setGravity(){
        gravity.strength = -6
        gravity2.strength = -6
        gravity3.strength = -6
        gravity4.strength = -6
    }
}










