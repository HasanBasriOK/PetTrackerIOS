//
//  MenuHeaderView.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 6.07.2023.
//

import UIKit

class MenuHeaderView: UIView {
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sampleprofileimage")
        imageView.layer.cornerRadius = 35
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    let greyColor = UIColor(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1)
    
    let usernameTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        let username = NSMutableAttributedString(string: "Hasan Basri Ok", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.black])
        textView.attributedText = username
        textView.backgroundColor = .clear
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(usernameTextView)
        self.backgroundColor = greyColor
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            imageView.topAnchor.constraint(equalTo:self.topAnchor,constant: 30)
            
        ])
        
        NSLayoutConstraint.activate([
            usernameTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 2),
            usernameTextView.widthAnchor.constraint(equalToConstant: 300),
            usernameTextView.heightAnchor.constraint(equalToConstant: 30),
            usernameTextView.leadingAnchor.constraint(equalTo:imageView.leadingAnchor,constant: -5)
            
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("Not initialized")
    }
}

