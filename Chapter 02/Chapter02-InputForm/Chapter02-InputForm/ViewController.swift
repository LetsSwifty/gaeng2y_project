//
//  ViewController.swift
//  Chapter02-InputForm
//
//  Created by gaeng on 2022/08/10.
//

import UIKit

class ViewController: UIViewController {
    // TODO: - 시간나면 then 써서 바꿔보기 🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨
    /// 이메일 레이블
    lazy var lblEmail: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        lbl.text = "이메일"
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    /// 자동 갱신 레이블
    lazy var lblUpdate: UILabel = {
       let lbl = UILabel()
        lbl.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lbl.text = "자동 갱신"
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    /// 갱신 주기 레이블
    lazy var lblInterval: UILabel = {
       let lbl = UILabel()
        lbl.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lbl.text = "갱신 주기"
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    /// 이메일 입력 UITextField
    lazy var paramEmail: UITextField = {
        let tf = UITextField()
        tf.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        tf.font = .systemFont(ofSize: 13)
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    /// 자동 갱신 여부 스위치
    lazy var paramUpdate: UISwitch = {
        let updateSwitch = UISwitch()
        updateSwitch.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        updateSwitch.setOn(true, animated: true)
        updateSwitch.addTarget(self, action: presentUpdateValue(_:), for: .valueChanged)
        return updateSwitch
    }()
    
    /// 갱신 주기 Stepper
    lazy var paramInterval: UIStepper = {
        let stepper = UIStepper()
        stepper.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.stepValue = 1
        stepper.value = 0
        stepper.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        return stepper
    }()
    
    /// paramUpdate value 표시해 줄 레이블
    lazy var txtUpdate: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .red
        lbl.text = "갱신함"
        return lbl
    }()
    
    /// paramInterval value 표시해 줄 레이블
    lazy var txtInterval: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .red
        lbl.text = "0분마다"
        return lbl
    }()
    
    // MARK: - ♻️ Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "설정"
        
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
    @objc func presentIntervalValue(_ sender: UIStepper) {
        txtInterval.text = "\(Int(sender.value)) 분마다"
    }
}
