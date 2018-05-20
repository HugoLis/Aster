import SpriteKit

public class RunButton: SKSpriteNode {
    
    enum FTButtonActionType: Int {
        case TouchUpInside = 1,
        TouchDown, TouchUp
    }
    
    var isEnabled: Bool = true {
        didSet {
            if (disabledTexture != nil) {
                texture = isEnabled ? defaultTexture : disabledTexture
            }
        }
    }
    
    public var isSelected: Bool = false {
        didSet {
            texture = isSelected ? selectedTexture : defaultTexture
        }
    }
    
    var defaultTexture: SKTexture
    var selectedTexture: SKTexture
    var label: SKLabelNode
    
    required public init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    public init(normalTexture defaultTexture: SKTexture!, selectedTexture:SKTexture!, disabledTexture: SKTexture?) {
        
        self.defaultTexture = defaultTexture
        self.selectedTexture = selectedTexture
        self.disabledTexture = disabledTexture
        self.label = SKLabelNode(fontNamed: "Helvetica");
        
        super.init(texture: defaultTexture, color: UIColor.white, size: defaultTexture.size())
        isUserInteractionEnabled = true
    }
    
    public init() {
        
        self.defaultTexture = SKTexture()
        self.selectedTexture = SKTexture()
        self.disabledTexture = SKTexture()
        self.label = SKLabelNode(fontNamed: "Helvetica");
        
        super.init(texture: defaultTexture, color: UIColor.white, size: defaultTexture.size())
        isUserInteractionEnabled = true
        
        self.label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center;
        self.label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center;
        addChild(self.label)
        
        let bugFixLayerNode = SKSpriteNode(texture: nil, color: UIColor.clear, size: defaultTexture.size())
        bugFixLayerNode.position = self.position
        addChild(bugFixLayerNode)
    }
    
    var disabledTexture: SKTexture?
    var actionTouchUpInside: Selector?
    var actionTouchUp: Selector?
    var actionTouchDown: Selector?
    weak var targetTouchUpInside: AnyObject?
    weak var targetTouchUp: AnyObject?
    weak var targetTouchDown: AnyObject?
    
    
    public func startRun() {
        
        let parentNode = self.parent as! Menu
        let reveal = SKTransition.doorway(withDuration: 1)
        if let gameScene = GameScene1(fileNamed: "GameScene"){
            gameScene.scaleMode = .aspectFill
            parentNode.self.view?.presentScene(gameScene, transition: reveal)
        }
    }
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (!isEnabled) {
            return
        }
        isSelected = true
        //action here:
        self.startRun()
        //DispatchQueue.main.asyncAfter(deadline: .now() + 0.02, execute: {
        //
        //})
        
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (!isEnabled) {
            return
        }
        isSelected = false
        
    }
    
}
