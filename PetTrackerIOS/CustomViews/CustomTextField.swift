//
//  CustomTextField.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 4.07.2023.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    var leftImageView = UIImageView()
    var rigtImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder : String, leftIcon : UIImage , isSecure: Bool) {
        self.init()
        
        leftImageView.image = leftIcon
        leftImageView.frame = CGRect(x:5,y:0,width: 20,height: 20)
        
        let uiview = UIView(frame: CGRect(x: 0, y: 0, width: 25, height:20))
        uiview.addSubview(leftImageView)
        
        self.leftView = uiview
        self.leftViewMode = .always
        
        if isSecure
        {
            rigtImageView.image = UIImage(named: "nonvisible")
            rigtImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

            let rightUiView=UIView(frame:CGRect(x: 2, y: 0, width: 25, height: 20))
            rightUiView.addSubview(rigtImageView)
            rightUiView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickPasswordImage)))
            
            self.rightView = rightUiView
            self.rightViewMode = .always
            self.isSecureTextEntry = isSecure
        }
        
        self.placeholder = placeholder
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 2.0
        self.layer.borderColor = CGColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
                                             
    }
    
    @objc func clickPasswordImage()
    {
        if self.isSecureTextEntry
        {
            rigtImageView.image = UIImage(named: "visible")
        }
        else
        {
            rigtImageView.image = UIImage(named: "nonvisible")
        }
        
        self.isSecureTextEntry = !self.isSecureTextEntry
    }
    
}
