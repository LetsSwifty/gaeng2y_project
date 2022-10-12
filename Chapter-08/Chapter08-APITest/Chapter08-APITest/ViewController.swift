//
//  ViewController.swift
//  Chapter08-APITest
//
//  Created by gaeng on 2022/10/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var userId: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var responseView: UITextView!
    
    @IBAction func callCurrentTime(_ sender: Any) {
        do {
            let url = URL(string: "https://swiftapi.rubypaper.co.kr:2029/practice/currentTime")
            
            let response = try String(contentsOf: url!)
            
            self.currentTime.text = response
            self.currentTime.sizeToFit()
        } catch let e as NSError {
            print(e.localizedDescription)
        }
    }
    
    @IBAction func post(_ sender: Any) {
        let userId = (self.userId.text)!
        let name = (self.name.text)!
//        let param = "userId=\(userId)&name=\(name)"
//        let paramData = param.data(using: .utf8)
        let param = ["userId": userId,
                     "name": name]
        let paramData = try! JSONSerialization.data(withJSONObject: param,
                                                    options: [])
        
        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practive/echoJSON")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData.count), forHTTPHeaderField: "Content-Length")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let e = error {
                NSLog("An error has occurred : \(e.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!,
                                                                  options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    
                    let result = jsonObject["result"] as? String
                    let timestamp = jsonObject["timestamp"] as? String
                    let userId = jsonObject["userId"] as? String
                    let name = jsonObject["name"] as? String
                    
                    if result == "SUCCESS" {
                        self.responseView.text = "아이디: \(userId!) + \n"
                                                + "이름: \(name!) + \n"
                                                + "응답결과: \(result!) + \n"
                                                + "응답시간: \(timestamp!) + \n"
                                                + "요청방식: x-www-form-urlencoded"
                    }
                } catch let e as NSError {
                    print("JSON 파싱 실패: \(e.localizedDescription)")
                }
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

