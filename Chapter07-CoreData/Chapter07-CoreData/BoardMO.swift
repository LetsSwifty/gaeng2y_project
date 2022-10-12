//
//  BoardMO.swift
//  Chapter07-CoreData
//
//  Created by gaeng on 2022/10/09.
//

import Foundation
import CoreData

@objc(BoardMO)
public class BoardMO: NSManagedObject {
    @nonobjc public class func fetchRequesT() -> NSFetchRequest<BoardMO> {
        return NSFetchRequest<BoardMO>(entityName: "Board")
    }
    
    @NSManaged public var contents: String?
    @NSManaged public var regdate: NSDate?
    @NSManaged public var title: String?
    @NSManaged public var logs: NSOrderedSet?
    
    @objc(addLogsObject:)
    @NSManaged public func addToLogs(_ value: LogMO)
    
    @objc(removeLogsObject:)
    @NSManaged public func removeFromLogs(_ value: LogMO)
    
    @objc(addLogs:)
    @NSManaged public func addToLogs(_ value: NSSet)
    
    @objc(removeLogs:)
    @NSManaged public func removeFromLogs(_ value: NSSet)
}
