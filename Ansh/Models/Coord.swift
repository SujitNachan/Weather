
import Foundation
import CoreData

@objc(ManageObjectCoord)
public class ManageObjectCoord: NSManagedObject {
    
}

extension ManageObjectCoord {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManageObjectCoord> {
        return NSFetchRequest<ManageObjectCoord>(entityName: "ManageObjectCoord")
    }
    
    @NSManaged public var lon : NSNumber?
    @NSManaged public var lat : NSNumber?
    
}
