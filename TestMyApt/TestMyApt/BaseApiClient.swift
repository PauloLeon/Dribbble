//
//  BaseApiClient.swift
//  TestMyApt
//
//  Created by Paulo Rosa on 31/08/17.
//  Copyright © 2017 Paulo Rosa. All rights reserved.
//

//swiftlint:disable empty_enum_arguments

import UIKit
import Alamofire

typealias URLRequestParams = [String: Any]

class BaseApiClient {
    
}

extension BaseApiClient {
    enum Router: URLRequestConvertible {
        
        static let routeDribble = "https://api.dribbble.com/v1/"
        
        // MARK: - Routes
        case allShots(data: URLRequestParams)
        case getShots(id: String, data: URLRequestParams)

        
        // MARK: - Methods
        var method: HTTPMethod {
            switch self {
            default:
                return .get
            }
        }
        
        // MARK: - Paths
        var path: String {
            switch self {
            case .allShots(_):                                      return "shots"
            case .getShots(let id):                                  return "shots/\(id)"
            }
        }
        
        // MARK: - Parameters
        var parameters: URLRequestParams? {
            var params: URLRequestParams?
            
            switch self {
            case .allShots(let data):               params = data
            case .getShots(_, let data):            params = data
            }
            
            return params
        }
        
        // MARK: - Paths
        var hearders: String {
            return "Bearer fcd81e02ab4498d3c898a3b15b81e31096fcd1b419d661fa4e684efb487c34a8"
        }
        
        func asURLRequest() throws -> URLRequest {
            let url: URL
            url = try Router.routeDribble.asURL()
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            if hearders != ""{
                urlRequest.setValue(hearders, forHTTPHeaderField: "Authorization")
            }
            if let parameters = parameters {
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            }
            print("*** \(urlRequest)")
            return urlRequest
        }
    }
}
