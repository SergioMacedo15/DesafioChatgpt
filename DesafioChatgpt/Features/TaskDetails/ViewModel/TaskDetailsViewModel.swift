//
//  TaskDetailsViewModel.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 04/07/23.
//

import UIKit
import Firebase

protocol TaskDetailsViewModelProtocol : AnyObject {
    func sucess()
    func failure()
}

class TaskDetailsViewModel {
    
    private weak var delegate :TaskDetailsViewModelProtocol?
    private var Task : Tasks?
    private var db = Firestore.firestore()
    
    public func delegate(delegate :TaskDetailsViewModelProtocol?){
        self.delegate = delegate
    }
    
    public func setTask(data: Tasks?){
        self.Task = data
    }
    
    public func getTaskData() -> Tasks{
        return self.Task ?? Tasks(data: [:])
    }
    public func upddateTaskChanges(title: String, description: String){
        let taskUpdate : [String: Any] = [
            "Title" : title,
            "Year": Task?.year ?? "",
            "Day": Task?.day ?? "",
            "Month": Task?.month ?? "",
            "Time": Task?.time ?? "",
            "Level": Task?.level ?? 0,
            "Key": Task?.key ?? "",
            "Description": description
        ]
        db.collection("Tasks").document(Task?.key ?? "").delete(){
            _ in
            self.db.collection("Tasks").document(self.Task?.key ?? "").setData(taskUpdate){
                _ in
                self.delegate?.sucess()
            }
        }
        
         
    }
}
