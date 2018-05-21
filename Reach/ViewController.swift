
import UIKit
import Foundation

public var currentRun = 0
public var numberOfDeaths = 0
public var leastDeathsInRun1 = -2
public var leastDeathsInRun2 = -2
public var leastDeathsInRun3 = -2
public var numberOfStars = 10

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    //self.view.addSubview(UIView())
    
    let sceneView = self.view as! SpaceView
    
    sceneView.PlayBackgroundMusic()
    
    if let scene = Menu(fileNamed: "GameScene") {
      scene.scaleMode = .aspectFill
      sceneView.presentScene(scene)
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

