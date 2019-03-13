//
//  HomeVM.swift
//  Ansh
//
//  Created by Sujit Nachan on 13/03/19.
//  Copyright © 2019 Sujit Nachan. All rights reserved.
//

import Foundation

class HomeVM {
    
    fileprivate weak var homeVC: HomeTableViewController!
    fileprivate var service = Service()
    fileprivate var base: ManageObjectBase?
    init(vc: HomeTableViewController) {
        homeVC = vc
        service.delegate = self
        base = DatabaseManager.getEntitesForEntityName(name: "ManageObjectBase").last as? ManageObjectBase
    }
    
    func fetchData() {
        if base == nil {
            homeVC.showLoading()
            service.getData()
        }
    }
    
   @objc func refreshData() {
        homeVC.showLoading()
        service.getData()
    }
    
    func numberOfRow() -> Int {
        if let base = base,
            let number = base.cnt{
            return Int(number)
        }
        return 0
    }
    
    func getObject(atIndex index: Int) -> (name: String?, temp: Double?) {
        if let array = base?.list?.sortedArray(using: [NSSortDescriptor(key: "id", ascending: true)]) {
            for (i,object) in array.enumerated() {
                if index == i {
                    return ((object as! ManageObjectList).name,(object as! ManageObjectList).main?.temp as? Double)
                }
            }
        }
        return (nil,nil)
    }
    
    func getObject(atIndex index: Int) -> ManageObjectList? {
        if let array = base?.list?.sortedArray(using: [NSSortDescriptor(key: "id", ascending: true)]) {
            for (i,object) in array.enumerated() {
                if index == i {
                    return object as? ManageObjectList
                }
            }
        }
        return nil
    }
}

extension HomeVM: ServiceDelegate {
    func didSaveData() {
        homeVC.hideLoading()
        self.base = DatabaseManager.getEntitesForEntityName(name: "ManageObjectBase").last as? ManageObjectBase
        homeVC.tableView.reloadData()
    }
    
    
    func didGetError(message: String?) {
        homeVC.hideLoading()
        homeVC.showError(message: message ?? "error")
    }
    
}
