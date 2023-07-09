//
//  Alerts.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 02/07/23.
//

import Foundation
import UIKit

class Alert {
    
    private var controller : UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func showAlertInformation(title: String, message: String , completion: ((_ : Bool) -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            completion?(true)
        }
        alertController.addAction(ok)
        self.controller.present(alertController, animated: true)
    }
    
    
    public func showAlertDecision(title: String, message: String, completion: ((Bool) -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            completion?(true)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            completion?(false)
        }
        alertController.addAction(ok)
        alertController.addAction(cancel)
        self.controller.present(alertController, animated: true)
    }
    
    public func showFilterAlert(completion: ((filterSelect)->Void)? = nil){
        let alertController = UIAlertController(title: "Filter", message: "Selecione uma opção de filtragem", preferredStyle: .actionSheet)
        
        let level = UIAlertAction(title: "Filtrar por Level",style: .default) {
            action in
            completion?(.Level)
        }
        
        let date = UIAlertAction(title: "Filtrar Por Data",style: .default) {
            action in
            completion?(.Date)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(level)
        alertController.addAction(date)
        alertController.addAction(cancel)
        self.controller.present(alertController, animated: true)
        
    }
    
}
