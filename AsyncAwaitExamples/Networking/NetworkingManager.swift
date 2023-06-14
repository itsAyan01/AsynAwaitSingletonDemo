//
//  NetworkingManager.swift
//  Ecommerce
//
//  Created by Ayan Ansari on 19/05/23.
//

import Foundation

final class NetworkingManager {
    
    static let shared = NetworkingManager()
    private init() { }
    
    /// this function create a URLSession for get api and returns result of the api
    /// - Parameters:
    ///   - apiEndPoint: pass api url string from ApiEndPoint enum
    ///   - resultType: pass the expected result type decodable
    /// - Returns: returns result if success or return an error
    func callGetApi<T: Decodable>(apiEndPoint: ApiEndPoints, resultType: T.Type) async throws -> T {
        guard let url = URL(string: apiEndPoint.rawValue) else {
            throw NetworkingError.invalidUrl.errorString
        }
        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)
            guard
                let urlResponse = urlResponse as? HTTPURLResponse,
                urlResponse.statusCode >= 200 && urlResponse.statusCode < 300 else {
                throw NetworkingError.invalidURLResponse.errorString
            }
            #if DEBUG
            print(try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed))
            #endif
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error: \(error)")
            throw error
        }
    }
    
    /// A generic function for calling a post api
    /// - Parameters:
    ///   - withAuthorization: pass true if you want to call api with user authoriaztion
    ///   - apiEndPoint: pass api url string from ApiEndPoint enum
    ///   - requestBody: pass request body for creating api request
    ///   - resultType: pass the expected result type decodable
    /// - Returns: returns result if success or return an error
    func callPostApi<T: Decodable>(apiEndPoint: ApiEndPoints,
                                   requestBody: Data,
                                   resultType: T.Type) async throws -> T {
        guard let url = URL(string: apiEndPoint.rawValue) else {
            throw NetworkingError.invalidUrl.errorString
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = requestBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: request)
            guard
                let urlResponse = urlResponse as? HTTPURLResponse,
                urlResponse.statusCode >= 200 && urlResponse.statusCode < 300 else {
                throw NetworkingError.invalidURLResponse.errorString
            }
            #if DEBUG
            print(try JSONSerialization.jsonObject(with: data))
            #endif
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("ERROR: \(error)")
            throw error
        }
    }
    
}

