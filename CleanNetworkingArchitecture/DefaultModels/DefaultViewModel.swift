//
//  DefaultViewModel.swift
//  CleanNetworkingArchitecture
//
//  Created by GIGL iOS on 02/07/2022.
//

import Foundation

struct DefaultViewModel {
    func getAPIData(param: [String: Any], completion: @escaping (DefaultAPIResponseModel?, ServiceError?) -> ()) {
        let request = DefaultAPI()

        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: param) { (model, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                completion(model, nil)
            }
        }
    }
}
