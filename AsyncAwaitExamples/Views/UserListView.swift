//
//  UserListView.swift
//  AsyncAwaitExamples
//
//  Created by Ayan Ansari on 14/06/23.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject var viewModel: UserViewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
                
                listView
            }
            .navigationTitle("User's List")
            .navigationDestination(for: UserModel.self) { user in
                UserDetailsView(user: user)
            }
        }
    }
    
    private var listView: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.dataArray, id: \.self) { user in
                    getListRow(user: user)
                }
            }
        }
        .task {
            await viewModel.getUserList()
        }
    }
    
    private func getListRow(user: UserModel) -> some View {
        NavigationLink(value: user) {
            HStack(alignment: .top, spacing: 12) {
                Text(String(user.id ?? 0))
                Text(user.title ?? "")
                    .lineLimit(1)
                Spacer()
            }
            .foregroundColor(.black)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
    
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
