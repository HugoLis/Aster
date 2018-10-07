import SpriteKit

public class GameSceneC4: GameSceneC {
    
    let planet1 = SKSpriteNode(imageNamed: "globe8")
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity3")
    
    override func resetScene () {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        switch deviceType {
        case 1:
            if let gameScene = GameSceneC4(fileNamed: "GameScene"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        case 2:
            if let gameScene = GameSceneC4(fileNamed: "GameScene2"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        default: //case 3
            if let gameScene = GameSceneC4(fileNamed: "GameScene3"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }
    }
    
    override public func loadNextScene(size: CGSize){
        switch deviceType {
        case 1:
            youWonScene = YouWonSceneC4(size: CGSize(width: 480, height: 640))
        case 2:
            youWonScene = YouWonSceneC4(size: CGSize(width: 480, height: 640))
        default:
            youWonScene = YouWonSceneC4(size: CGSize(width: 450, height: 800))
        }
        youWonScene.starCount = SKSpriteNode(imageNamed: "4-6stars")
    }
    
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)
        numberOfStars = 3
        rocket.zRotation = 0.7
        
        planet1.setScale(0.3)
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: planet1.size.height/2)
        planet1 .physicsBody?.isDynamic = false
        planet1.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet1.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet1.physicsBody?.usesPreciseCollisionDetection = true
        planet1.addChild(gravity)
        
        rocket.position = CGPoint (x: -100, y: -249)
        addChild(rocket)
        planet1.position = CGPoint (x: 0, y: 20)
        addChild(planet1)
        star.position = CGPoint (x: -80, y: 20)
        addChild(star)
        star2.position = CGPoint (x: 0, y: -100)
        addChild(star2)
        star3.position = CGPoint (x: 0, y: 200)
        addChild(star3)

        
        visualGravity!.position = planet1.position
        visualGravity!.setScale(1)
        addChild(visualGravity!)
    }
    
    override public func setGravity(){
        gravity.strength = 20
    }
}










