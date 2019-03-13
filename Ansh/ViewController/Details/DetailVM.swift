//
//  DetailVM.swift
//  Ansh
//
//  Created by Sujit Nachan on 13/03/19.
//  Copyright © 2019 Sujit Nachan. All rights reserved.
//

import Foundation

class DetailVM {
    
    fileprivate weak var detailVC: DetailVC!
    fileprivate var weather: ManageObjectList?
    init(vc: DetailVC) {
        detailVC = vc
        self.weather = vc.weather
    }
    
    func getWeather() -> ManageObjectList? {
        return weather
    }
    
    func setWeather(weather: ManageObjectList?) {
        self.weather = weather
    }
}
