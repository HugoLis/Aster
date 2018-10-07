
import UIKit
import Foundation

public var currentRun = 0
public var numberOfDeaths = 0
public var leastDeathsInRun1 = 0
public var leastDeathsInRun2 = 0
public var leastDeathsInRun3 = 0
public var leastDeathsInRun4 = 0
public var numberOfStars = 10
public var inTransition = false
public var isColliding = false
// shortSide/longSide 0.75 iPad, 0.5622 iPhone 16:9, 0.4618 iPhone X(s)
public var deviceType = 0 // 1 = iPad, 2 = iPhone 16/9, 3 = iPhone X

class ViewController: UIViewController {

  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let width = UIScreen.main.bounds.maxX
    let height = UIScreen.main.bounds.maxY
    deviceType = defineDevice(width: width, height: height)
    print (deviceType)
    
    
    //self.view.addSubview(UIView())
    
    let sceneView = self.view as! SpaceView
    
    sceneView.PlayBackgroundMusic()
    
    switch deviceType {
    case 1: //iPad
        if let scene = Menu(fileNamed: "GameScene") {
            scene.scaleMode = .aspectFill
            sceneView.presentScene(scene)
        }
    case 2: //iPhone 16:9
        if let scene = Menu(fileNamed: "GameScene") { //on purposeproposital GameScene1
            scene.scaleMode = .aspectFill
            sceneView.presentScene(scene)
        }
    default: //case 3 iPhone X family
        if let scene = Menu(fileNamed: "GameScene2") {//on purpose gameScene2
            scene.scaleMode = .aspectFill
            sceneView.presentScene(scene)
        }
    }
    

    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

func defineDevice(width: CGFloat, height: CGFloat) -> Int {
    var screenRatio:CGFloat = 0.0 // short/long
    var deviceCode = 0
    if width < height {
        screenRatio = width/height
    }
    else {
        screenRatio = height/width
    }
    //iPad case -- 0.75
    if screenRatio >= 0.6 && screenRatio < 0.8 {
        deviceCode = 1
    }
        //iPhone 16:9 case -- 0.5622
    else if screenRatio >= 0.5 && screenRatio < 0.6 {
        deviceCode = 2
    }
        //iPhone X family case -- 0.04618
    else if screenRatio >= 0.4 && screenRatio < 0.5{
        deviceCode = 3
    }
    return deviceCode
}

