//
//  HomeScreen.swift
//  MessageAppBackFront
//
//  Created by Sergio Silva Macedo on 24/06/23.
//

import UIKit


protocol navViewProtocol: AnyObject{
    func TappedFilterButton()
    func tappedAddButton()
}


class NavView: UIView {
    
    weak var delegate :navViewProtocol?
    
    public func delegate(delegate : navViewProtocol?){
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
    
    lazy var searchBar : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.setShadow()
        return view
    }()
    
    lazy var searchTextField : UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.placeholder = "Filtre por aqui"
        sb.searchTextField.font = UIFont.systemFont(ofSize: 16)
        sb.searchTextField.backgroundColor = .white
        return sb
    }()
    
    lazy var filterButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(TappedFilterButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var AddButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
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
    
    @objc func TappedFilterButton(){
        delegate?.TappedFilterButton()
    }
    
    @objc func tappedAddButton(){
        delegate?.tappedAddButton()
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
        navBar.addSubview(searchBar)
        navBar.addSubview(filterButton)
        navBar.addSubview(AddButton)
        searchBar.addSubview(searchTextField)

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
            
            searchBar.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 30),
            searchBar.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 55),
            searchBar.widthAnchor.constraint(equalToConstant: 200),
            
            searchTextField.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            searchTextField.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            searchTextField.topAnchor.constraint(equalTo: searchBar.topAnchor),
            
            filterButton.topAnchor.constraint(equalTo: AddButton.topAnchor),
            filterButton.leadingAnchor.constraint(equalTo: AddButton.trailingAnchor, constant: 10),
            filterButton.heightAnchor.constraint(equalToConstant: 50),
            filterButton.widthAnchor.constraint(equalToConstant: 50),
             
            AddButton.topAnchor.constraint(equalTo: searchBar.topAnchor),
            AddButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 20),
            AddButton.heightAnchor.constraint(equalToConstant: 50),
            AddButton.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}
