//
//  HamburgerMenuTableViewCell.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 6.07.2023.
//

import Foundation
import UIKit

class HamburgerMenuTableViewCell : UITableViewCell{
    
    var customImageView = UIImageView()
    var menuItemNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        menuItemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(customImageView)
        contentView.addSubview(menuItemNameLabel)
        
        contentView.addConstraint(customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10))
        contentView.addConstraint(customImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor))
        contentView.addConstraint(customImageView.widthAnchor.constraint(equalToConstant: 30))
        contentView.addConstraint(customImageView.heightAnchor.constraint(equalToConstant: 30))
        
        contentView.addConstraint(menuItemNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 50))
        contentView.addConstraint(menuItemNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor))
        contentView.addConstraint(menuItemNameLabel.widthAnchor.constraint(equalToConstant: 300))
        contentView.addConstraint(menuItemNameLabel.heightAnchor.constraint(equalToConstant: 50))
        
        contentView.addConstraint(contentView.heightAnchor.constraint(equalToConstant: 80))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

