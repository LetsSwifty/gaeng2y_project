//
//  ProfileVC.swift
//  MyMemory
//
//  Created by gaeng on 2022/09/01.
//

import UIKit

class ProfileVC: UIViewController {
    lazy var profileImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "account")
        iv.frame.size = CGSize(width: 100, height: 100)
        iv.center = CGPoint(x: view.frame.width / 2, y: 130)
        iv.layer.cornerRadius = iv.frame.width / 2
        iv.layer.masksToBounds = true
        iv.layer.borderWidth = 0
        return iv
    }()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "프로필"
        
        let backBtn = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(close(_:)))
        navigationItem.leftBarButtonItem = backBtn
        
        let bg = UIImage(named: "profile-bg")
        let bgImage = UIImageView(image: bg)
        bgImage.frame.size = CGSize(width: bgImage.frame.size.width, height: bgImage.frame.size.height)
        bgImage.center = CGPoint(x: view.frame.width, y: 270)
        bgImage.layer.cornerRadius = bgImage.frame.size.width / 2
        bgImage.layer.borderWidth = 0
        bgImage.layer.masksToBounds = true
        view.addSubview(bgImage)
        
        view.addSubview(profileImage)
        tableView = UITableView(frame: CGRect(x: 0, y: profileImage.frame.origin.y + profileImage.frame.size.height, width: view.frame.width, height: 100))
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    @objc
    func close(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
}

extension ProfileVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.font = .systemFont(ofSize: 14)
        cell.detailTextLabel?.font = .systemFont(ofSize: 13)
        cell.accessoryType = .disclosureIndicator
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "이름"
            cell.detailTextLabel?.text = "엉뚱한 갱이 씨"
        case 1:
            cell.textLabel?.text = "계정"
            cell.detailTextLabel?.text = "gaeng2y@gmail.com"
        default:
            ()
        }
        return cell
    }
}

extension ProfileVC: UITableViewDelegate {
    
}
