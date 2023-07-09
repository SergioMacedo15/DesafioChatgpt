//
//  TaskDetailsScreen.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 04/07/23.
//

import UIKit

class TaskDetailsScreen: UIView {
    
    
    lazy var NavView : NavViewDetails = {
        let view = NavViewDetails()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public func configNavView(controller: NavViewDetailsProtocol){
        NavView.delegate(delegate: controller)
    }
    
    lazy var levelIdentifierView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var titleTaskLabel: UITextField = {
        let label = UITextField ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.clipsToBounds = true
        label.isEnabled = false
        label.layer.cornerRadius = 5
        return label
    }()
    
    lazy var lineChangeView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isHidden = true
        return view
    }()
    
    lazy var datelabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var hourlabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isHidden = true
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Description"
        return label
    }()
    
    lazy var descriptionValueLabel: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.isEditable = false
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setEditMode(){
        NavView.acceptButton.isHidden = false
        NavView.rejectButton.isHidden = false
        NavView.editingButton.isHidden = true
        self.lineChangeView.isHidden = false
        self.titleTaskLabel.backgroundColor = .lightGray.withAlphaComponent(0.1)
        self.titleTaskLabel.isEnabled = true
        self.descriptionValueLabel.backgroundColor = .lightGray.withAlphaComponent(0.1)
        self.descriptionValueLabel.isEditable = true
    }
    
    public func setDefaultMode(){
        NavView.acceptButton.isHidden = true
        NavView.rejectButton.isHidden = true
        NavView.editingButton.isHidden = false
        self.lineChangeView.isHidden = true
        self.titleTaskLabel.backgroundColor = .white
        self.titleTaskLabel.isEnabled = false
        self.descriptionValueLabel.backgroundColor = .white
        self.descriptionValueLabel.isEditable = false
    }
    
    private func addElementes(){
        addSubview(NavView)
        addSubview(levelIdentifierView)
        addSubview(titleTaskLabel)
        addSubview(datelabel)
        addSubview(hourlabel)
        addSubview(lineView)
        addSubview(descriptionLabel)
        addSubview(descriptionValueLabel)
        addSubview(lineChangeView)
        
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            NavView.topAnchor.constraint(equalTo: topAnchor),
            NavView.trailingAnchor.constraint(equalTo: trailingAnchor),
            NavView.leadingAnchor.constraint(equalTo: leadingAnchor),
            NavView.heightAnchor.constraint(equalToConstant: 140),
            
            levelIdentifierView.topAnchor.constraint(equalTo: NavView.bottomAnchor, constant: 15),
            levelIdentifierView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            levelIdentifierView.heightAnchor.constraint(equalToConstant: 20),
            levelIdentifierView.widthAnchor.constraint(equalToConstant: 20),
            
            titleTaskLabel.topAnchor.constraint(equalTo: levelIdentifierView.topAnchor, constant: -5),
            titleTaskLabel.leadingAnchor.constraint(equalTo: levelIdentifierView.trailingAnchor, constant: 20),
            titleTaskLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            lineChangeView.topAnchor.constraint(equalTo: titleTaskLabel.bottomAnchor, constant: 1),
            lineChangeView.leadingAnchor.constraint(equalTo: titleTaskLabel.leadingAnchor),
            lineChangeView.trailingAnchor.constraint(equalTo: titleTaskLabel.trailingAnchor, constant: -10),
            lineChangeView.heightAnchor.constraint(equalToConstant: 1),
            
            datelabel.topAnchor.constraint(equalTo: titleTaskLabel.bottomAnchor, constant: 10),
            datelabel.leadingAnchor.constraint(equalTo: titleTaskLabel.leadingAnchor, constant: -10),
            datelabel.trailingAnchor.constraint(equalTo: hourlabel.leadingAnchor),
            
            hourlabel.topAnchor.constraint(equalTo: datelabel.topAnchor),
            hourlabel.leadingAnchor.constraint(equalTo: datelabel.trailingAnchor, constant: 5),
            hourlabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            lineView.topAnchor.constraint(equalTo: hourlabel.bottomAnchor, constant: 20),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            descriptionLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: lineView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleTaskLabel.trailingAnchor),
            
            descriptionValueLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionValueLabel.leadingAnchor.constraint(equalTo: lineView.leadingAnchor),
            descriptionValueLabel.trailingAnchor.constraint(equalTo: lineView.trailingAnchor),
            descriptionValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            
        ])
    }
    
}
