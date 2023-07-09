//
//  TaskDetailsVC.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 04/07/23.
//

import UIKit

class TaskDetailsVC: UIViewController {

    private var viewModel = TaskDetailsViewModel()
    private var Screen : TaskDetailsScreen?
    private var alert : Alert?
    private var isEditingTask : Bool = false
    private var home = HomeVC()

    override func loadView() {
        Screen = TaskDetailsScreen()
        view = Screen
    }

    required init(data: Tasks? = nil) {
        super.init(nibName: nil, bundle: nil)
        viewModel.setTask(data: data)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        alert = Alert(controller: self)
        viewModel.delegate(delegate: self)
        Screen?.configNavView(controller: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        let data : Tasks = viewModel.getTaskData()
        Screen?.titleTaskLabel.text = data.title
        Screen?.descriptionValueLabel.text = data.description
        Screen?.datelabel.text = "\(data.day ?? "" )/\(data.month ?? "")/\(data.year ?? "") - "
        Screen?.hourlabel.text = data.time
        
        switch Int(data.level ?? 0){
        case 0 :
            Screen?.levelIdentifierView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.6)
        case 1:
            Screen?.levelIdentifierView.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.6)
        case 2:
            Screen?.levelIdentifierView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.6)
        case 3:
            Screen?.levelIdentifierView.backgroundColor = UIColor.systemRed.withAlphaComponent(0.6)
        default:
            break
        }
    }
}
extension TaskDetailsVC : TaskDetailsViewModelProtocol {
    func sucess() {
        home.changed(true)
        navigationController?.popViewController(animated: true)
    }
    
    func failure() {
        
    }
    
    
}

extension TaskDetailsVC : NavViewDetailsProtocol {
    func tappedEditButton() {
        Screen?.setEditMode()
        self.isEditingTask = true
    }
    
    func tappedRejectButton() {
        alert?.showAlertDecision(title: "Cancelar Alterações", message: "Tem certeza que deseja cancelar sua edição, todas as alterações serão perdidas!"){
            decision in
            if decision {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    func acceptChangesButton() {
        let tilte = Screen?.titleTaskLabel.text ?? ""
        let description = Screen?.descriptionValueLabel.text ?? ""
        viewModel.upddateTaskChanges(title: tilte, description: description)
    }
    
    func tappedBackButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}
