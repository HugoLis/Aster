import SpriteKit

public class GameScene4: GameScene {
    
    let planet1 = SKSpriteNode(imageNamed: "globe1")
    let planet2 = SKSpriteNode(imageNamed: "globe2")
   
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity2")
    let visualGravity2 = SKEmitterNode (fileNamed:"Particles/VisualGravity2")
    
    override func resetScene(){
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        switch deviceType {
        case 1:
            if let gameScene = GameScene4(fileNamed: "GameScene"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        case 2:
            if let gameScene = GameScene4(fileNamed: "GameScene2"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        default: //case 3
            if let gameScene = GameScene4(fileNamed: "GameScene3"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }
    }
    
    override public func loadNextScene(size: CGSize){
        
        switch deviceType {
        case 1:
            youWonScene = YouWonScene4(size: CGSize(width: 480, height: 640))
        case 2:
            youWonScene = YouWonScene4(size: CGSize(width: 480, height: 640))
        default:
            youWonScene = YouWonScene4(size: CGSize(width: 450, height: 800))
        }
        //youWonScene = YouWonScene4(size: size)
        youWonScene.starCount = SKSpriteNode(imageNamed: "4-6stars")
    }
    
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
        rocket.zRotation = -1.1
        
        planet1.setScale(0.6)
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: planet1.size.height/2)
        planet1 .physicsBody?.isDynamic = false
        planet1.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet1.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet1.physicsBody?.usesPreciseCollisionDetection = true
        planet1.addChild(gravity)
        
        planet2.setScale(0.6)
        planet2.physicsBody = SKPhysicsBody(circleOfRadius: planet2.size.height/2)
        planet2 .physicsBody?.isDynamic = false
        planet2.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet2.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet2.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet2.physicsBody?.usesPreciseCollisionDetection = true
        planet2.addChild(gravity2)
        
        rocket.position = CGPoint (x: -95, y: -247)
        addChild(rocket)
        planet1.position = CGPoint (x: -120, y: -93)
        addChild(planet1)
        planet2.position = CGPoint (x: 120, y: 77)
        addChild(planet2)
        star.position = CGPoint (x: 100, y: 240)
        addChild(star)
        
        visualGravity!.position = planet1.position
        addChild(visualGravity!)
        visualGravity2!.position = planet2.position
        addChild(visualGravity2!)
    }
    
    override public func setGravity(){
        gravity.strength = 0.8
        gravity2.strength = 1
    }
}










