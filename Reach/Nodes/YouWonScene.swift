import SpriteKit

public class YouWonScene: SKScene {

    let star = SKSpriteNode(imageNamed: "star")
    let starField = SKEmitterNode(fileNamed:"Particles/Stars")
    let winParticle = SKEmitterNode(fileNamed:"Particles/WinParticle")
    var starCount =  SKSpriteNode(imageNamed: "1-6stars")
    
        
    override public func didMove(to view: SKView){
        
        backgroundColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:1.0)
        
        star.setScale(0.5)
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
        label1.text = "You did it!"
        label1.fontSize = 160
        label1.fontColor = SKColor.white
        label1.position = CGPoint(x: size.width/2, y: size.height/2 + 180)
        label1.setScale(0.25)
        addChild(label1)
        
        let label3 = SKLabelNode(fontNamed: "Futura-Medium")
        label3.text = "Tap to play the next level"
        label3.fontSize = 88
        label3.fontColor = SKColor.white
        label3.position = CGPoint(x: size.width/2, y: size.height/2 - 205)
        label3.setScale(0.25)
        addChild(label3)
        
    }
}

