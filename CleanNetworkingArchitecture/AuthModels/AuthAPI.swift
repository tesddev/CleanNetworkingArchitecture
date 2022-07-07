//
//  AuthAPI.swift
//  CleanNetworkingArchitecture
//
//  Created by GIGL iOS on 03/07/2022.
//

import Foundation

struct AuthAPI: APIHandler {
    
    func makeRequest(from param: [String: Any]) -> URLRequest? {
        let urlString =  APIPath().authPath
        if var url = URL(string: urlString) {
            if param.count > 0 {
                url = setQueryParams(parameters: param, url: url)
            }
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.post.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> AuthResponseModel {
        return try defaultParseResponse(data: data,response: response)
    }
}
