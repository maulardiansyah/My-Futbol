//
//  ServicesMethod.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

import Alamofire

extension Services {
    
    var method: Alamofire.HTTPMethod {
        switch self {
        default: return .get
        }
    }
}
