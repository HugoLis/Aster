import SpriteKit


public class GameSceneB5: GameScene {
    
    let planet1 = SKSpriteNode(imageNamed: "globe2")
    let planet2 = SKSpriteNode(imageNamed: "globe4")
    let planet3 = SKSpriteNode(imageNamed: "globe6")
    
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity5")
    let visualGravity2 = SKEmitterNode (fileNamed:"Particles/VisualGravity4")
    let visualGravity3 = SKEmitterNode (fileNamed:"Particles/VisualGravity5")
    
    override func resetScene() {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        switch deviceType {
        case 1:
            if let gameScene = GameSceneB5(fileNamed: "GameScene"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        case 2:
            if let gameScene = GameSceneB5(fileNamed: "GameScene2"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        default: //case 3
            if let gameScene = GameSceneB5(fileNamed: "GameScene3"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }
    }
    
    override public func loadNextScene(size: CGSize){
        switch deviceType {
        case 1:
            youWonScene = YouWonSceneB5(size: CGSize(width: 480, height: 640))
        case 2:
            youWonScene = YouWonSceneB5(size: CGSize(width: 480, height: 640))
        default:
            youWonScene = YouWonSceneB5(size: CGSize(width: 450, height: 800))
        }
        youWonScene.starCount = SKSpriteNode(imageNamed: "5-6stars")
    }
    
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
        rocket.zRotation = -1
        
        planet1.setScale(0.4)
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: planet1.size.height/2)
        planet1 .physicsBody?.isDynamic = false
        planet1.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet1.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet1.physicsBody?.usesPreciseCollisionDetection = true
        planet1.addChild(gravity)
        
        planet3.setScale(0.4)
        planet3.physicsBody = SKPhysicsBody(circleOfRadius: planet3.size.height/2)
        planet3.physicsBody?.isDynamic = false
        planet3.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet3.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet3.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet3.physicsBody?.usesPreciseCollisionDetection = true
        planet3.addChild(gravity3)
        
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
        planet1.position = CGPoint (x: -80, y: -5)
        addChild(planet1)
        planet3.position = CGPoint (x: 110, y: 80)
        addChild(planet3)
        planet2.position = CGPoint (x: 80, y: -120)
        addChild(planet2)
        star.position = CGPoint (x: 0, y: 235)
        addChild(star)
        
        visualGravity!.position = planet1.position
        visualGravity!.setScale(0.8)
        addChild(visualGravity!)
        visualGravity2!.position = planet2.position
        visualGravity!.setScale(0.9)
        addChild(visualGravity2!)
        visualGravity3!.position = planet3.position
        visualGravity3!.setScale(0.8)
        addChild(visualGravity3!)

    }
    
    override public func setGravity(){
        gravity.strength = 5
        gravity3.strength = 5
        gravity2.strength = -2
    }
}










