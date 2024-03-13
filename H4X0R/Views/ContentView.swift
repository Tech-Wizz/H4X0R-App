//
//  ContentView.swift
//  H4X0R
//
//  Created by Kruize Christensen on 3/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                            .foregroundColor(Color("TextColor"))
                        Text(post.title)
                            .foregroundColor(Color("TextColor"))
                    }
                }
                .listRowBackground(Color(Color("ListColor")))
            }
            .navigationBarTitle("H4X0R NEWS")
            .background(Color(Color("NavColor")))
            .listStyle(PlainListStyle())
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
    
}

#Preview {
    ContentView()
}
