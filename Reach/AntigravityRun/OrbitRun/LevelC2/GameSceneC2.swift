import SpriteKit

public class GameSceneC2: GameSceneC {
    
    let planet1 = SKSpriteNode(imageNamed: "globe5")
    let planet2 = SKSpriteNode(imageNamed: "globe2")
    
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity2")
    let visualGravity2 = SKEmitterNode (fileNamed:"Particles/VisualGravity2")
    
    override func resetScene () {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        if let gameScene = GameSceneC2(fileNamed: "GameScene"){
            gameScene.scaleMode = .aspectFill
            self.view?.presentScene(gameScene, transition: reveal)
        }
    }
    
    override public func loadNextScene(size: CGSize){
        youWonScene = YouWonSceneC2(size: size)
        youWonScene.starCount = SKSpriteNode(imageNamed: "2-6stars")
    }
    
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)
        numberOfStars = 2
        rocket.zRotation = -1.2
        
        planet1.setScale(0.35)
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
        
        rocket.position = CGPoint (x: -95, y: -247)
        addChild(rocket)
        planet1.position = CGPoint (x: -100, y: -90)
        addChild(planet1)
        planet2.position = CGPoint (x: 100, y: 80)
        addChild(planet2)
        star.position = CGPoint (x: 100, y: 200)
        addChild(star)
        star2.position = CGPoint (x: -100, y: 20)
        addChild(star2)
        
        visualGravity!.position = planet1.position
        addChild(visualGravity!)
        visualGravity2!.position = planet2.position
        visualGravity2?.setScale(1.1)
        addChild(visualGravity2!)
    }
    
    override public func setGravity(){
        gravity.strength = 5
        gravity2.strength = 5
    }
}










