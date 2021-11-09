//
//  ViewController.swift
//  Combriender
//
//  Created by Victor Vidal on 08/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var combine: UIView!
    @IBOutlet weak var spm: UIView!
    @IBOutlet weak var appclip: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingNavigationTap()
    }
    
    func settingNavigationTap() {
        let tapRecognizerCombine = UITapGestureRecognizer(target: self, action: #selector(handleTapCombine(_:)))
        let tapRecognizerSPM = UITapGestureRecognizer(target: self, action: #selector(handleTapSPM(_:)))
        let tapRecognizerAppClip = UITapGestureRecognizer(target: self, action: #selector(handleTapAppClip(_:)))
        
        combine.addGestureRecognizer(tapRecognizerCombine)
        spm.addGestureRecognizer(tapRecognizerSPM)
        appclip.addGestureRecognizer(tapRecognizerAppClip)

    }
    
    @objc func handleTapCombine(_ sender: UITapGestureRecognizer? = nil) {
        let storyboard = UIStoryboard(name: "Combine", bundle: .main)
        if let viewController = storyboard.instantiateViewController(identifier: "CombineViewController") as? CombineViewController {
            print("a")
            navigationController?.pushViewController(viewController, animated: false)
        }
    }

    @objc func handleTapSPM(_ sender: UITapGestureRecognizer? = nil) {
        // Insert  SPM navigation
    }
    
    @objc func handleTapAppClip(_ sender: UITapGestureRecognizer? = nil) {
        // Insert  Appclip navigation
    }
}
