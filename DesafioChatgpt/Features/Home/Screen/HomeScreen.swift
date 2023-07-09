//
//  HomeScreen.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 30/06/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var navView : NavView = {
        let view = NavView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }( )
    
    lazy var titleToDoListLabel : UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "To Do List"
        lable.font = UIFont.boldSystemFont(ofSize: 35)
        lable.textColor = .black
        return lable
    }()
    

    lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(ToDoLlistTableViewCell.self, forCellReuseIdentifier: ToDoLlistTableViewCell.identifier)
        tv.backgroundColor = .clear
        tv.showsVerticalScrollIndicator = false
        tv.separatorStyle = .none
        
        return tv
    }()
    
    public func reloadTableView(){
        self.tableView.reloadData()
    }
    public func configButtonNavBar(delegate: navViewProtocol){
        navView.delegate(delegate: delegate)
    }
    
    public func configTableView(delegate : UITableViewDelegate, datasource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = datasource
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementes(){
        addSubview(tableView)
        addSubview(navView)
        addSubview(titleToDoListLabel)
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            navView.topAnchor.constraint(equalTo: self.topAnchor),
            navView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navView.heightAnchor.constraint(equalToConstant: 140),
            
            titleToDoListLabel.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: 10),
            titleToDoListLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleToDoListLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleToDoListLabel.heightAnchor.constraint(equalToConstant: 25),
            
            tableView.topAnchor.constraint(equalTo: titleToDoListLabel.bottomAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}
