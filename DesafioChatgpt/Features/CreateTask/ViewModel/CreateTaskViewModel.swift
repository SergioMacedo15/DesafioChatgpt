//
//  CreateTaskViewModel.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 02/07/23.
//

import UIKit
import Firebase

protocol CreateTaskViewModelProtocol : AnyObject {
    func sucess()
    func failure()
}

class CreateTaskViewModel {
    
    private var taskLevels : [String] = ["Sem Urgencia", "Pouca Urgencia", "Urgente", "Emergencia"]
    private weak var delegate : CreateTaskViewModelProtocol?
    private var db = Firestore.firestore()
    private var Tasks : [Tasks]?
    
    public func delegate(delegate: CreateTaskViewModelProtocol?){
        self.delegate = delegate
    }
    //FIRESTORE CONFIGS
    
    public func createTask(data: [String:Any]){
        db.collection("Tasks").document(data["Key"] as? String ?? "").setData(data)
    }
    
    
    // PICKERVIEW CONFIGS
    public var numberOfItens : Int {
        1
    }
    
    public func numberOfRowsInComponent(component: Int) -> Int{
        4
    }
    
    public func titleForRow( row: Int) -> String{
        return taskLevels[row]
    }
    
    public func validateTask(title : String) -> Bool{
        for i in title {
            if i != " "{
                return true
            }
        }
        return false
    }
    
    
}
