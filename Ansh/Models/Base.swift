
import Foundation
import CoreData

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}

@objc(ManageObjectBase)
public class ManageObjectBase: NSManagedObject {
    
}

extension ManageObjectBase {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManageObjectBase> {
        return NSFetchRequest<ManageObjectBase>(entityName: "ManageObjectBase")
    }
    
    enum CodingKeys: String, CodingKey {
        
        case cnt = "cnt"
        case list = "list"
    }
    
    @NSManaged public var cnt : NSNumber?
    @NSManaged public var list : NSArray?
    
}

// MARK: Generated accessors for addresses
extension ManageObjectBase {
    
    @objc(addListObject:)
    @NSManaged public func addToList(_ value: ManageObjectList)
    
    @objc(removeListObject:)
    @NSManaged public func removeFromList(_ value: ManageObjectList)
    
    @objc(addLists:)
    @NSManaged public func addToLists(_ values: NSArray)
    
    @objc(removeLists:)
    @NSManaged public func removeFromLists(_ values: NSArray)
    
}

