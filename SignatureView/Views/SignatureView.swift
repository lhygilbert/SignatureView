//
//  SignatureView.swift
//  SignatureView
//
//  Created by Gilbert Lo on 1/13/19.
//  Copyright © 2019 Gilbert Lo. All rights reserved.
//

import UIKit

class SignatureView: DrawView {
    
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 8
        
        addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setLineIsHidden(_ isHidden: Bool) {
        line.isHidden = isHidden
    }
    
}
