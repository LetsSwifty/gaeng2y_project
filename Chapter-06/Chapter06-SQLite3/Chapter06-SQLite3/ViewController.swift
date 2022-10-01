//
//  ViewController.swift
//  Chapter06-SQLite3
//
//  Created by gaeng on 2022/10/01.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var db: OpaquePointer? = nil    // SQLite 연결 정보를 담을 객체
        var stmt: OpaquePointer? = nil  // 컴파일된 SQL을 담을 객체
        
        let fileMgr = FileManager()     // 파일 매니저 객체 생성
        let docPathURL = fileMgr.urls(for: .documentDirectory,
                                      in: .userDomainMask).first!   // 생성된 매니저 객체를 사용하여 앱 내의 문서 디렉토리 경로를 찾고, 이를 URL 객체로 생성
        let dbPath = docPathURL.appending(component: "db.sqlite").path  // URL 객체에 "db.sqlite" 파일 경로를 추가한 SQLite3 데이터베이스 경로를 만들어낸다
        
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"
        
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            // sql 구문을 전달할 준비, 컴파일된 SQL 구문 객체가 생성된다
            if sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK {
                if sqlite3_step(stmt) == SQLITE_DONE {
                    print("Create Table Success")
                }
                sqlite3_finalize(stmt)
            } else {
                print("Prepare Statement Fail")
            }
            
            sqlite3_close(db)
        } else {
            print("Database Connect Fail")
            return
        }
        
        
        
        /*
        C 기반의 함수에서 결과값을 인자값에 담아 전달하는 것은 대부분 함수가 반환해야 할 값이 따로 있어서인 경우가 많다
        sqlite3_open() 함수는 반환값으로 처리 결과, 즉 성공/실패/오류 등을 반환한다
         
        sqlite3_open() 함수의 인자값을 통해 sqlite3 객체를 전달받아야 한다
        그런데 이를 전달받기 위해 사용한 self.db 인자값의 형식이 다소 특이하다
         일반 인자값 형태가 아니라 & 연산자이다
         이것은 인자값을 참조 방식으로 전달하기 위한 연산자로, 이른바 레퍼런스 전달이라고 부르는 방식이다
         
         근데 왜 참조 방식으로 넘김?
         
         OpaquePointer가 구조체이기 때문이다
         
         인자값으로 사용될 때 항상 참조 형태로 전달되는 클래스와 달리 구조체는 복사에 의해 전달된다
         
        */
    }


}

