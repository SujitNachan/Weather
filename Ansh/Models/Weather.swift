

import Foundation
import CoreData

@objc(ManageObjectWeather)
public class ManageObjectWeather: NSManagedObject {
    
}

extension ManageObjectWeather {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManageObjectWeather> {
        return NSFetchRequest<ManageObjectWeather>(entityName: "ManageObjectWeather")
    }
    
    @NSManaged public var id : NSNumber?
    @NSManaged public var main : String?
    @NSManaged public var desc : String?
    @NSManaged public var icon : String?
    
}
