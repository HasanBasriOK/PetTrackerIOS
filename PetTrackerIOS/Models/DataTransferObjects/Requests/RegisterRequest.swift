//
//  RegisterRequest.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 6.07.2023.
//

import Foundation

class RegisterRequest : Encodable {
    
    var email : String = ""
    var password : String = ""
    var phone : String = ""
    var birthDate : Date = Date()
}
