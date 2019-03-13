

import Foundation
import CoreData

@objc(ManageObjectList)
public class ManageObjectList: NSManagedObject {
    
}

extension ManageObjectList {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManageObjectList> {
        return NSFetchRequest<ManageObjectList>(entityName: "ManageObjectList")
    }
    
    
    @NSManaged public var coord : ManageObjectCoord?
    @NSManaged public var sys : ManageObjectSys?
    @NSManaged public var weather : ManageObjectWeather?
    @NSManaged public var main : ManageObjectMain?
    @NSManaged public var visibility : NSNumber?
    @NSManaged public var dt : NSNumber?
    @NSManaged public var id : NSNumber?
    @NSManaged public var name : String?
    
}
