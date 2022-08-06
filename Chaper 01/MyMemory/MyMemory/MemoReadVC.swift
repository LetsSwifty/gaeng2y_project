//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by gaeng on 2022/08/02.
//

import UIKit

class MemoReadVC: UIViewController {
    var param: MemoData?
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dateString = dateFormatter.string(from: (param?.regDate ?? Date()))
        
        self.navigationItem.title = dateString
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
