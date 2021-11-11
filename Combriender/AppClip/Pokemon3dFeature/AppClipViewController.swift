//
//  ViewController.swift
//  Poke3D
//
//  Created by Vinícius Pinheiro on 03/11/21.
//

import UIKit
import SceneKit
import ARKit

class AppClipViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.autoenablesDefaultLighting = true
        
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Cards", bundle: Bundle.main) {
            
            configuration.detectionImages = imageToTrack
            
            configuration.maximumNumberOfTrackedImages = 2
            
            print("Images Successfully Added")
            
        }
        
        
        
        // Run the view's session
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
        
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
            
            let planeNode = SCNNode(geometry: plane)
 
            if imageAnchor.referenceImage.name == "cover1" {
                if let pokeScene = SCNScene(named: "art.scnassets/eevee.scn") {
                    
                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                        
                        pokeNode.eulerAngles.x = .pi/2
                        
                        planeNode.addChildNode(pokeNode)
                        
                    }
                }
            }
            
            if imageAnchor.referenceImage.name == "cover2" {
                if let pokeScene = SCNScene(named: "art.scnassets/Pikachu OBJ.obj") {
                    
                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                        
                        pokeNode.eulerAngles.x = .pi/2
                        pokeNode.scale = SCNVector3(x: 5, y: 5, z: 5)
                        planeNode.addChildNode(pokeNode)
                        
                    }
                }
            }
            if imageAnchor.referenceImage.name == "cover3" {
                if let pokeScene = SCNScene(named: "art.scnassets/Charmander_ColladaMax.DAE") {
                    
                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                        
                        pokeNode.eulerAngles.x = .pi/2
                        pokeNode.scale = SCNVector3(x: 5, y: 5, z: 5)
                        planeNode.addChildNode(pokeNode)
                        
                    }
                }
            }
            
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
            
            
        }
        
        return node
        
    }
    
}

