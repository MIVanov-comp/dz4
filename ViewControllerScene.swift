//
//  ViewControllerScene.swift
//  dz4
//
//  Created by Apple iMac 27 on 08.12.2020.
//
import UIKit

class ViewControllerScene: UIViewController {

    var buttonA: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonA = UIButton()
        buttonA.translatesAutoresizingMaskIntoConstraints = false
        buttonA.backgroundColor = .systemTeal
        buttonA.tintColor = .systemGray
        buttonA.setTitle("ZHMI", for: .normal)
        view.addSubview(buttonA)
        
        
        NSLayoutConstraint.activate([
            buttonA.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            buttonA.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor)
        ])
        // Do any additional setup after loading the view.
    }
}
