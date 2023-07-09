//
//  UIView+Extensions.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 30/06/23.
//

import Foundation
import UIKit


extension UIView{
    
    func setShadow(){
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        self.layer.cornerRadius = 5
    }
    
}
