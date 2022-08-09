//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by gaeng on 2022/08/02.
//

import UIKit

class MemoFormVC: UIViewController {
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet var preview: UIImageView!
    
    var subject: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.contentTextView.delegate = self
    }
    
    @IBAction func save(_ sender: Any) {
        // 아무 내용 없을 때 얼럿 띄우고 함수 종료
        guard !self.contentTextView.text.isEmpty else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        
        // 메모 객체 데이터 생성하고 데이터를 담는다
        let data = MemoData()
        data.title = self.subject
        data.contents = self.contentTextView.text
        data.image = self.preview.image
        data.regDate = Date()
        
        // 앱 델리게이트 객체를 읽어온 다음, memoList 배열에 추가
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("AppDelegate not found")
        }
        appDelegate.memoList.append(data)
        
        // 화면 종료 후 이전 화면으로 돌아간다
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: true)
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

extension MemoFormVC: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.preview.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        picker.dismiss(animated: false)
    }
}

extension MemoFormVC: UINavigationControllerDelegate {
    
}

extension MemoFormVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        // 내용은 최대 15자리까지 읽어 subject 변수에 저장
        let contents = textView.text as NSString
        let length = (contents.length > 15) ? 15 : contents.length
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        
        self.navigationItem.title = subject
    }
}

// br delete
// y/n? yes
// => Objc lldb -> po
// expression => p po expr a = 30

// expr a = 50  lldb ) {}
