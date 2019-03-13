

import Foundation
import CoreData

@objc(ManageObjectMain)
public class ManageObjectMain: NSManagedObject {
    
}

extension ManageObjectMain {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManageObjectMain> {
        return NSFetchRequest<ManageObjectMain>(entityName: "ManageObjectMain")
    }
    
    @NSManaged public var temp : NSNumber?
    @NSManaged public var pressure : NSNumber?
    @NSManaged public var humidity : NSNumber?
    @NSManaged public var temp_min : NSNumber?
    @NSManaged public var temp_max : NSNumber?
    
}


