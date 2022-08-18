//
//  SceondController.swift
//  Chapter03-TabBar
//
//  Created by gaeng on 2022/08/18.
//

import UIKit

class SecondController: UIViewController {
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        lbl.text = "두 번째 탭"
        lbl.textColor = .red
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.sizeToFit()
        lbl.center.x = self.view.frame.width / 2
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
    }
}
