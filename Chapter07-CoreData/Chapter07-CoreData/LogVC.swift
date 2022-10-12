//
//  LogVC.swift
//  Chapter07-CoreData
//
//  Created by gaeng on 2022/10/09.
//

import UIKit

class LogVC: UITableViewController {
    
}

public enum LogType: Int16 {
    case create = 0
    case edit
    case delete
}

extension Int16 {
    func toLogType() -> String {
        switch self {
        case 0: return "생성"
        case 1: return "수정"
        case 2: return "삭제"
        default: return ""
        }
    }
}
