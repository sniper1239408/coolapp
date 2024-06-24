//
//  ContentView.swift
//  coolapp
//
//  Created by sniper1239408 on 29/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("some garbage") {
                    garbageView()
                }
                NavigationLink("like/dislike GD level") {
                    likeView()
                }
                NavigationLink("Comment on gd level (non functional)") {
                    commentView()
                }
                NavigationLink("Siri saying Practice") {
                    repeaterView()
                }
            }
            .navigationTitle("random app")
        }
        
    }
    }
#Preview {
    ContentView()
}
