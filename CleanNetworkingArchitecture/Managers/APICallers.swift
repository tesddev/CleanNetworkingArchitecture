//
//  APICallers.swift
//  CleanNetworkingArchitecture
//
//  Created by GIGL iOS on 02/07/2022.
//

import Foundation

struct VerifyConstants{
    static let baseUrl = "https://vfind248958859405.verifyme.ng/"
}

enum APIError: Swift.Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getHealthDefaultReadinessStatus(completion: @escaping (Result<String, Swift.Error>) -> Void) {
        guard let url = URL(string: "\(VerifyConstants.baseUrl)health/readiness") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let results = try JSONDecoder().decode(DefaultAPIResponseModel.self, from: data)
                completion(.success(results.status))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getHealthDefaultLivenessStatus(completion: @escaping (Result<String, Swift.Error>) -> Void) {
        guard let url = URL(string: "\(VerifyConstants.baseUrl)health/liveness") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                print("no issues 2")
                let results = try JSONDecoder().decode(String.self, from: data)
                let result = try JSONSerialization.data(withJSONObject: NSString.self)
                let resultss = try JSONSerialization.jsonObject(with: result)

                let jsonString = String(data: results as! Data, encoding: .utf8)
                print("no issues 3")
                completion(.success(results as! String))
            } catch {
                print("issues 1")
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
}
