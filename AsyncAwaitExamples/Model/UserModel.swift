//
//  UserModel.swift
//  AsyncAwaitExamples
//
//  Created by Ayan Ansari on 14/06/23.
//

import Foundation

struct UserModel: Decodable, Hashable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}

extension UserModel {
    static func testData() -> UserModel {
        UserModel(userId: 0, id: 0, title: "Title", body: "Body")
    }
}
