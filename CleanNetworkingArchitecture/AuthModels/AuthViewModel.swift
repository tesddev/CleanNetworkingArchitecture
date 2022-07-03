//
//  AuthViewModel.swift
//  CleanNetworkingArchitecture
//
//  Created by GIGL iOS on 03/07/2022.
//

import Foundation

struct AuthViewModel {
    func getAPIData(param: [String: Any], completion: @escaping (AuthResponseModel?, ServiceError?) -> ()) {
        let request = AuthAPI()

//        let apiLoader = APILoader(apiHandler: request)
//        apiLoader.loadAPIRequest(requestData: param) { (model, error) in
//            if let _ = error {
//                completion(nil, error)
//            } else {
//                completion(model, nil)
//            }
//        }
        
//        let apiLoader = APILoader(apiHandler: request)
//        apiLoader.loadAPIRequest(requestData: [:], completionHandler: <#T##(DefaultAPIResponseModel?, ServiceError?) -> ()#>)
        
        
    }
}
