//
//  AlertHelper.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 4.07.2023.
//

import Foundation
import UIKit

class AlertHelper {
    
    
    static func showBasicAlert(message : String,viewController : UIViewController){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
