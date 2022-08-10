//
//  ViewController.swift
//  Chapter02-InputForm
//
//  Created by gaeng on 2022/08/10.
//

import UIKit
import Then

class ViewController: UIViewController {
    /// 이메일 레이블
    lazy var lblEmail = UILabel().then {
        $0.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        $0.text = "이메일"
        let customFont = UIFont(name: "SDMiSaeng", size: 30)
        $0.font = customFont
    }
    
    /// 자동 갱신 레이블
    lazy var lblUpdate = UILabel().then {
        $0.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        $0.text = "자동 갱신"
        $0.font = .systemFont(ofSize: 14)
    }
    
    /// 갱신 주기 레이블
    lazy var lblInterval = UILabel().then {
        $0.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        $0.text = "갱신 주기"
        $0.font = .systemFont(ofSize: 14)
    }
    
    /// 이메일 입력 UITextField
    lazy var paramEmail = UITextField().then {
        $0.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        $0.font = .systemFont(ofSize: 13)
        $0.borderStyle = .roundedRect
    }
    
    /// 자동 갱신 여부 스위치
    lazy var paramUpdate = UISwitch().then {
        $0.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        $0.setOn(true, animated: true)
        $0.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
    }
    
    /// 갱신 주기 Stepper
    lazy var paramInterval = UIStepper().then {
        $0.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        $0.minimumValue = 0
        $0.maximumValue = 100
        $0.stepValue = 1
        $0.value = 0
        $0.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
    }
    
    /// paramUpdate value 표시해 줄 레이블
    lazy var txtUpdate = UILabel().then {
        $0.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .red
        $0.text = "갱신함"
    }
    
    /// paramInterval value 표시해 줄 레이블
    lazy var txtInterval = UILabel().then {
        $0.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .red
        $0.text = "0분마다"
    }
    
    /// 입력값 전달용 barButton
    lazy var submitBtn: UIBarButtonItem = {
        let barBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        return barBtn
    }()
    
    // MARK: - ♻️ Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "설정"
        navigationItem.rightBarButtonItem = submitBtn
        [lblEmail, lblUpdate, lblInterval, paramEmail, paramUpdate, paramInterval, txtUpdate, txtInterval].forEach {
            self.view.addSubview($0)
        }
    }
}

// MARK: - @objc
extension ViewController {
    /// paramUpdate와 인터랙션할 메소드
    /// - Parameter sender: self.paramUpdate
    @objc
    func presentUpdateValue(_ sender: UISwitch) {
        txtUpdate.text = (sender.isOn ? "갱신함" : "갱신하지 않음")
    }
    
    /// paramInterval과 인터랙션할 메소드
    /// - Parameter sender: self.paramInterval
    @objc
    func presentIntervalValue(_ sender: UIStepper) {
        txtInterval.text = "\(Int(sender.value)) 분마다"
    }
    
    /// submitBtn과 상호작용할 메소드
    /// - Parameter sender: submitBtn
    @objc
    func submit(_ sender: Any) {
        let rvc = ReadViewController()
        rvc.pEmail = paramEmail.text
        rvc.pUpdate = paramUpdate.isOn
        rvc.pInterval = paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}
