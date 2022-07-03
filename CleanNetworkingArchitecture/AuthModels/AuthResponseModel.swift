//
//  AuthResponseModel.swift
//  CleanNetworkingArchitecture
//
//  Created by GIGL iOS on 02/07/2022.
//

import Foundation

// MARK: - AuthResponseModel
struct AuthResponseModel: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int
}
