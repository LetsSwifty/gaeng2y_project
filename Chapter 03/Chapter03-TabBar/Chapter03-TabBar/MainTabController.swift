//
//  ViewController.swift
//  Chapter03-TabBar
//
//  Created by gaeng on 2022/08/18.
//

import UIKit

class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBar.tintColor = .white
        tabBar.backgroundImage = UIImage(named: "menubar-bg-mini")
        
        let tabBarItemProxy = UITabBarItem.appearance()
        tabBarItemProxy.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .disabled)
        tabBarItemProxy.setTitleTextAttributes([.foregroundColor: UIColor.red], for: .selected)
        tabBarItemProxy.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 15)], for: .normal)
        
        let first = setNavigationController(unselected: UIImage(named: "designbump")?.withRenderingMode(.alwaysOriginal), title: "calendar", root: FirstController())
        let second = setNavigationController(unselected: UIImage(named: "rss")?.withRenderingMode(.alwaysOriginal), title: "file", root: SecondController())
        let third = setNavigationController(unselected: UIImage(named: "facebook")?.withRenderingMode(.alwaysOriginal), title: "photo", root: ThirdController())
        viewControllers = [first, second, third]
        viewControllers?.forEach {
            $0.tabBarItem.selectedImage = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
        }
    }

    func setNavigationController(unselected: UIImage?, title: String, root: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: root)
        nav.tabBarItem.image = unselected
        nav.tabBarItem.title = title
        return nav
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBar
//        tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
        UIView.animate(withDuration: TimeInterval(0.15)) {
            tabBar.alpha = tabBar.alpha == 0 ? 1 : 0
        }
    }
}

