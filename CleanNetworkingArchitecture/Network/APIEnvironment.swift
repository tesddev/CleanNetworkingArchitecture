//
//  APIEnvironment.swift
//  CleanArchitecture
//
//  Created by richa on 15/12/20.
//  Copyright © 2020 harsivo. All rights reserved.
//
//"https://vfind248958859405.verifyme.ng"
import Foundation
enum APIEnvironment {
    case test
    case live
    
    func baseURL () -> String {
        return "https://\(subdomain()).\(domain())"
    }
    
    func domain() -> String {
        switch self {
        case .test:
            return "verifyme.ng"
        case .live:
            return "verifyme.ng"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .test, .live:
            return "vfind248958859405"
        }
    }
    
//    func route() -> String {
//        return "/api/v1"
//    }
}
