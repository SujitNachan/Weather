//
//  DatabaseManager.swift
//  Ansh
//
//  Created by Sujit Nachan on 13/03/19.
//  Copyright © 2019 Sujit Nachan. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class DatabaseManager {
    
    
    var manageObjectBase: ManageObjectBase!
    static let sharadInstance = DatabaseManager()
    private init() {
        
    }
    
    class var managedContext:NSManagedObjectContext {
        let appDelegate:AppDelegate =  (UIApplication.shared.delegate as? AppDelegate)!
        return appDelegate.persistentContainer.viewContext
    }
    
    class func getEntitesForEntityName(_ entityName: String, sortindId sortingKey: String) -> Array<Any> {
        var object: [Any] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        fetchRequest.returnsObjectsAsFaults = false
        let sortDescriptior:NSSortDescriptor = NSSortDescriptor(key: sortingKey, ascending: true)
        fetchRequest.sortDescriptors?.append(sortDescriptior)
        
        do {
            object = try managedContext.fetch(fetchRequest)
        } catch let error as NSError  {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return object
    }
    
    
    class func getEntitesForEntityName(_ entityName: String, sortindId sortingKey: String,ascending:Bool) -> Array<Any> {
        var object: [Any] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        fetchRequest.returnsObjectsAsFaults = false
        let sortDescriptior:NSSortDescriptor = NSSortDescriptor(key: sortingKey, ascending: ascending)
        fetchRequest.sortDescriptors = [sortDescriptior]
        
        do {
            object = try managedContext.fetch(fetchRequest)
        } catch let error as NSError  {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return object
    }
    
    
    class func deleteAllEntitiesForEntityName(name:String){
        let fetechRequest = NSFetchRequest<NSManagedObject>(entityName:name)
        do{
            let requestObject = try  managedContext.fetch(fetechRequest)
            
            for object:NSManagedObject in requestObject{
                managedContext.delete(object)
            }
        }catch let error as NSError{
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    
    class func deleteEntitieForEntity(name:String,field_name:String,field_id:Int){
        let fetechRequest = NSFetchRequest<NSManagedObject>(entityName:name)
        fetechRequest.predicate = NSPredicate(format: "\(field_name) = %@", "\(field_id)")
        do{
            let requestObject = try  managedContext.fetch(fetechRequest)
            
            for object:NSManagedObject in requestObject{
                managedContext.delete(object)
            }
        }catch let error as NSError{
            print("Could not delete. \(error), \(error.userInfo)")
            
        }
    }
    
    class func updateEntitieForEntity(updateObject:NSManagedObject,name:String,field_name:String,field_id:Int){
        let fetechRequest = NSFetchRequest<NSManagedObject>(entityName:name)
        fetechRequest.predicate = NSPredicate(format: "\(field_name) == %d", field_id)
        do{
            let requestObject = try  managedContext.fetch(fetechRequest)
            
            if requestObject.count == 1
            {
                var object = updateObject
                do{
                    try managedContext.save()
                }
                catch
                {
                    print("Could not update. \(error), \(error.localizedDescription)")
                }
            }
        }catch let error as NSError{
            print("Could not update . \(error), \(error.userInfo)")
            
        }
    }
    
    class func getEntitesForEntityName(name:String, withPredicate:NSPredicate) -> [Any]{
        var object: [Any] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: name)
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = withPredicate
        
        do{
            object = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return object
    }
    
    class func getEntitesForEntityName(fetchRequest:NSFetchRequest<NSManagedObject>) -> [Any]{
        var object: [Any] = []
        
        do{
            object = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return object
    }
    
    class func getEntitesForEntityName(name:String) -> [Any]{
        var object: [Any] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: name)
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            object = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print("Could not modify. \(error), \(error.userInfo)")
        }
        return object
    }
    
    class func getEntitesForEntityName(name:String,filter:Any) -> [Any]{
        var object: [Any] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: name)
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            object = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print("Could not modify. \(error), \(error.userInfo)")
        }
        return object
    }
    
    class func saveDbContext(){
        let managedContext = DatabaseManager.managedContext
        do {
            try managedContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func saveBaseEntity(data:[String:Any]){
        DatabaseManager.deleteAllEntitiesForEntityName(name: "ManageObjectBase")
        self.manageObjectBase = NSEntityDescription.insertNewObject(forEntityName: "ManageObjectBase", into: DatabaseManager.managedContext) as? ManageObjectBase
        manageObjectBase.cnt = data["cnt"] as? NSNumber
        if let list = data["list"] as? [[String:Any]] {
            saveListEntity(data: list)
        }else{
            DatabaseManager.saveDbContext()
        }
    }
    
    private func saveListEntity(data:[[String:Any]]){
        for listDic in data {
            guard let list = NSEntityDescription.insertNewObject(forEntityName: "ManageObjectList", into: DatabaseManager.managedContext) as? ManageObjectList else{
                return
            }
            list.id = listDic["id"] as? NSNumber
            list.dt = listDic["dt"] as? NSNumber
            list.name = listDic["name"] as? String
            list.visibility = listDic["visibility"] as? NSNumber
            
            if let coordinate = listDic["coord"] as? [String:Any] {
                list.coord = getCoordEntity(data: coordinate)
            }
            
            if let weather = listDic["weather"] as? [[String:Any]] {
                list.weather = getWeatherEntity(data: weather.last!)
            }
            
            if let sys = listDic["sys"] as? [String:Any] {
                list.sys = getSysEntity(data: sys)
            }
            
            if let main = listDic["main"] as? [String:Any] {
                list.main = getMainEntity(data: main)
            }
            self.manageObjectBase.addToList(list)
            
        }
        DatabaseManager.saveDbContext()
    }
    
    private func getSysEntity(data:[String:Any]) -> ManageObjectSys? {
        guard let sys = NSEntityDescription.insertNewObject(forEntityName: "ManageObjectSys", into: DatabaseManager.managedContext) as? ManageObjectSys else{
            return nil
        }
        sys.id = data["id"] as? NSNumber
        sys.type = data["type"] as? NSNumber
        sys.country = data["country"] as? String
        sys.sunrise = data["sunrise"] as? NSNumber
        sys.sunset = data["sunset"] as? NSNumber
        sys.message = data["message"] as? NSNumber
        return sys
    }
    
    private func getCoordEntity(data:[String:Any]) -> ManageObjectCoord? {
        guard let coord = NSEntityDescription.insertNewObject(forEntityName: "ManageObjectCoord", into: DatabaseManager.managedContext) as? ManageObjectCoord else{
            return nil
        }
        coord.lat = data["lat"] as? NSNumber
        coord.lon = data["lon"] as? NSNumber
        return coord
    }
    
    private func getWeatherEntity(data:[String:Any]) -> ManageObjectWeather? {
        guard let weather = NSEntityDescription.insertNewObject(forEntityName: "ManageObjectWeather", into: DatabaseManager.managedContext) as? ManageObjectWeather else{
            return nil
        }
        weather.id = data["id"] as? NSNumber
        weather.icon = data["icon"] as? String
        weather.main = data["main"] as? String
        weather.desc = data["description"] as? String
        return weather
    }
    
    private func getMainEntity(data:[String:Any]) -> ManageObjectMain? {
        guard let main = NSEntityDescription.insertNewObject(forEntityName: "ManageObjectMain", into: DatabaseManager.managedContext) as? ManageObjectMain else{
            return nil
        }
        main.humidity = data["humidity"] as? NSNumber
        main.temp = data["temp"] as? NSNumber
        main.pressure = data["pressure"] as? NSNumber
        main.temp_max = data["temp_max"] as? NSNumber
        main.temp_min = data["temp_min"] as? NSNumber
        return main
    }
    
}
