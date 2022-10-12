//
//  LogMO.swift
//  Chapter07-CoreData
//
//  Created by gaeng on 2022/10/09.
//

import Foundation
import CoreData

@objc(LogMO)
public class LogMO: NSManagedObject {
    @nonobjc public class func fetchRequesT() -> NSFetchRequest<LogMO> {
        return NSFetchRequest<LogMO>(entityName: "Log")
    }
    
    @NSManaged public var regdate: NSDate?
    @NSManaged public var type: Int16
    @NSManaged public var board: BoardMO?
}
