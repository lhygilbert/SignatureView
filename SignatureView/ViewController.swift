//
//  ViewController.swift
//  SignatureView
//
//  Created by Gilbert Lo on 1/13/19.
//  Copyright © 2019 Gilbert Lo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let signView = SignatureView()
    
    private lazy var clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var captureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Capture", for: .normal)
        button.addTarget(self, action: #selector(captureButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(signView)
        signView.translatesAutoresizingMaskIntoConstraints = false
        signView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        signView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signView.widthAnchor.constraint(equalToConstant: 320).isActive = true
        signView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        view.addSubview(clearButton)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.topAnchor.constraint(equalTo: signView.bottomAnchor, constant: 4).isActive = true
        clearButton.trailingAnchor.constraint(equalTo: signView.trailingAnchor).isActive = true
        
        view.addSubview(captureButton)
        captureButton.translatesAutoresizingMaskIntoConstraints = false
        captureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        captureButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
    }
    
    @objc private func clearButtonTapped() {
        signView.clear()
    }
    
    @objc private func captureButtonTapped() {
        let image = signView.captureImage()
        
        let captureVC = CaptureViewController()
        captureVC.setImage(image: image)
        let navVC = UINavigationController(rootViewController: captureVC)
        self.present(navVC, animated: true, completion: nil)
    }
    
}

