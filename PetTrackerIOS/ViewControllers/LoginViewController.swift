//
//  LoginViewController.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 4.07.2023.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        initViewObjects()
        
    }
    
    func initViewObjects(){
        let loginImageView = UIImageView()
        loginImageView.image = UIImage(named:"cute-dogs")
        loginImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let usernameTextField = CustomTextField(placeholder: "Username", leftIcon: UIImage(named:"personIcon")!, isSecure: false)
        
        let passwordTextField = CustomTextField(placeholder: "Password", leftIcon: UIImage(named:"passkeyIcon")!, isSecure: true)
        
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        containerView.addSubview(loginImageView)
        containerView.addSubview(usernameTextField)
        containerView.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            loginImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            loginImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginImageView.widthAnchor.constraint(equalToConstant: 250),
            loginImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
      
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: 30),
            usernameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 50),
            usernameTextField.widthAnchor.constraint(equalToConstant: 300),
            usernameTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 50),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
}
