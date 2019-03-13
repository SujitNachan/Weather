//
//  Service.swift
//  Ansh
//
//  Created by Sujit Nachan on 13/03/19.
//  Copyright © 2019 Sujit Nachan. All rights reserved.
//

import Foundation
import Alamofire


protocol ServiceDelegate: class {
    func didSaveData()
    func didGetError(message: String?)
}

class Service {
    weak var delegate                       : ServiceDelegate?
    
    func getData() {
        let req = Alamofire.request(
            AppHelper.finalUrlString(),
            method: .get,
            parameters: nil,
            encoding: URLEncoding.methodDependent,
            headers: nil
            ).validate().responseJSON { response in
                switch response.result {
                case .success(_):
                    if let data = response.result.value as? [String:Any] {
                        DatabaseManager.sharadInstance.saveBaseEntity(data: data)
                        self.delegate?.didSaveData()
                    }
                case .failure(_):
                    if  let data = response.data,
                        let jsonString = String(data: data, encoding: String.Encoding.utf8)
                    {
                        self.delegate?.didGetError(message: jsonString)
                    }
                }
        }
        print(req.debugDescription)
    }
    
}

