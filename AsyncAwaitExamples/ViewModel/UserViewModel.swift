//
//  UserViewModel.swift
//  AsyncAwaitExamples
//
//  Created by Ayan Ansari on 14/06/23.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    
    func getUserList() async {
        do {
            let result = try await NetworkingManager.shared.callGetApi(apiEndPoint: .firstEndPOint, resultType: [UserModel].self)
            await MainActor.run {
                dataArray = result
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
}
