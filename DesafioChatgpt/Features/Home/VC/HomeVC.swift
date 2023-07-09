//
//  ViewController.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 29/06/23.
//

import UIKit


class HomeVC: UIViewController {
    
    private var Screen : HomeScreen?
    private var ViewModel : HomeViewModel = HomeViewModel()
    private var alert : Alert?
    private var change : Bool = true
    
    override func viewWillAppear(_ animated: Bool) {
        if change{
            reloadData()
        }
    }
    
    override func loadView() {
        Screen = HomeScreen()
        view = Screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        Screen?.configButtonNavBar(delegate: self)
        ViewModel.delegate(delegate: self)
        Screen?.navView.searchTextField.delegate = self
        Screen?.configTableView(delegate: self, datasource: self)
        alert = Alert(controller: self)
    }
    
    public func changed(_ type : Bool){
        self.change = type
    }
    
    public func reloadData(){
        ViewModel.reloadToDoList()
    }
}

extension HomeVC: HomeViewModelProtocol {
    

    func sucess() {
        Screen?.reloadTableView()
    }
    
    func failure() {
        
    }
}

extension HomeVC: navViewProtocol {
    
    func TappedFilterButton() {
        alert?.showFilterAlert(){result in
            switch result {
            case .Date:
                self.ViewModel.filterforDate()
                self.Screen?.reloadTableView()
                self.ViewModel.setFilterMode(filterMode: .Date)
            case .Level:
                self.ViewModel.setFilterMode(filterMode: .Level)
                self.ViewModel.filterforLevel()
                self.Screen?.reloadTableView()
            }
        }
    }
    
    func tappedAddButton() {
        let vc = CreateTaskVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ViewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoLlistTableViewCell.identifier, for: indexPath) as? ToDoLlistTableViewCell
        cell?.setupCell(data: ViewModel.loadCurrentTask(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Screen?.tableView.beginUpdates()
            ViewModel.deleteCurrentTask(indexPath: indexPath)
            Screen?.tableView.deleteRows(at: [indexPath], with: .fade)
            Screen?.tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TaskDetailsVC(data: ViewModel.loadCurrentTask(indexPath: indexPath))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC : UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = Screen?.navView.searchTextField.text ?? " "
        ViewModel.filterforText(text)
        Screen?.reloadTableView()
    }

}

