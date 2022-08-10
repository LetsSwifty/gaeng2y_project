//
//  ViewController.swift
//  Chapter02-Button
//
//  Created by gaeng on 2022/08/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let btn: UIButton = {
            let b = UIButton(type: .system)
            b.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
            b.setTitle("테스트 버튼", for: .normal)
            // 버튼 수평 중앙 정렬 (self.view.frame.size.width / 2)
            // 수직 중앙 정렬 (self.view.frame.size.height / 2)
            b.center = CGPoint(x: self.view.frame.size.width / 2, y: 100) // 요놈은 frame 설정 구문보다 아래에 있어야함
            b.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
            return b
        }()
        view.addSubview(btn)
    }

    @objc
    func btnOnClick(_ sender: Any) {
        // 하나의 메소드를 여러 객체에서 호출할 때는 sender를 Any / AnyObject 타입으로 하면 좋다
        if let btn = sender as? UIButton {
            btn.setTitle("클릭되었슴다", for: .normal)
        }
    }
}

