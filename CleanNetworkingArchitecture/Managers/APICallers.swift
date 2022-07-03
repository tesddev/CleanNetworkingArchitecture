//
//  APICallers.swift
//  CleanNetworkingArchitecture
//
//  Created by GIGL iOS on 02/07/2022.
//

import Foundation
import Alamofire

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
    
    func getAuthStatus(completion: @escaping (Result<AuthResponseModel, Swift.Error>) -> Void) {
        guard let url = URL(string: "\(VerifyConstants.baseUrl)token") else {return}
        let parameters: [String: String] = [
            "clientId": "0YQZAL1EN06S38G5C41Q",
            "secret": "54aa5162b98a4c8ea1a28d185e4055fa"
        ]
        
        // create the session object
        let session = URLSession.shared
        
        // now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        do {
            // convert parameters to Data and assign dictionary to httpBody of request
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            return
        }
        
        // create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                return
            }
            
            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
                print("Invalid Response received from the server")
                return
            }
            
            // ensure there is data returned
            guard let responseData = data else {
                print("nil Data received from the server")
                return
            }
            
            do{
                let results = try JSONDecoder().decode(AuthResponseModel.self, from: responseData)
                completion(.success(results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        // perform the task
        task.resume()
    }
    
    func getAuthStatusWithAF(completion: @escaping (Result<AuthResponseModel, Swift.Error>) -> Void) {
        let parameters: [String: String] = [
            "clientId": "0YQZAL1EN06S38G5C41Q",
            "secret": "54aa5162b98a4c8ea1a28d185e4055fa"
        ]

        AF.request("https://vfind248958859405.verifyme.ng/token", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).responseDecodable(of: AuthResponseModel.self) { response in
            guard let data = response.data else { return }
            let json = try? JSONDecoder().decode(AuthResponseModel.self, from: data)
            if let fullData = json {
                completion(.success(fullData))
            }
        }
    }
}


