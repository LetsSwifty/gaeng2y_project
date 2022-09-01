//
//  MenuVC.swift
//  MyMemory
//
//  Created by gaeng on 2022/09/01.
//

import UIKit

class MenuVC: UITableViewController {
    let titles = ["새 글 작성하기",
                  "친구 새 글",
                  "달력으로 보기",
                  "공지사항",
                  "통계",
                  "계정 관리"]
    
    let icons = ["icon01",
                 "icon02",
                 "icon03",
                 "icon04",
                 "icon05",
                 "icon06",]
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 70, y: 15, width: 150, height: 30))
        label.text = "엉뚱한 갱이 씨"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 15)
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 70, y: 30, width: 150, height: 30))
        label.text = "gaeng2y@gmail.com"
        label.textColor = .white
        label.font = .systemFont(ofSize: 11)
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var profileImage: UIImageView = {
        let defaultImage = UIImage(named: "account")
        let iv = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        iv.image = defaultImage
        iv.layer.cornerRadius = iv.frame.width / 2
        iv.layer.borderWidth = 0
        iv.layer.masksToBounds = true
        return iv
    }()
    
    // MARK: ------- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
        headerView.backgroundColor = .brown
        tableView.tableHeaderView = headerView
        
        headerView.addSubview(nameLabel)
        headerView.addSubview(emailLabel)
        headerView.addSubview(profileImage)
    }
}

// MARK: -------- UITableViewDataSource
extension MenuVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        cell.imageView?.image = UIImage(named: icons[row])
        cell.textLabel?.text = titles[row]
        cell.textLabel?.font = .systemFont(ofSize: 14)
        return cell
    }
}

// MARK: -------- UITableViewDelegate
extension MenuVC {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "showMemoForm", sender: nil)
        } else if indexPath.row == 5 {
            let uv = storyboard?.instantiateViewController(withIdentifier: "_Profile")
            uv?.modalPresentationStyle = .fullScreen
            present(uv!, animated: true)
        }
    }
}
