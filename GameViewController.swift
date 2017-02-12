
//
//  Created by kaiyue wang on 12/9/16.
//  Copyright © 2016 kaiyuewang. All rights reserved.
//


import UIKit
import SceneKit
import SpriteKit

class GameViewController: UIViewController {

  var scnView: SCNView!
  var scnScene: SCNScene!
  var cameraNode: SCNNode!
  
  override func viewDidLoad() {
    print("arrive")
    super.viewDidLoad()
    setupView()
    setupScene()
    setupCamera()
    spawnShape()
    
  }

  override var shouldAutorotate : Bool {
    return true
  }

  override var prefersStatusBarHidden : Bool {
    return true
  }
  
  func setupView() {
    scnView = self.view as! SCNView
    
    
    // 1
    scnView.showsStatistics = true
    // 2
    scnView.allowsCameraControl = true
    // 3
    scnView.autoenablesDefaultLighting = true
    
    let starButton = UIButton(type: UIButtonType.custom)
    starButton.frame = CGRect(x: 50, y: 50, width: 50, height: 30)
    starButton.setTitle("Exit", for: UIControlState())
    starButton.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 25)
    
    scnView.addSubview(starButton)
    starButton.addTarget(self, action: #selector(GameViewController.starButtonClicked), for: UIControlEvents.touchUpInside)
    
    let ymax = view.frame.maxY
    let xmax = view.frame.maxX
    let trademark = UILabel(frame: CGRect(x: xmax - 230 ,y: ymax - 80,width: 200,height: 30))
    trademark.text = "Beyond Smartphone team"
    trademark.textColor = UIColor.white
    scnView.addSubview(trademark)
  }

    func starButtonClicked(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "initial") as! initialViewController
        self.present(vc, animated: true, completion: nil)

    }

  
  func setupScene() {
    scnScene = SCNScene()
    scnView.scene = scnScene
    scnScene.background.contents = "Background_Diffuse.png"
  }
  
  func setupCamera() {
    // 1
    cameraNode = SCNNode()
    // 2
    cameraNode.camera = SCNCamera()
    // 3
    cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
    // 4
    scnScene.rootNode.addChildNode(cameraNode)
  }
  
  func spawnShape() {
    // 1
    var geometry:SCNGeometry
    // 2
    switch ShapeType.random() {
    case .Box:
      geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
    case .Sphere:
      geometry = SCNSphere(radius: 0.5)
    case .Pyramid:
      geometry = SCNPyramid(width: 1.0, height: 1.0, length: 1.0)
    case .Torus:
      geometry = SCNTorus(ringRadius: 0.5, pipeRadius: 0.25)
    case .Capsule:
      geometry = SCNCapsule(capRadius: 0.3, height: 2.5)
    case .Cylinder:
      geometry = SCNCylinder(radius: 0.3, height: 2.5)
    case .Cone:
      geometry = SCNCone(topRadius: 0.25, bottomRadius: 0.5, height: 1.0)
    case .Tube:
      geometry = SCNTube(innerRadius: 0.25, outerRadius: 0.5, height: 1.0)
    }
    // 4
    let geometryNode = SCNNode(geometry: geometry)
    // 5
    scnScene.rootNode.addChildNode(geometryNode)
  }
  
}
