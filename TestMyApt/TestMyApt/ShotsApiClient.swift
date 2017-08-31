//
//  ShotsApiClient.swift
//  TestMyApt
//
//  Created by Paulo Rosa on 31/08/17.
//  Copyright © 2017 Paulo Rosa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ShotsApiClient: BaseApiClient {
    
    static func allShots(_ data: URLRequestParams, success: @escaping ([Shots]) -> Void, failure: @escaping (ApiError) -> Void ) {
        Alamofire.request(Router.allShots(data: data))
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    let json = JSON(data: response.data!)
                    var shots = [Shots]()
                    for shot in json.arrayValue {
                        let shotAux = Shots(fromJSON: shot)
                        shots.append(shotAux)
                    }
                    success(shots)
                case .failure(_):
                    let apiError = ApiError(response: response)
                    failure(apiError)
                }
        }
    }
    
    static func getShot(_ id: String, data: URLRequestParams, success: @escaping (Shots) -> Void, failure: @escaping (ApiError) -> Void) {
        Alamofire.request(Router.getShots(id: id, data: data))
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    let json = JSON(data: response.data!)
                    let shot = Shots(fromJSON: json)
                    success(shot)
                case .failure(_):
                    let apiError = ApiError(response: response)
                    failure(apiError)
                }
        }
    }
    
}
