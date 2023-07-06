//
//  BaseResponse.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 6.07.2023.
//

import Foundation

class BaseResponse : Decodable {
    
    var isSuccess : Bool = false
    var messages : [String] = []
    
}
