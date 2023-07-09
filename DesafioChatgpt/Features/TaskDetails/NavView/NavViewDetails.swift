//
//  HomeScreen.swift
//  MessageAppBackFront
//
//  Created by Sergio Silva Macedo on 24/06/23.
//

import UIKit


protocol NavViewDetailsProtocol: AnyObject{
    func tappedEditButton()
    func acceptChangesButton()
    func tappedBackButton()
    func tappedRejectButton()
}


class NavViewDetails: UIView {
    
    weak var delegate :NavViewDetailsProtocol?
    
    public func delegate(delegate : NavViewDetailsProtocol?){
        self.delegate = delegate
    }
    
    lazy var navBackGroundView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var navBar : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var backButton : UIButton = {
        let btn = UIButton(type: .close)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var editingButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "pencil")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .black
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(tappedEditButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var acceptButton : UIButton = {
        let btn = UIButton(type: .contactAdd)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "checkmark")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .black
        btn.isHidden = true
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(tappedAcceptButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var rejectButton : UIButton = {
        let btn = UIButton(type: .contactAdd)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .black
        btn.isHidden = true
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(tappedRejectButton), for: .touchUpInside)
        return btn
    }()
    
    let stackButton : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    @objc func tappedAcceptButton(){
        self.delegate?.acceptChangesButton()
    }
    
    @objc func tappedEditButton(){
        self.delegate?.tappedEditButton()
    }
    
    @objc func tappedBackButton(){
        self.delegate?.tappedBackButton()
    }
    
    @objc func tappedRejectButton(){
        self.delegate?.tappedRejectButton()
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
        addSubview(navBackGroundView)
        navBackGroundView.addSubview(navBar)
        navBar.addSubview(backButton)
        navBar.addSubview(editingButton)
        navBar.addSubview(rejectButton)
        navBar.addSubview(acceptButton)
        
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            
            navBackGroundView.topAnchor.constraint(equalTo: topAnchor),
            navBackGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBackGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBackGroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            navBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            
            acceptButton.topAnchor.constraint(equalTo: backButton.topAnchor),
            acceptButton.trailingAnchor.constraint(equalTo: editingButton.leadingAnchor),
            acceptButton.heightAnchor.constraint(equalToConstant: 50),
            acceptButton.widthAnchor.constraint(equalToConstant: 50),
            
            editingButton.topAnchor.constraint(equalTo: backButton.topAnchor),
            editingButton.leadingAnchor.constraint(equalTo: acceptButton.trailingAnchor, constant: 5),
            editingButton.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -10),
            editingButton.heightAnchor.constraint(equalToConstant: 50),
            editingButton.widthAnchor.constraint(equalToConstant: 50),
            
            rejectButton.topAnchor.constraint(equalTo: editingButton.topAnchor),
            rejectButton.leadingAnchor.constraint(equalTo: editingButton.leadingAnchor),
            rejectButton.trailingAnchor.constraint(equalTo: editingButton.trailingAnchor),
            rejectButton.heightAnchor.constraint(equalToConstant: 50),
            rejectButton.widthAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
}
