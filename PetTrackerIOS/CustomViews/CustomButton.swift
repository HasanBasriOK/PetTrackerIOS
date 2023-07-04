//
//  CustomButton.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 4.07.2023.
//

import UIKit

class CustomButton: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(caption : String, buttonImage : UIImage? = nil ) {
        self.init()
        
        self.setTitle(caption, for: .normal)
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 2.0
        self.layer.borderColor = CGColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        self.layer.backgroundColor = CGColor(red: 0/255, green: 153/255, blue: 255/255, alpha: 1)
        
        if buttonImage != nil {
            self.setImage(buttonImage, for: .normal)
        }
    }
}
