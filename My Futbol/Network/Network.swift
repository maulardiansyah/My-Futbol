//
//  Network.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

import Alamofire
import SwiftyJSON

class Network
{
    class var baseUrl: String { return "https://api-football.azharimm.tk" }
    
    class func request(_ service: Services, completion: @escaping (_ data: Data?, _ error: String?) -> Void) {
        AF.request(baseUrl + service.path, method: service.method, encoding: URLEncoding.httpBody)
            .responseJSON { res in
                printResponse(service, res)
                switch res.result {
                case .success:
                    completion(res.data, nil)
                case .failure(let error):
                    let errorMessage = error.localizedDescription
                        .replacingOccurrences(of: "URLSessionTask failed with error: ", with: "")
                        .replacingOccurrences(of: "JSON could not be serialized because of error:\n", with: "")
                    completion(nil, errorMessage)
                }
        }
    }
    
    class func printResponse(_ service: Services, _ response: AFDataResponse<Any>) {
        #if DEBUG
        if let data = response.data, let json = try? JSON(data: data) {
            printRequest(service)
            print(json)
        } else {
            debugPrint(response)
        }
        #endif
    }
    
    class func printRequest(_ sercive: Services) {
        print(baseUrl + sercive.path)
    }
}
