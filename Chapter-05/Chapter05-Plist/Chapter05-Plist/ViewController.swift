//
//  ViewController.swift
//  Chapter05-Plist
//
//  Created by gaeng on 2022/09/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let plist = UserDefaults.standard
        plist.set("홍길동", forKey: "이름")
        plist.set(24, forKey: "나이")
        plist.set("남", forKey: "성별")
        plist.synchronize()
        
        let name = plist.string(forKey: "이름") // String 타입으로 반환
        let age = plist.integer(forKey: "나이") // Int 타입으로 반환
        let sex = plist.object(forKey: "성별") as? NSString // Any → NSString으로 캐스팅
    }


}

