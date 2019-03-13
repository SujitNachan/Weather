

import Foundation
import CoreData

@objc(ManageObjectSys)
public class ManageObjectSys: NSManagedObject {
    
}

extension ManageObjectSys {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManageObjectSys> {
        return NSFetchRequest<ManageObjectSys>(entityName: "ManageObjectSys")
    }
    
    @NSManaged public var type : NSNumber?
    @NSManaged public var id : NSNumber?
    @NSManaged public var message : NSNumber?
    @NSManaged public var country : String?
    @NSManaged public var sunrise : NSNumber?
    @NSManaged public var sunset : NSNumber?
    
}
