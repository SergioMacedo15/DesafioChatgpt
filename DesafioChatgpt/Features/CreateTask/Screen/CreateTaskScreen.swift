//
//  HomeScreen.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 30/06/23.
//

import UIKit

protocol CreateTaskScreenProtocol : AnyObject {
    func tappedAcceptButton(data: [String:Any])
    func tappedRejectButton()
    
}

class CreateTaskScreen: UIView {
    
    weak var delegate :CreateTaskScreenProtocol?
    private var TaskDetails : [String:Any] = [:]
    public func delegate(delegate :CreateTaskScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var titleCreateTask: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Add New Task"
        label.textAlignment = .center
        return label
    }()
    
    lazy var acceptButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(tappedAcceptButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedAcceptButton(){
        self.requestData()
        delegate?.tappedAcceptButton(data: self.TaskDetails)
    }
    lazy var rejectButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .lightGray
        btn.addTarget(self, action: #selector(tappedRejectButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedRejectButton(){
        delegate?.tappedRejectButton()
    }
    
    lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var datePickerView : DatePickerView = {
        let view = DatePickerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.datePicker.addTarget(self, action: #selector(tappedAcceptButton), for: .touchUpInside)
        return view
    }()
    
    lazy var TextFieldView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.setShadow()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Titulo:"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var titleTaskTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.placeholder = "Digite um titulo"
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 5
        return tf
    }()
    
    
    public func configTextField(delegate: UITextFieldDelegate){
        self.titleTaskTextField.delegate = delegate
    }
    
    lazy var titlepickerOptionViewLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Nivel de Importancia"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    lazy var pickerOptionView : UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    public func configPickerView(delegate : UIPickerViewDelegate, datasource : UIPickerViewDataSource){
        pickerOptionView.delegate = delegate
        pickerOptionView.dataSource = datasource
    }
    
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Descrição:"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var descriptionTextFieldView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.setShadow()
        return view
    }()
    
    lazy var descriptionTextField: UITextView = {
        let tf = UITextView()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.text = "Descreva sua tarefa"
        tf.textColor = .lightGray
        tf.clipsToBounds = true
        return tf
    }()
    
    public func configTextView(delegate: UITextViewDelegate){
        self.descriptionTextField.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configStackView()
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func requestData(){
        configRequestDatePicker()
        configRequestTimePicker()
        TaskDetails.updateValue(self.titleTaskTextField.text ?? " ", forKey: "Title")
        TaskDetails.updateValue(self.descriptionTextField.text ?? " ", forKey: "Description")
        TaskDetails.updateValue(pickerOptionView.selectedRow(inComponent: 0), forKey: "Level")
        TaskDetails.updateValue(UUID().uuidString, forKey: "Key")
    }
    
    private func configRequestDatePicker(){
        let dataFormatter = DateFormatter()
        
        dataFormatter.dateFormat = "yyyy"
        let strYear = dataFormatter.string(from: datePickerView.datePicker.date)
        TaskDetails.updateValue(strYear, forKey: "Year")
        
        dataFormatter.dateFormat = "MM"
        let strMonth = dataFormatter.string(from: datePickerView.datePicker.date)
        TaskDetails.updateValue(strMonth, forKey: "Month")
        
        dataFormatter.dateFormat = "dd"
        let strDay = dataFormatter.string(from: datePickerView.datePicker.date)
        TaskDetails.updateValue(strDay, forKey: "Day")
    }
    
    private func configRequestTimePicker(){
        let timeFormatter = DateFormatter()
        
        timeFormatter.timeStyle = DateFormatter.Style.short
        let strTime = timeFormatter.string(from: datePickerView.datePicker.date)
        TaskDetails.updateValue(strTime, forKey: "Time")
    }
    
    
    private func configStackView(){
        stackView.addArrangedSubview(acceptButton)
        stackView.addArrangedSubview(titleCreateTask)
        stackView.addArrangedSubview(rejectButton)
    }
    
    private func addElementes(){
        addSubview(datePickerView)
        addSubview(stackView)
        addSubview(titleLabel)
        addSubview(TextFieldView)
        TextFieldView.addSubview(titleTaskTextField)
        addSubview(titlepickerOptionViewLabel)
        addSubview(pickerOptionView)
        addSubview(descriptionLabel)
        addSubview(descriptionTextFieldView)
        descriptionTextFieldView.addSubview(descriptionTextField)
        
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 30),
            
            datePickerView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            datePickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            datePickerView.heightAnchor.constraint(equalToConstant: 250),
            
            titleLabel.topAnchor.constraint(equalTo: datePickerView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            TextFieldView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            TextFieldView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            TextFieldView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            TextFieldView.heightAnchor.constraint(equalToConstant: 35),
            
            titleTaskTextField.topAnchor.constraint(equalTo: TextFieldView.topAnchor),
            titleTaskTextField.leadingAnchor.constraint(equalTo: TextFieldView.leadingAnchor, constant: 20),
            titleTaskTextField.trailingAnchor.constraint(equalTo: TextFieldView.trailingAnchor),
            titleTaskTextField.bottomAnchor.constraint(equalTo: TextFieldView.bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: TextFieldView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            descriptionTextFieldView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionTextFieldView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionTextFieldView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionTextFieldView.heightAnchor.constraint(equalToConstant: 100),
            
            descriptionTextField.topAnchor.constraint(equalTo: descriptionTextFieldView.topAnchor),
            descriptionTextField.leadingAnchor.constraint(equalTo: descriptionTextFieldView.leadingAnchor, constant: 5),
            descriptionTextField.trailingAnchor.constraint(equalTo: descriptionTextFieldView.trailingAnchor),
            descriptionTextField.bottomAnchor.constraint(equalTo: descriptionTextFieldView.bottomAnchor),
            
            
            titlepickerOptionViewLabel.topAnchor.constraint(equalTo: descriptionTextFieldView.bottomAnchor, constant: 20),
            titlepickerOptionViewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titlepickerOptionViewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            pickerOptionView.topAnchor.constraint(equalTo: titlepickerOptionViewLabel.topAnchor, constant: 20),
            pickerOptionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pickerOptionView.heightAnchor.constraint(equalToConstant: 100),
            
            
            
            
            
        ])
    }
}
