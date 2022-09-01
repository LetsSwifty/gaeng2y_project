//
//  MenuViewController.swift
//  Chapter04-SideBar
//
//  Created by gaeng on 2022/08/30.
//

import UIKit

class MenuViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // 1. 계정 정보 표시할 레이블 객체 생성
        let accountLabel = UILabel(frame: CGRect(x: 10, y: 30, width: view.frame.width, height: 30))
        accountLabel.text = "gaeng2y@gmail.com"
        accountLabel.textColor = .white
        accountLabel.font = .boldSystemFont(ofSize: 15)
        
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 70)
        v.backgroundColor = .brown
        v.addSubview(accountLabel)
        
        tableView.tableHeaderView = v
    }
}

// MARK: - UITableViewDataSoruce
extension MenuViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = UIImage(named: "icon0\(indexPath.row + 1)")
        cell.textLabel?.text = "메뉴 0\(indexPath.row + 1)"
        return cell
    }
}
