//
//  TabBarVC.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 30/06/23.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar(){
        let Home = UINavigationController(rootViewController: HomeVC())
//        let Calendar = UINavigationController(rootViewController: WalletVC())
//        let Profile = UINavigationController(rootViewController: ProfileVC())
        
        setViewControllers([Home], animated: true)
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        tabBar.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance ()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance .backgroundColor = UIColor (red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        
        //MARK: ADD ICON AND TITLE
        
        guard let items = tabBar .items else { return }
        
        items[0].image = UIImage(systemName: "house")
        items[0].title = "Home"
//        items[1].image = UIImage(systemName: "wallet.pass")
//        items[1].title = "Wallet"
//        items[2].image = UIImage(systemName: "person.crop.circle.fill")
//        items[2].title = "Profile"
        
    }

}
