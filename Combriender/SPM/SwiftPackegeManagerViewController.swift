//
//  SwiftPackegeManagerViewController.swift
//  Combriender
//
//  Created by Vinícius Pinheiro on 08/11/21.
//

import UIKit
import Lottie
import FloatingPanel

class SwiftPackegeManagerViewController: UIViewController, FloatingPanelControllerDelegate {
    
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    let animationView1 = AnimationView()
    let animationView2 = AnimationView()
    let animationView3 = AnimationView()
    let fpc = FloatingPanelController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fpc.delegate = self
        setupAnimation()
        
    }
    
    
    @objc func floatingPainelAppear1(_ sender: UITapGestureRecognizer? = nil) {
        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "fpc_content") as? ContentViewController else { return }
        contentVC.contentImageVie.image = UIImage(named: "pikachu")
        contentVC.animationView1.animation = Animation.named("22892-pikachu")
        contentVC.animationView1.frame = CGRect(x: +10.5, y: -20, width: 200, height: 200)
        contentVC.animationView1.contentMode = .scaleAspectFill
        contentVC.animationView1.loopMode = .loop
        contentVC.animationView1.play()
        contentVC.contentImageVie.addSubview(animationView1)
        contentVC.contentImageVie.contentMode = .scaleAspectFit
        contentVC.pokemonNameLabel.text = "Pikachu"
        fpc.set(contentViewController: contentVC)
        fpc.addPanel(toParent: self)
        
    }
    
    @objc func floatingPainelAppear2(_ sender: UITapGestureRecognizer? = nil) {
        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "fpc_content") as? ContentViewController else { return }
        fpc.set(contentViewController: contentVC)
        fpc.addPanel(toParent: self)
    }
    
    @objc func floatingPainelAppear3(_ sender: UITapGestureRecognizer? = nil) {
        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "fpc_content") as? ContentViewController else { return }
        fpc.set(contentViewController: contentVC)
        fpc.addPanel(toParent: self)
    }
    
    func setupAnimation() {
        animationView1.animation = Animation.named("22892-pikachu")
        animationView2.animation = Animation.named("39054-swablu")
        animationView3.animation = Animation.named("67858-pokemon")
        animationView1.frame = CGRect(x: +10.5, y: -20, width: 200, height: 200)
        animationView2.frame = CGRect(x: +10.5, y: -20, width: 200, height: 200)
        animationView3.frame = CGRect(x: +10.5, y: -20, width: 200, height: 200)
        animationView1.contentMode = .scaleAspectFill
        animationView2.contentMode = .scaleAspectFill
        animationView3.contentMode = .scaleAspectFill
        animationView1.loopMode = .loop
        animationView2.loopMode = .loop
        animationView3.loopMode = .loop
        animationView1.play()
        animationView2.play()
        animationView3.play()
        imageView1.addSubview(animationView1)
        imageView2.addSubview(animationView2)
        imageView3.addSubview(animationView3)
        imageView1.contentMode = .scaleAspectFit
        imageView2.contentMode = .scaleAspectFit
        imageView3.contentMode = .scaleAspectFit
        animationView1.isUserInteractionEnabled = true
        animationView2.isUserInteractionEnabled = true
        animationView3.isUserInteractionEnabled = true
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(floatingPainelAppear1(_:)))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(floatingPainelAppear2(_:)))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(floatingPainelAppear3(_:)))
        animationView1.addGestureRecognizer(tap1)
        animationView2.addGestureRecognizer(tap2)
        animationView3.addGestureRecognizer(tap3)
        
    }
    
}
