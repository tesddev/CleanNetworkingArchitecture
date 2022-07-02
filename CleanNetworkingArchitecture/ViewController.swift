//
//  ViewController.swift
//  CleanNetworkingArchitecture
//
//  Created by GIGL iOS on 02/07/2022.
//

import UIKit

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
        APICaller.shared.getHealthDefaultLivenessStatus { result in
            switch result {
            case .success(let status):
                if status == "ok"{
                    print("\(status) here")
                } else {
                    print("\(status) here")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

