//
//  ViewController.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 29/06/23.
//

import UIKit

class CreateTaskVC: UIViewController {
    
    private var Screen : CreateTaskScreen?
    private var viewModel = CreateTaskViewModel()
    private var home = HomeVC()
    private var alert : Alert?
  
    override func loadView() {
        Screen = CreateTaskScreen()
        view = Screen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Screen?.configPickerView(delegate: self, datasource: self)
        Screen?.configTextView(delegate: self)
        Screen?.configTextField(delegate: self)
        Screen?.delegate(delegate: self)
        viewModel.delegate(delegate: self)
        alert = Alert(controller: self)
        view.backgroundColor = .white
    }
    
}
extension CreateTaskVC: CreateTaskViewModelProtocol {
    func sucess() {

    }
    
    func failure() {
        
    }
    
    
}

extension CreateTaskVC : CreateTaskScreenProtocol {
  
    func tappedAcceptButton(data: [String : Any]) {
        if ((Screen?.titleTaskTextField.text?.isEmpty) != false) {
            alert?.showAlertInformation(title: "Ops..Houve um erro", message: "Para adicionar a tarefa é necessário preencher o titulo.")
            return
        }
        
        viewModel.createTask(data: data)
        alert?.showAlertInformation(title: "Tarefa Criada", message: "Sua Tarefa foi criada com sucesso"){
            result in
            if result {
                self.home.changed(true)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func tappedRejectButton() {
        alert?.showAlertDecision(title: "Cancelar Task", message: "Tem certeza que deseja fechar o cadastro da task ? todos as informações serão perdidas!!"){ result in
            if result {
                self.home.changed(false)
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
}

extension CreateTaskVC : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        viewModel.numberOfItens
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.numberOfRowsInComponent(component: component)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.titleForRow(row: row)
    }
}

extension CreateTaskVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if Screen?.descriptionTextField.text == "Descreva sua tarefa"{
            Screen?.descriptionTextField.text = " "
            Screen?.descriptionTextField.textColor = .black
        } else{
            Screen?.descriptionTextField.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if Screen?.descriptionTextField.text == "" {
            Screen?.descriptionTextField.text = "Descreva sua tarefa"
            Screen?.descriptionTextField.textColor = .lightGray
        } else{
            Screen?.descriptionTextField.textColor = .black
        }
    }
    
}

extension CreateTaskVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
