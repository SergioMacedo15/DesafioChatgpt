//
//  ToDoLlistTableViewCell.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 30/06/23.
//

import UIKit

class ToDoLlistTableViewCell: UITableViewCell {
    
    static var identifier : String = String(describing: ToDoLlistTableViewCell.self)
    
    lazy var Screen : ToDoLlistTableViewCellScreen = {
        let view = ToDoLlistTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementes(){
        contentView.addSubview(Screen)
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            Screen.topAnchor.constraint(equalTo: topAnchor),
            Screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            Screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            Screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(data: Tasks){
        Screen.titleTaskLabel.text = data.title ?? ""
        Screen.descriptionTaskLabel.text = data.description ?? ""
        Screen.dateLabel.text = "\(data.day ?? "" )/\(data.month ?? "")/\(data.year ?? "") - "
        Screen.hourLabel.text = data.time ?? ""

        switch Int(data.level ?? 0){
        case 0 :
            Screen.identifierView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.6)
        case 1:
            Screen.identifierView.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.6)
        case 2:
            Screen.identifierView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.6)
        case 3:
            Screen.identifierView.backgroundColor = UIColor.systemRed.withAlphaComponent(0.6)
        default:
            break
        }
        
    }
    
    
    
}
