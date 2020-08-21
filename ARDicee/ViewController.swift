//
//  ViewController.swift
//  ARDicee
//
//  Created by Jamie on 2020/08/21.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
//        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//
//        let material = SCNMaterial()
//
//        material.diffuse.contents = UIColor.red
//
//        cube.materials = [material]
//
//        let node = SCNNode()
//
//        node.position = SCNVector3(0, 0.1, -0.5)
//        node.geometry = cube
//
//        sceneView.scene.rootNode.addChildNode(node)
        
        
        sceneView.autoenablesDefaultLighting = true
        
        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada copy.scn")!

        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
        
        diceNode.position = SCNVector3(0, 0, -0.1)
        
        sceneView.scene.rootNode.addChildNode(diceNode)
            
        }
        
        
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

  
}
