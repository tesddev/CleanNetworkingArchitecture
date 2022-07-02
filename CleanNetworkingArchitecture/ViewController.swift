//
//  ViewController.swift
//  CleanNetworkingArchitecture
//
//  Created by GIGL iOS on 02/07/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    public var defaultViewModel: DefaultViewModel?
    private var dataSource: DefaultAPIResponseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        makeHealthDefaultReadinessCall()
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
        
//        AF.request("https://vfind248958859405.verifyme.ng/health/readiness", method: .get).responseDecodable(of: DefaultAPIResponseModel.self,completionHandler: { Default in
//            print(Default)
//        })
//
//        AF.request("https://vfind248958859405.verifyme.ng/health/readiness").responseString { response in
//            print("Response: \(response.value)")
//        }
    }

}

