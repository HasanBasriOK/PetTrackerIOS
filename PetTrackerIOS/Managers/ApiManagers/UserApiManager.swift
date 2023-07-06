//
//  UserApiManager.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 4.07.2023.
//

import Foundation
import Alamofire

class UserApiManager{
    
    static func login(loginRequest: LoginRequest, completion: @escaping (LoginResponse) -> Void ) {
        
        let loginUrl = "\(UrlConstants.baseApiUrl)\(UrlConstants.loginUrl)"
        
        AF.request(loginUrl,
                   method: .post,
                   parameters: loginRequest,
                   encoder: JSONParameterEncoder.default).responseDecodable(of: LoginResponse.self) { response in
            
            if response.error != nil {
                print(response.error!)
            }
            
            if response.value?.isSuccess == true {
                completion(response.value!)
            }
            else {
                completion(LoginResponse())
            }
        }
    }
    
    static func register(registerRequest: RegisterRequest, completion: @escaping (RegisterResponse) -> Void ) {
        
        let registerUrl = "\(UrlConstants.baseApiUrl)\(UrlConstants.registerUrl)"
        
        AF.request(registerUrl,
                   method: HTTPMethod.post,
                   parameters: registerRequest,
                   encoder: JSONParameterEncoder.default).responseDecodable(of: RegisterResponse.self) { response in
            
            if response.error != nil {
                print(response.error!)
            }
            
            if response.value?.isSuccess == true {
                completion(response.value!)
            }
            else {
                completion(RegisterResponse())
            }
        }
    }
}
