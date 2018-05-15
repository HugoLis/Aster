import SpriteKit

public class GameScene0: SKScene, SKPhysicsContactDelegate {
    
    let rocket = SKSpriteNode(imageNamed: "rocket")
    let fadedRocket = SKSpriteNode(imageNamed: "fadedRocket")
    let planet1 = SKSpriteNode(imageNamed: "globe1")
    let fadedPlanet1 = SKSpriteNode(imageNamed: "fadedGlobe1")
    let star = SKSpriteNode(imageNamed: "star")
    let fadedStar = SKSpriteNode(imageNamed: "fadedStar")
    let button = SKSpriteNode(imageNamed: "redButton")
    let fadedButton = SKSpriteNode(imageNamed: "fadedButton")
    let starField = SKEmitterNode(fileNamed:"Particles/Stars")
    let visualGravity = SKEmitterNode(fileNamed:"Particles/VisualGravity")
    
    let info1 = SKSpriteNode(imageNamed:"Intro/Intro1")
    let info2 = SKSpriteNode(imageNamed:"Intro/Intro2")
    let info3 = SKSpriteNode(imageNamed:"Intro/Intro3")
    
    var tapCount = 0

    override public func didMove(to view: SKView) {
        
        backgroundColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:1.0)
        
        info1.position = CGPoint(x:7, y:7)
        //info1.setScale(0.75)
        self.addChild(info1)
      info1.zPosition = -20
        
        fadedRocket.setScale(0.22)
        fadedRocket.zRotation = 0.52
        fadedRocket.position = CGPoint (x: -100, y: -245)
        addChild(fadedRocket)
        
        fadedPlanet1.setScale(0.75)
        fadedPlanet1.position = CGPoint (x: 50, y: 0)
        addChild(fadedPlanet1)
        
        star.setScale(0.4)
        star.position = CGPoint (x: -100, y: 250)
        addChild(star)
        
        starField!.position = CGPoint(x: 0, y: 0)
        starField!.advanceSimulationTime(15)
        addChild(starField!)
    
        fadedButton.setScale(0.55)
        fadedButton.position = CGPoint(x: 115 ,y: -235)
        addChild(fadedButton)
        
    }
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        if tapCount == 0 {
            info1.removeFromParent()
            star.removeFromParent()
            fadedPlanet1.removeFromParent()
            
            planet1.setScale(0.75)
            planet1.position = CGPoint (x: 50, y: 0)
            addChild(planet1)
            
            fadedStar.setScale(0.4)
            fadedStar.position = CGPoint (x: -100, y: 250)
            addChild(fadedStar)
            
            info2.position = CGPoint(x:10, y:10)
            self.addChild(info2)
        }
        
        if tapCount == 1 {
            info2.removeFromParent()
            planet1.removeFromParent()
            fadedButton.removeFromParent()
            fadedRocket.removeFromParent()
            
            fadedPlanet1.setScale(0.75)
            fadedPlanet1.position = CGPoint (x: 50, y: 0)
            addChild(fadedPlanet1)
            
            button.setScale(0.55)
            button.position = CGPoint(x: 115 ,y: -235)
            addChild(button)
            
            rocket.setScale(0.22)
            rocket.zRotation = 0.52
            rocket.position = CGPoint (x: -100, y: -245)
            addChild(rocket)
            
            info3.position = CGPoint(x:0, y:10)
            self.addChild(info3)
        }
        
        if tapCount == 2 {
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            if let gameScene = GameScene1(fileNamed: "GameScene"){
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }
        tapCount = tapCount + 1
    }
    
}












