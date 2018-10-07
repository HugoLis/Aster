import SpriteKit

public class GameSceneB2: GameScene {
    
    let planet1 = SKSpriteNode(imageNamed: "globe3")
    let planet2 = SKSpriteNode(imageNamed: "globe4")
    
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity6")
    let visualGravity2 = SKEmitterNode (fileNamed:"Particles/VisualGravity6")
    
    override func resetScene () {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        switch deviceType {
        case 1:
            if let gameScene = GameSceneB2(fileNamed: "GameScene"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        case 2:
            if let gameScene = GameSceneB2(fileNamed: "GameScene2"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        default: //case 3
            if let gameScene = GameSceneB2(fileNamed: "GameScene3"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }
    }
    
    override public func loadNextScene(size: CGSize){
        switch deviceType {
        case 1:
            youWonScene = YouWonSceneB2(size: CGSize(width: 480, height: 640))
        case 2:
            youWonScene = YouWonSceneB2(size: CGSize(width: 480, height: 640))
        default:
            youWonScene = YouWonSceneB2(size: CGSize(width: 450, height: 800))
        }
        youWonScene.starCount = SKSpriteNode(imageNamed: "2-6stars")
    }
    
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
        rocket.zRotation = -0.6
        
        planet1.setScale(0.55)
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: planet1.size.height/2)
        planet1 .physicsBody?.isDynamic = false
        planet1.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet1.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet1.physicsBody?.usesPreciseCollisionDetection = true
        planet1.addChild(gravity)
        
        planet2.setScale(0.55)
        planet2.physicsBody = SKPhysicsBody(circleOfRadius: planet2.size.height/2)
        planet2 .physicsBody?.isDynamic = false
        planet2.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet2.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet2.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet2.physicsBody?.usesPreciseCollisionDetection = true
        planet2.addChild(gravity2)
        
        rocket.position = CGPoint (x: -95, y: -247)
        addChild(rocket)
        planet1.position = CGPoint (x: 115, y: -100)
        addChild(planet1)
        planet2.position = CGPoint (x: -115, y: 87)
        addChild(planet2)
        star.position = CGPoint (x: 100, y: 240)
        addChild(star)
        
        visualGravity!.position = planet1.position
        visualGravity!.setScale(0.9)
        addChild(visualGravity!)
        visualGravity2!.position = planet2.position
        visualGravity2!.setScale(0.9)
        addChild(visualGravity2!)
    }
    
    override public func setGravity(){
        gravity.strength = -2.5
        gravity2.strength = -2.5
    }
}










