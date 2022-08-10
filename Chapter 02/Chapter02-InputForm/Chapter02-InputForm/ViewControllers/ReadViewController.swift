//
//  ReadViewController.swift
//  Chapter02-InputForm
//
//  Created by gaeng on 2022/08/10.
//

import UIKit
import Then

class ReadViewController: UIViewController {
    // 멤버 프로퍼티 추가
    var pEmail: String?
    var pUpdate: Bool?
    var pInterval: Double?
    
    // 레이블 객체
    lazy var email = UILabel().then {
        $0.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        $0.text = "전달받은 이메일: \(self.pEmail ?? "")"
    }
    
    lazy var update = UILabel().then {
        $0.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        $0.text = "업데이트 여부: \((self.pUpdate ?? false) ? "업데이트 함" : "업데이트 안 함")"
    }
    
    lazy var interval = UILabel().then {
        $0.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        let updateInterval = Int(self.pInterval ?? 0.0)
        $0.text = "업데이트 주기: \(updateInterval)분마다"
    }
    
    // MARK: - ♻️ Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [email, update, interval].forEach {
            self.view.addSubview($0)
        }
    }
}
