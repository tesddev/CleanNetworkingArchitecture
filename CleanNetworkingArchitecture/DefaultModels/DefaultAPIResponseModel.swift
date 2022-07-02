//
//  DefaultAPIResponse.swift
//  CleanNetworkingArchitecture
//
//  Created by GIGL iOS on 02/07/2022.
//

import Foundation

// MARK: - Default
struct DefaultAPIResponseModel: Codable {
    let status: String
    let info: Details
    let error: Error
    let details: Details
}

// MARK: - Details
struct Details: Codable {
    let db: DB
}

// MARK: - DB
struct DB: Codable {
    let status: String
}

// MARK: - Error
struct Error: Codable {
}
