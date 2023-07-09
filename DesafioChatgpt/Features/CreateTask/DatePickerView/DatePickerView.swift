//
//  HomeScreen.swift
//  MessageAppBackFront
//
//  Created by Sergio Silva Macedo on 24/06/23.
//

import UIKit



class DatePickerView: UIView {
    

    lazy var navBackGroundView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var datePicker : UIDatePicker = {
        let date = UIDatePicker()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.datePickerMode = .dateAndTime
        date.calendar.timeZone = .autoupdatingCurrent
        date.calendar.locale = Locale(identifier: "pt-BR")
        date.preferredDatePickerStyle = .wheels
        return date
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
        addSubview(navBackGroundView)
        navBackGroundView.addSubview(datePicker)

    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            
            navBackGroundView.topAnchor.constraint(equalTo: topAnchor),
            navBackGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBackGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBackGroundView.bottomAnchor.constraint(equalTo: bottomAnchor),

            datePicker.topAnchor.constraint(equalTo: topAnchor),
            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            datePicker.bottomAnchor.constraint(equalTo: bottomAnchor),
           
        ])
    }
    
}
