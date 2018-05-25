import Foundation
import SpriteKit

public class Menu: SKScene, SKPhysicsContactDelegate {
    
    let starField = SKEmitterNode(fileNamed:"Particles/Stars")
    var gravityButton = GravityButton()
    var antigravityButton = AntigravityButton()
    var orbitButton = OrbitButton()
    var stardustButton = StardustButton()
    let antigravityBlock = SKSpriteNode(imageNamed: "fadedAntigravityRun")
    let orbitBlock = SKSpriteNode(imageNamed: "fadedOrbitRun")
    let stardustBlock = SKSpriteNode(imageNamed: "fadedStardustRun")
    

    
    override public func didMove(to view: SKView) {
        
        backgroundColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:1.0)
        starField!.position = CGPoint(x: 0, y: 0)
        starField!.advanceSimulationTime(15)
        addChild(starField!)
        
        let buttonTexture1: SKTexture = SKTexture(imageNamed:"gravityRun")
        let buttonTextureSelected1: SKTexture = SKTexture(imageNamed:"pressedGravityRun")
        gravityButton = GravityButton(normalTexture: buttonTexture1, selectedTexture: buttonTextureSelected1, disabledTexture: buttonTexture1)
        gravityButton.position = CGPoint(x: 0 ,y: 140  )
        gravityButton.zPosition = 1
        gravityButton.setScale(0.5)
        self.addChild(gravityButton)
        
        let buttonTexture2: SKTexture = SKTexture(imageNamed:"antigravityRun")
        let buttonTextureSelected2: SKTexture = SKTexture(imageNamed:"pressedAntigravityRun")
        antigravityButton = AntigravityButton(normalTexture: buttonTexture2, selectedTexture: buttonTextureSelected2, disabledTexture: buttonTexture2)
        antigravityButton.position = CGPoint(x: 0 ,y: 40  )
        antigravityButton.zPosition = 1
        antigravityButton.setScale(0.5)
        self.addChild(antigravityButton)
        
        let buttonTexture3: SKTexture = SKTexture(imageNamed:"orbitRun")
        let buttonTextureSelected3: SKTexture = SKTexture(imageNamed:"pressedOrbitRun")
        orbitButton = OrbitButton(normalTexture: buttonTexture3, selectedTexture: buttonTextureSelected3, disabledTexture: buttonTexture3)
        orbitButton.position = CGPoint(x: 0 ,y: -60  )
        orbitButton.zPosition = 1
        orbitButton.setScale(0.5)
        self.addChild(orbitButton)
        
        let buttonTexture4: SKTexture = SKTexture(imageNamed:"stardustRun")
        let buttonTextureSelected4: SKTexture = SKTexture(imageNamed:"pressedStardustRun")
        stardustButton = StardustButton(normalTexture: buttonTexture4, selectedTexture: buttonTextureSelected4, disabledTexture: buttonTexture4)
        stardustButton.position = CGPoint(x: 0 ,y: -160  )
        stardustButton.zPosition = 1
        stardustButton.setScale(0.5)
        self.addChild(stardustButton)

        
        let topLabel = SKLabelNode(fontNamed: "Futura-Medium")
        topLabel.text = "Choose a run to play"
        topLabel.fontSize = 90
        topLabel.fontColor = SKColor.white
        topLabel.position = CGPoint(x: 0, y: 220)
        topLabel.setScale(0.35)
        self.addChild(topLabel)
        
        let userDefault = UserDefaults.standard
        let value1 = userDefault.integer(forKey: "run1")
        let value2 = userDefault.integer(forKey: "run2")
        let value3 = userDefault.integer(forKey: "run3")
        let value4 = userDefault.integer(forKey: "run4")
        
        
        let info1 = SKLabelNode(fontNamed: "Futura-Medium")
        info1.fontSize = 60
        info1.fontColor = SKColor.white
        info1.position = CGPoint(x: 0, y: 100)
        info1.setScale(0.25)
        //0 means no record yet
        if value1 == 0{
            info1.text = "No best score yet :("
        }
            // -1 means zero deaths
        else if value1 == -1{
            info1.text = "Least deaths: 0"
        }
        else {
            info1.text = "Least deaths: \(value1)"
        }
        self.addChild(info1)
        
        let info2 = SKLabelNode(fontNamed: "Futura-Medium")
        info2.fontSize = 60
        info2.fontColor = SKColor.white
        info2.position = CGPoint(x: 0, y: 0)
        info2.setScale(0.25)
        //0 means no record yet
        if value2 == 0{
            if value1 >= 10 || value1 == 0{
                //lockar antigravity run
                antigravityButton.removeFromParent()
                antigravityBlock.position = antigravityButton.position
                antigravityBlock.setScale(0.5)
                antigravityBlock.zPosition = 2
                self.addChild(antigravityBlock)
                //
                info2.text = "Score less than 10 in Gravity Run"
            }
            else{
                info2.text = "No best score yet :("
            }
        }
            // -1 means zero deaths
        else if value2 == -1{
            info2.text = "Least deaths: 0"
        }
        else {
            info2.text = "Least deaths: \(value2)"
        }
        self.addChild(info2)
        
        let info3 = SKLabelNode(fontNamed: "Futura-Medium")
        info3.fontSize = 60
        info3.fontColor = SKColor.white
        info3.position = CGPoint(x: 0, y: -100)
        info3.setScale(0.25)
        //0 means no record yet
        if value3 == 0{
            if value2 >= 10 || value2 == 0{
                //lockar orbit run
                orbitButton.removeFromParent()
                orbitBlock.position = orbitButton.position
                orbitBlock.setScale(0.5)
                orbitBlock.zPosition = 2
                self.addChild(orbitBlock)
                //
                info3.text = "Score less than 10 in Antigravity Run"
                //            score less than 10 deaths in antigravity run
            }
            else{
                info3.text = "No best score yet :("
            }
        }
            // -1 means zero deaths
        else if value3 == -1{
            info3.text = "Least deaths: 0"
        }
        else {
            info3.text = "Least deaths: \(value3)"
        }
        self.addChild(info3)
        
        let info4 = SKLabelNode(fontNamed: "Futura-Medium")
        info4.fontSize = 60
        info4.fontColor = SKColor.white
        info4.position = CGPoint(x: 0, y: -200)
        info4.setScale(0.25)
        //0 means no record yet
        if value4 == 0{
            if value3 >= 10 || value3 == 0{
                //lockar stardust run
                stardustButton.removeFromParent()
                stardustBlock.position = stardustButton.position
                stardustBlock.setScale(0.5)
                stardustBlock.zPosition = 2
                self.addChild(stardustBlock)
                //
                info4.text = "Score less than 10 in Orbit Run"
                //            score less than 10 deaths in antigravity run
            }
            else{
                info4.text = "No best score yet :("
            }
        }
            // -1 means zero deaths
        else if value4 == -1{
            info4.text = "Least deaths: 0"
        }
        else {
            info4.text = "Least deaths: \(value4)"
        }
        self.addChild(info4)
        

    }
    
}












