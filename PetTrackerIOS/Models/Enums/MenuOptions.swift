//
//  MenuOptions.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 6.07.2023.
//

import Foundation


enum MenuOptions: String, CaseIterable {
    case dashboard = "Best Friends"
    case vaccines = "Vaccine"
    case treatments = "Treatment"
    case medicines = "Medicine"
    case coiffeur = "Coiffeur"
    case foods = "Food"
    case settings = "Settings"
    case profile = "Profile"
    
    
    var imageName: String {
        switch self {
        case .dashboard:
            return "house"
        case .vaccines:
            return "building"
        case .treatments:
            return "doc.text"
        case .medicines:
            return "building.2"
        case .coiffeur:
            return "doc.text.image"
        case .foods:
            return "doc.text.image"
        case .settings:
            return "gear"
        case .profile:
            return "person"
        }
    }
}
