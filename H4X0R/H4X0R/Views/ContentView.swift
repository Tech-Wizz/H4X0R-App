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
                        Text(post.title)
                    }
                }
                .listRowBackground(Color(red: 0.98, green: 0.95, blue: 0.87))
            }
            .navigationBarTitle("H4X0R NEWS")
            .background(Color(red: 1.00, green: 0.34, blue: 0.13))
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
