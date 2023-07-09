//
//  CreateTaskViewModel.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 02/07/23.
//

import UIKit
import Firebase


enum filterSelect {
    case Level
    case Date
}


protocol HomeViewModelProtocol: AnyObject {
    func sucess()
    func failure()
}

class HomeViewModel {
    
    private var taskLevels : [String] = ["Sem Urgencia", "Pouca Urgencia", "Urgente", "Emergencia"]
    private var filterMode : filterSelect = .Date
    private var db = Firestore.firestore()
    private var TasksList : [Tasks] = []
    private var searchTask: [Tasks] = []
    private weak var delegate :HomeViewModelProtocol?
    
    public func delegate(delegate :HomeViewModelProtocol?){
        self.delegate = delegate
    }
    
    // public func featch
    
    public func reloadToDoList(){
        self.TasksList.removeAll()
        db.collection("Tasks").getDocuments { snapShorResult, error in
            if error == nil {
                if let snapShot = snapShorResult {
                    for document in snapShot.documents {
                        let data = document.data()
                        self.TasksList.append(Tasks(data: data))
                    }
                    switch self.filterMode {
                    case .Date:
                        self.filterforDate()
                    case .Level:
                        self.filterforLevel()
                    }
                    self.delegate?.sucess()
                }
            }
        }
    }
    
    public func removeTask(index: Int){
        db.collection("Tasks").document(self.TasksList[index].title ?? "").delete()
    }
    
    //MARK: FUNCS FOR TABLEVIEW
    
    public var numberOfRowsInSection: Int {
        return TasksList.count
    }
    
    public func loadCurrentTask(indexPath : IndexPath) -> Tasks{
        return self.TasksList[indexPath.row]
    }
    
    public func deleteCurrentTask(indexPath: IndexPath){
        self.TasksList.remove(at: indexPath.row)
        self.removeTask(index: indexPath.row)
    }
    
    public func setFilterMode(filterMode : filterSelect){
        self.filterMode = filterMode
    }
    
    //MARK: SECTION FOR FILTER METHODS
    
    public func filterforDate(){
        var DateList :[String] = []
        var filterTask : [String:Any] = [:]
        var tasklist :[Tasks] = []
        var latestDate : String = " "
        
        for task in TasksList{
            
            let datafilter = "\(task.year ?? "")\(task.month ?? "")\(task.day ?? "")"
            DateList.append(datafilter)
            
            if filterTask[datafilter] != nil {
                let dataList = filterTask[datafilter] as? [Tasks] ?? []
                if dataList.isEmpty != true {
                    tasklist = dataList
                } else {
                    let data = filterTask[datafilter] as? Tasks ?? Tasks(data: [:])
                    tasklist.append(data)
                }

                tasklist.append(task)
                filterTask.updateValue(tasklist, forKey: datafilter)
                tasklist.removeAll()
            } else {
                filterTask.updateValue(task, forKey: datafilter)
            }
        }
        
        TasksList.removeAll()
        DateList.sort()
        
        for date in DateList{
            if date == latestDate{
                continue
            }
            latestDate = date
            let taskes : [Tasks] = filterTask[date] as?  [Tasks] ?? []
            if taskes.isEmpty {
                let Onetask : Tasks = filterTask[date] as?  Tasks ?? Tasks(data: [:])
                TasksList.append(Onetask)
            } else {
                for task in taskes {
                    TasksList.append(task)
                }
            }
            
        }
       searchTask = TasksList
        
    }
    
    public func filterforLevel(){
        var filterLevelTask : [Tasks] = []
        
        for level in 0...3{
            for task in TasksList{
                if task.level == 3 - level  {
                    filterLevelTask.append(task)
                }
            }
        }
        TasksList.removeAll()
        TasksList = filterLevelTask
        searchTask = TasksList
    }
    
    public func filterforText(_ text: String){
        TasksList.removeAll()
        if text.isEmpty {
            TasksList = searchTask
        } else {
            TasksList = searchTask.filter({ tasks in
                return tasks.title?.lowercased().contains(text.lowercased()) ?? false
            })
            
            
        }
    }
    
}
