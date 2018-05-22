import SpriteKit

public class GameSceneC1: GameSceneC {

    let planet1 = SKSpriteNode(imageNamed: "globe1")
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity")
    
    override func resetScene() {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        if let gameScene = GameSceneC1(fileNamed: "GameScene"){
            gameScene.scaleMode = .aspectFill
            self.view?.presentScene(gameScene, transition: reveal)
        }
    }
    
    override public func loadNextScene(size: CGSize){
        youWonScene = YouWonSceneC1(size: size)
        youWonScene.starCount = SKSpriteNode(imageNamed: "1-6stars")
    }
    
    override public func didMove(to view: SKView) {
        
        super.didMove(to: view)
        numberOfStars = 2
        rocket.zRotation = 0.9
        
        planet1.setScale(0.7)
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: planet1.size.height/2)
        planet1 .physicsBody?.isDynamic = false
        planet1.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        planet1.physicsBody?.collisionBitMask = PhysicsCategory.None
        planet1.physicsBody?.usesPreciseCollisionDetection = true
        planet1.addChild(gravity)
        
        rocket.position = CGPoint (x: -100, y: -255)
        addChild(rocket)
        planet1.position = CGPoint (x: 0, y: -10)
        addChild(planet1)
        star.position = CGPoint (x: 100, y: 240)
        addChild(star)
        star2.position = CGPoint (x: -150, y: 0)
        addChild(star2)
        
        visualGravity!.position = planet1.position
        visualGravity!.setScale(1)
        addChild(visualGravity!)
    }
    
    override public func setGravity(){
        gravity.strength = 1.5
    }
}










