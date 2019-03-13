//
//  AppHelper.swift
//  Ansh
//
//  Created by Sujit Nachan on 13/03/19.
//  Copyright © 2019 Sujit Nachan. All rights reserved.
//

import Foundation

class AppHelper {
    
    class func getAPIKey() -> String {
        return "be1abcb5a58d1a1cabf9bde1f7326fc7"
    }
    
    class func getBaseUrl() -> String {
        return "https://api.openweathermap.org/data/2.5/group?"
    }
    
    class func apiGroupUrlString() -> String {
        return AppHelper.getBaseUrl() + "id=4163971,2147714,2174003&units=metric&appid="
    }
    
    class func finalUrlString() -> String {
        return AppHelper.apiGroupUrlString() + getAPIKey()
    }

}
