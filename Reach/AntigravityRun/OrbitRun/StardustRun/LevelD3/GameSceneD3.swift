import SpriteKit

public class GameSceneD3: GameSceneC {
    
    let planet1 = SKSpriteNode(imageNamed: "globe3")
    let planet2 = SKSpriteNode(imageNamed: "globe4")
    let planet3 = SKSpriteNode(imageNamed: "globe1")
    
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity4")
    let visualGravity2 = SKEmitterNode (fileNamed:"Particles/VisualGravity4")
    let visualGravity3 = SKEmitterNode (fileNamed:"Particles/VisualGravity5")
    
    override func resetScene () {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        if let gameScene = GameSceneD3(fileNamed: "GameScene"){
            gameScene.scaleMode = .aspectFill
            self.view?.presentScene(gameScene, transition: reveal)
        }
    }
    
    override public func loadNextScene(size: CGSize){
        youWonScene = YouWonSceneD3(size: size)
        youWonScene.starCount = SKSpriteNode(imageNamed: "3-6stars")
    }
    
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)
        numberOfStars = 3
        rocket.zRotation = -0.6
        
        planet1.setScale(0.33)
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: planet1.size.height/2)
        planet1 .physicsBody?.isDynamic = false
        planet1.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet1.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet1.physicsBody?.usesPreciseCollisionDetection = true
        planet1.addChild(gravity)
        
        //de cima
        planet2.setScale(0.3)
        planet2.physicsBody = SKPhysicsBody(circleOfRadius: planet2.size.height/2)
        planet2 .physicsBody?.isDynamic = false
        planet2.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet2.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet2.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet2.physicsBody?.usesPreciseCollisionDetection = true
        planet2.addChild(gravity2)
        
        planet3.setScale(0.45)
        planet3.physicsBody = SKPhysicsBody(circleOfRadius: planet3.size.height/2)
        planet3 .physicsBody?.isDynamic = false
        planet3.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet3.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet3.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet3.physicsBody?.usesPreciseCollisionDetection = true
        planet3.addChild(gravity3)
        
        rocket.position = CGPoint (x: -110, y: -247)
        addChild(rocket)
        planet1.position = CGPoint (x: 0, y: -50)
        addChild(planet1)
        planet2.position = CGPoint (x: 0, y: -150)
        addChild(planet2)
        planet3.position = CGPoint (x: 0, y: 150)
        addChild(planet3)
        star.position = CGPoint (x: 100, y: -50)
        star.setScale(0.2)
        addChild(star)
        star2.position = CGPoint (x: 170, y: 150)
        star2.setScale(0.2)
        addChild(star2)
        star3.position = CGPoint (x: -110, y: 150)
        star3.setScale(0.2)
        addChild(star3)
        
        
        visualGravity!.position = planet1.position
        visualGravity!.setScale(0.8)
        addChild(visualGravity!)
        visualGravity2!.position = planet2.position
        visualGravity2!.setScale(0.8)
        addChild(visualGravity2!)
        visualGravity3!.position = planet3.position
        visualGravity3!.setScale(1.2)
        addChild(visualGravity3!)
    }
    
    override public func setGravity(){
        gravity.strength = -3.5
        gravity2.strength = -3.5
        gravity3.strength = 12
    }
}










