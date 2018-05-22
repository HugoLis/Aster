import Foundation
import SpriteKit

public class YouWonScene6: SKScene {
    
    let star = SKSpriteNode(imageNamed: "star")
    let starField = SKEmitterNode(fileNamed:"Particles/Stars")
    let winParticle = SKEmitterNode(fileNamed:"Particles/FinalConfetti")
    let starCount = SKSpriteNode(imageNamed: "6-6stars")
    
    override public init(size: CGSize) {
        
        super.init(size: size)
        
        backgroundColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:1.0)
        
        star.setScale(0.75)
        star.position = CGPoint (x: size.width/2, y: size.height/2 + 50)
        addChild(star)
        
        starCount.setScale(0.4)
        starCount.zPosition = -200
        starCount.position = CGPoint(x: size.width/2, y: size.height/2-158)
        addChild(starCount)
        
        winParticle!.position = star.position
        winParticle!.advanceSimulationTime(3)
        addChild(winParticle!)
        
        starField!.position = CGPoint(x: size.width/2, y: size.height/2)
        starField!.advanceSimulationTime(5)
        addChild(starField!)
        
        let label1 = SKLabelNode(fontNamed: "Futura-Medium")
        label1.text = "You won Gravity Run!"
        label1.fontSize = 140
        label1.fontColor = SKColor.white
        label1.position = CGPoint(x: size.width/2, y: size.height/2 + 180)
        label1.setScale(0.25)
        addChild(label1)
        
        let label4 = SKLabelNode(fontNamed: "Futura-Medium")
        label4.text = "Tap to go back to the menu"
        label4.fontSize = 88
        label4.fontColor = SKColor.white
        label4.position = CGPoint(x: size.width/2, y: size.height/2 - 205)
        label4.setScale(0.25)
        addChild(label4)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        if let gameScene = Menu(fileNamed: "GameScene"){
            //save score

            //let userDefault = UserDefaults.standard
            //leastDeathsInRun1 = userDefault.integer(forKey: "run1")
            
            if numberOfDeaths != 0 && (numberOfDeaths < leastDeathsInRun1 || leastDeathsInRun1 == -2){
                leastDeathsInRun1 = numberOfDeaths
            }
            else if (numberOfDeaths == 0){
                leastDeathsInRun1 = -1
            }

            //reset death numbers
            numberOfDeaths = 0
            let userDefaults = UserDefaults.standard
            userDefaults.set(leastDeathsInRun1, forKey: "run1")
            
            gameScene.scaleMode = .aspectFill
            self.view?.presentScene(gameScene, transition: reveal)
        }
    }
}
