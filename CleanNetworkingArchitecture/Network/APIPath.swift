//
//  APIPath.swift
//  CleanArchitecture
//
//  Created by richa on 15/12/20.
//  Copyright © 2020 harsivo. All rights reserved.
//

import Foundation


//#if DEBUG
//let environment = APIEnvironment.test
//#else
//let environment = APIEnvironment.live
//#endif

let baseURL = APIEnvironment.live.baseURL()

struct APIPath {
    var defaultPath: String { return "\(baseURL)/health/readiness"}
}


