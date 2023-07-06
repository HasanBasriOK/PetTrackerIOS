//
//  LoginViewController.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 4.07.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginImageView = UIImageView()
    let usernameTextField = CustomTextField(placeholder: "Username", leftIcon: UIImage(named:"personIcon")!, isSecure: false)
    let passwordTextField = CustomTextField(placeholder: "Password", leftIcon: UIImage(named:"passkeyIcon")!, isSecure: true)
    let loginButton = CustomButton(caption: "Login")
    let registerButton = CustomButton(caption: "Register")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        initViewObjects()
        initActions()
    }
    
    func initViewObjects(){
        
        loginImageView.image = UIImage(named:"cute-dogs")
        loginImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        containerView.addSubview(loginImageView)
        containerView.addSubview(usernameTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(loginButton)
        containerView.addSubview(registerButton)
        
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
            loginImageView.heightAnchor.constraint(equalToConstant: 180)
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
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo:passwordTextField.leadingAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 300),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            registerButton.leadingAnchor.constraint(equalTo:passwordTextField.leadingAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 300),
            registerButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
    func initActions(){
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
    }
    
}

//Actions
extension LoginViewController {
    
    @objc func login() {
        
        let enteredUsername = self.usernameTextField.text ?? ""
        let enteredPassword = self.passwordTextField.text ?? ""
        
        if enteredUsername.isEmpty || enteredPassword.isEmpty {
            
            AlertHelper.showBasicAlert(message: UserMessageConstants.loginValidationFailedMessage, viewController: self)
            return
        }
        
        let encryptedPassword = AES(key: CrypteConstants.clientEncryptionKey, initializeVectorParameter: CrypteConstants.initializeVector)?.encrypt(string: enteredPassword)
        
        let loginRequest = LoginRequest()
        loginRequest.username = enteredUsername
        
        if let password = encryptedPassword?.base64EncodedString() {
            loginRequest.password = password
        }
        
        UserApiManager.login(loginRequest: loginRequest) { response in
            
            if !response.isSuccess {
                
                var errorMessage = UserMessageConstants.loginFailedMessage
                
                for message in response.messages {
                    errorMessage += message
                }
                
                AlertHelper.showBasicAlert(message: errorMessage, viewController: self)
                return
            }
            
            GlobalInformations.name = response.data.name
            GlobalInformations.userId = response.data.userId
            
            let homeViewController = ContainerViewController()
            self.navigationController?.pushViewController(homeViewController, animated: true)
            
        }
        
    }
    
    @objc func register() {
        
        let registerViewController = RegisterViewController()
        navigationController?.present(registerViewController, animated: true)
        
    }
    
}
