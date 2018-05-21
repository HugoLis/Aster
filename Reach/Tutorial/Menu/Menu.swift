import Foundation
import SpriteKit

public class Menu: SKScene, SKPhysicsContactDelegate {
    
    let starField = SKEmitterNode(fileNamed:"Particles/Stars")
    var gravityButton = GravityButton()
    var antigravityButton = AntigravityButton()
    var orbitButton = OrbitButton()

    
    override public func didMove(to view: SKView) {
        
        backgroundColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:1.0)
        starField!.position = CGPoint(x: 0, y: 0)
        starField!.advanceSimulationTime(15)
        addChild(starField!)
        
        let buttonTexture1: SKTexture = SKTexture(imageNamed:"gravityRun")
        let buttonTextureSelected1: SKTexture = SKTexture(imageNamed:"pressedGravityRun")
        gravityButton = GravityButton(normalTexture: buttonTexture1, selectedTexture: buttonTextureSelected1, disabledTexture: buttonTexture1)
        gravityButton.position = CGPoint(x: 0 ,y: 100  )
        gravityButton.zPosition = 1
        gravityButton.setScale(0.5)
        self.addChild(gravityButton)
        
        let buttonTexture2: SKTexture = SKTexture(imageNamed:"antigravityRun")
        let buttonTextureSelected2: SKTexture = SKTexture(imageNamed:"pressedAntigravityRun")
        antigravityButton = AntigravityButton(normalTexture: buttonTexture2, selectedTexture: buttonTextureSelected2, disabledTexture: buttonTexture2)
        antigravityButton.position = CGPoint(x: 0 ,y: 0  )
        antigravityButton.zPosition = 1
        antigravityButton.setScale(0.5)
        self.addChild(antigravityButton)
        
        let buttonTexture3: SKTexture = SKTexture(imageNamed:"orbitRun")
        let buttonTextureSelected3: SKTexture = SKTexture(imageNamed:"pressedOrbitRun")
        orbitButton = OrbitButton(normalTexture: buttonTexture3, selectedTexture: buttonTextureSelected3, disabledTexture: buttonTexture3)
        orbitButton.position = CGPoint(x: 0 ,y: -100  )
        orbitButton.zPosition = 1
        orbitButton.setScale(0.5)
        self.addChild(orbitButton)

        
        let topLabel = SKLabelNode(fontNamed: "Futura-Medium")
        topLabel.text = "Choose a run to play"
        topLabel.fontSize = 90
        topLabel.fontColor = SKColor.white
        topLabel.position = CGPoint(x: 0, y: 200)
        topLabel.setScale(0.35)
        self.addChild(topLabel)
        
        let userDefault = UserDefaults.standard
        let value1 = userDefault.integer(forKey: "run1")
        let value2 = userDefault.integer(forKey: "run2")
        
        
        let info1 = SKLabelNode(fontNamed: "Futura-Medium")
        info1.fontSize = 60
        info1.fontColor = SKColor.white
        info1.position = CGPoint(x: 0, y: -80)
        info1.setScale(0.5)
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
        gravityButton.addChild(info1)
        
        let info2 = SKLabelNode(fontNamed: "Futura-Medium")
        info2.fontSize = 60
        info2.fontColor = SKColor.white
        info2.position = CGPoint(x: 0, y: -80)
        info2.setScale(0.5)
        //0 means no record yet
        if value2 == 0{
            info2.text = "No best score yet :("
        }
            // -1 means zero deaths
        else if value2 == -1{
            info2.text = "Least deaths: 0"
        }
        else {
            info2.text = "Least deaths: \(value2)"
        }
        antigravityButton.addChild(info2)


        
        
//        fadedRocket.setScale(0.22)
//        fadedRocket.zRotation = 0.52
//        fadedRocket.position = CGPoint (x: -100, y: -245)
//        addChild(fadedRocket)
        

    }
    
}












