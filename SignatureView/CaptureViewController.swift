//
//  CaptureViewController.swift
//  SignatureView
//
//  Created by Gilbert Lo on 1/13/19.
//  Copyright © 2019 Gilbert Lo. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .done, target: self, action: #selector(handleDismiss))
    }
    
    func setImage(image: UIImage) {
        imageView.image = image
    }
    
    @objc private func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
