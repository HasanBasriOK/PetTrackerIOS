//
//  LoginResponseModel.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 6.07.2023.
//

import Foundation

class LoginResponseModel : Decodable {
    
    var accessToken : String = ""
    var refreshToken : String = ""
    var email : String = ""
    var name : String = ""
    var userId : UUID = UUID()
    
}
