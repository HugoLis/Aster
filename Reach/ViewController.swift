//
//  ViewController.swift
//  Reach
//
//  Created by Turma Tarde on 4/3/18.
//  Copyright © 2018 Turma Tarde. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    //self.view.addSubview(UIView())
    
    let sceneView = self.view as! SpaceView
    
    sceneView.PlayBackgroundMusic()
    
    if let scene = GameScene0(fileNamed: "GameScene") {
      scene.scaleMode = .aspectFill
      sceneView.presentScene(scene)
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

