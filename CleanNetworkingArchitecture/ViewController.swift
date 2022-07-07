//
//  ViewController.swift
//  CleanNetworkingArchitecture
//
//  Created by GIGL iOS on 02/07/2022.
//

import UIKit
import Alamofire

struct AuthModel {
    let accessToken, expiresIn, tokenType: String
}

class ViewController: UIViewController {
    public var defaultViewModel = DefaultViewModel()
    public var authViewModel = AuthViewModel()
    private var dataSource: DefaultAPIResponseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
//        makeHealthDefaultReadinessCall()
//        makeHealthDefaultLivenessCall()
        getAuthWithCleanArchitecture()
    }

    func makeHealthDefaultReadinessCall(){
        APICaller.shared.getHealthDefaultReadinessStatus { result in
            switch result {
            case .success(let status):
                if status == "ok"{
                    print("\(status) we are good")
                } else {
                    print("\(status) we are not good")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getAuthWithCleanArchitecture() {
        let parameters: [String: String] = [
            "clientId": "0YQZAL1EN06S38G5C41Q",
            "secret": "54aa5162b98a4c8ea1a28d185e4055fa"
        ]
        authViewModel.getAPIData(param: parameters, completion: { res, error in
            print("no 1 \(String(describing: res?.accessToken)), \(error?.localizedDescription)")
        })
        
        defaultViewModel.getAPIData(param: [:], completion: { res, err in
            print("no 2 \(String(describing: res?.details)), \(String(describing: err?.localizedDescription))")
        })
    }
    
    func makeHealthDefaultLivenessCall(){
        DefaultViewModel().getAPIData(param: [:]) { response, error in
            print(response?.status as Any, error as Any)
        }
    }
    
    func getAuthUsingNSURL() {
        APICaller.shared.getAuthStatus { result in
            switch result{
            case .success(let res):
                print(res.accessToken)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getAuthUsingAF() {
        APICaller.shared.getAuthStatusWithAF { result in
            switch result{
            case .success(let res):
                print(res.accessToken)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

