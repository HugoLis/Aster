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
    
    let arrow1 = SKSpriteNode(imageNamed:"arrow1")
    let arrow2 = SKSpriteNode(imageNamed:"arrow2")
    let arrow3 = SKSpriteNode(imageNamed:"arrow3")
    
    var tapCount = 0

    override public func didMove(to view: SKView) {
        
        backgroundColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:1.0)
        
        arrow1.position = CGPoint(x:-76, y:205)
        arrow1.setScale(0.75)
        arrow1.zPosition = -20
        self.addChild(arrow1)
        
        let text1 = SKLabelNode(fontNamed: "Futura-Medium")
        text1.text = "Capture the star"
        text1.fontSize = 80
        text1.fontColor = SKColor.white
        text1.position = CGPoint(x: 142, y: -30)
        text1.setScale(0.35)
        arrow1.addChild(text1)
        
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
        
        let introDefault = UserDefaults.standard
        introDefault.set(1, forKey: "introWasShown")
        
    }
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        if tapCount == 0 {
            arrow1.removeFromParent()
            star.removeFromParent()
            fadedPlanet1.removeFromParent()
            
            planet1.setScale(0.75)
            planet1.position = CGPoint (x: 50, y: 0)
            addChild(planet1)
            
            fadedStar.setScale(0.4)
            fadedStar.position = CGPoint (x: -100, y: 250)
            addChild(fadedStar)
            
            arrow2.position = CGPoint(x:-60, y:80)
            arrow2.setScale(0.75)
            self.addChild(arrow2)
            
            let text2 = SKLabelNode(fontNamed: "Futura-Medium")
            text2.text = "Use the gravity of planets"
            text2.fontSize = 80
            text2.fontColor = SKColor.white
            text2.position = CGPoint(x: -35, y: 75)
            text2.setScale(0.35)
            arrow2.addChild(text2)
            
            let text22 = SKLabelNode(fontNamed: "Futura-Medium")
            text22.text = "but don't hit them!"
            text22.fontSize = 80
            text22.fontColor = SKColor.white
            text22.position = CGPoint(x: -35, y: 40)
            text22.setScale(0.35)
            arrow2.addChild(text22)
    
            visualGravity?.position = planet1.position
            self.addChild(visualGravity!)

        }
        
        if tapCount == 1 {
            //info2.removeFromParent()
            arrow2.removeFromParent()
            planet1.removeFromParent()
            visualGravity?.removeFromParent()
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
            
            arrow3.position = CGPoint(x:90, y:-188)
            arrow3.setScale(0.75)
            self.addChild(arrow3)
            
            let text3 = SKLabelNode(fontNamed: "Futura-Medium")
            text3.text = "Press and hold then release"
            text3.fontSize = 80
            text3.fontColor = SKColor.white
            text3.position = CGPoint(x: -100, y: 60)
            text3.setScale(0.35)
            arrow3.addChild(text3)
            
            let text33 = SKLabelNode(fontNamed: "Futura-Medium")
            text33.text = "(as many times as you need)"
            text33.fontSize = 60
            text33.fontColor = SKColor.white
            text33.position = CGPoint(x: -100, y: 35)
            text33.setScale(0.35)
            arrow3.addChild(text33)

        }
        
        if tapCount == 2 {
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            
            switch deviceType {
            case 1:
                if let gameScene = GameScene1(fileNamed: "GameScene"){
                    gameScene.scaleMode = .aspectFill
                    self.view?.presentScene(gameScene, transition: reveal)
                }
            case 2:
                if let gameScene = GameScene1(fileNamed: "GameScene2"){
                    gameScene.scaleMode = .aspectFill
                    self.view?.presentScene(gameScene, transition: reveal)
                }
            default: //case 3
                if let gameScene = GameScene1(fileNamed: "GameScene3"){
                    gameScene.scaleMode = .aspectFill
                    self.view?.presentScene(gameScene, transition: reveal)
                }
            }
            
            
        }
        tapCount = tapCount + 1
    }
    
}












