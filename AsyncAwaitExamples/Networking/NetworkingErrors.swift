//
//  NetworkingErrors.swift
//  AsyncAwaitExamples
//
//  Created by Ayan Ansari on 14/06/23.
//

import Foundation
extension String: Error { }

enum NetworkingError {
    case invalidUrl
    case custom(error: Error)
    case invalidURLResponse
    case invalidData
    case failedToDecode
    
    var errorString: String {
        switch self {
        case .invalidUrl:
            return "Api URL is not correct"
        case .custom(let error):
            return error.localizedDescription
        case .invalidURLResponse:
            return "Bad Response"
        case .invalidData:
            return "Invalid Data"
        case .failedToDecode:
            return "Failed to decode the data"
        }
    }
}
