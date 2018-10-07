import SpriteKit

public class GameSceneD1: GameSceneC {
    
    let planet1 = SKSpriteNode(imageNamed: "globe6")
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity")
    
    override func resetScene() {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        switch deviceType {
        case 1:
            if let gameScene = GameSceneD1(fileNamed: "GameScene"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        case 2:
            if let gameScene = GameSceneD1(fileNamed: "GameScene2"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        default: //case 3
            if let gameScene = GameSceneD1(fileNamed: "GameScene3"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }
    }
    
    override public func loadNextScene(size: CGSize){
        switch deviceType {
        case 1:
            youWonScene = YouWonSceneD1(size: CGSize(width: 480, height: 640))
        case 2:
            youWonScene = YouWonSceneD1(size: CGSize(width: 480, height: 640))
        default:
            youWonScene = YouWonSceneD1(size: CGSize(width: 450, height: 800))
        }
        youWonScene.starCount = SKSpriteNode(imageNamed: "1-6stars")
    }
    
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)
        numberOfStars = 2
        rocket.zRotation = -1.25
        
        planet1.setScale(0.6)
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: planet1.size.height/2)
        planet1 .physicsBody?.isDynamic = false
        planet1.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet1.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet1.physicsBody?.usesPreciseCollisionDetection = true
        planet1.addChild(gravity)
        
        rocket.position = CGPoint (x: -100, y: -255)
        addChild(rocket)
        planet1.position = CGPoint (x: -30, y: 20)
        addChild(planet1)
        star.position = CGPoint (x: -100, y: 240)
        star.setScale(0.2)
        addChild(star)
        star2.position = CGPoint (x: 65, y: -75)
        star2.setScale(0.2)
        addChild(star2)
        
        visualGravity!.position = planet1.position
        visualGravity!.setScale(1)
        addChild(visualGravity!)
    }
    
    override public func setGravity(){
        gravity.strength = 2.5
    }
}










