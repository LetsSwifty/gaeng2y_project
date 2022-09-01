//
//  ViewController.swift
//  Chapter04-SideBar
//
//  Created by gaeng on 2022/08/30.
//

import UIKit
import SideMenu

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "첫 화면"
        setSideMenu()
    }
    
    private func setSideMenu() {
        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: navigationController!.view)
        
        let menuVC = SideMenuManager.default.leftMenuNavigationController
        menuVC?.presentationStyle = .menuSlideIn
    }
}

