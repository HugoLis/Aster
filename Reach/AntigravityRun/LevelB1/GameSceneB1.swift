import SpriteKit

public class GameSceneB1: GameScene {
    
    let planet1 = SKSpriteNode(imageNamed: "globe3")
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity6")
    
    override func resetScene() {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        switch deviceType {
        case 1:
            if let gameScene = GameSceneB1(fileNamed: "GameScene"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        case 2:
            if let gameScene = GameSceneB1(fileNamed: "GameScene2"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        default: //case 3
            if let gameScene = GameSceneB1(fileNamed: "GameScene3"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }
    }
    
    override public func loadNextScene(size: CGSize){
        //youWonScene = YouWonScene1(size: size)
        switch deviceType {
        case 1:
            youWonScene = YouWonSceneB1(size: CGSize(width: 480, height: 640))
        case 2:
            youWonScene = YouWonSceneB1(size: CGSize(width: 480, height: 640))
        default:
            youWonScene = YouWonSceneB1(size: CGSize(width: 450, height: 800))
        }
        
        youWonScene.starCount = SKSpriteNode(imageNamed: "1-6stars")
    }
        
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)

        rocket.zRotation = -0.5

        planet1.setScale(0.6)
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: planet1.size.height/2)
        planet1 .physicsBody?.isDynamic = false
        planet1.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet1.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet1.physicsBody?.usesPreciseCollisionDetection = true
        planet1.addChild(gravity)
        
        rocket.position = CGPoint (x: -100, y: -250)
        addChild(rocket)
        planet1.position = CGPoint (x: 120, y: -10)
        addChild(planet1)
        star.position = CGPoint (x: -50, y: 240)
        addChild(star)
        
        visualGravity!.position = planet1.position
        addChild(visualGravity!)
    }

    override public func setGravity(){
        gravity.strength = -1.5
    }
}










