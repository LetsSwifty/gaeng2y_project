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
        menuVC?.statusBarEndAlpha = 0
    }
}


extension ViewController: SideMenuNavigationControllerDelegate {

    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Appearing! (animated: \(animated))")
    }

    func sideMenuDidAppear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Appeared! (animated: \(animated))")
    }

    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappearing! (animated: \(animated))")
    }

    func sideMenuDidDisappear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappeared! (animated: \(animated))")
    }
}
