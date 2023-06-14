//
//  UserDetailsView.swift
//  AsyncAwaitExamples
//
//  Created by Ayan Ansari on 14/06/23.
//

import SwiftUI

struct UserDetailsView: View {
    
    let user: UserModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("UserId = \(user.userId ?? 0)")
                    Text("Id = \(user.userId ?? 0)")
                    Text("Title = \(user.title ?? "")")
                    Text("Body = \(user.body ?? "")")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.white)
                .cornerRadius(12)
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(user: .testData())
    }
}
