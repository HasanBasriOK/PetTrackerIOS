//
//  HomeViewController.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 4.07.2023.
//

import UIKit

protocol HomeViewControllerDelegate : AnyObject {
    func didTapMenuButton()
}

class HomeViewController: UIViewController {

    weak var delegate : HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Home"
        
        let hamburgerButton = UIBarButtonItem(image: UIImage(named: "hamburgerIcon"),
                                              style: .done,
                                              target: self,
                                              action: #selector(didTapMenuButton))
        hamburgerButton.tintColor = UIColor(red: 66/255, green: 164/255, blue: 50/255, alpha: 1)
        
        navigationItem.leftBarButtonItem = hamburgerButton
        
        
        let notificationButton = UIBarButtonItem(image:UIImage(systemName: "bell.fill"),
                                                 style: .done,
                                                 target: self,
                                                 action: nil)
        notificationButton.tintColor = UIColor(red: 66/255, green: 164/255, blue: 50/255, alpha: 1)
        
        navigationItem.rightBarButtonItem = notificationButton
        
    }
    
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }
    
}
