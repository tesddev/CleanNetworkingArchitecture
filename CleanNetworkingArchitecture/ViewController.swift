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
    public var defaultViewModel: DefaultViewModel?
    private var dataSource: DefaultAPIResponseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
//        makeHealthDefaultReadinessCall()
        makeHealthDefaultLivenessCall()
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

