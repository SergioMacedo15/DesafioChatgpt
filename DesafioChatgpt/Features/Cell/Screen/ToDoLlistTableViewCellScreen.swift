//
//  ToDoLlistTableViewCellScreen.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 30/06/23.
//

import UIKit

class ToDoLlistTableViewCellScreen: UIView {

    lazy var backGroundView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var titleTaskLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont (ofSize: 18)
        return label
    }()
    
    lazy var descriptionTaskLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var identifierView : UIView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    lazy var hourLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func addElementes(){
        addSubview(backGroundView)
        backGroundView.addSubview(mainView)
        mainView.addSubview(titleTaskLabel)
        mainView.addSubview(descriptionTaskLabel)
        mainView.addSubview(dateLabel)
        mainView.addSubview(hourLabel)
        backGroundView.addSubview(identifierView)
       
        
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            
            backGroundView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            backGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backGroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            identifierView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 10),
            identifierView.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor),
            identifierView.widthAnchor.constraint(equalToConstant: 20),
            identifierView.heightAnchor.constraint(equalToConstant: 80),
    
            titleTaskLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 5),
            titleTaskLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            titleTaskLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            
            dateLabel.topAnchor.constraint(equalTo: titleTaskLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: hourLabel.leadingAnchor),
            
            hourLabel.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            hourLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            hourLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            descriptionTaskLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            descriptionTaskLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            descriptionTaskLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            descriptionTaskLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -5),
            
            mainView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainView.leadingAnchor.constraint(equalTo: identifierView.trailingAnchor, constant: 10),
            mainView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -10),
            mainView.heightAnchor.constraint(equalToConstant: 80),
            
            
            
        ])
    }
}
