//
//  ContentView.swift
//  NewsAPI
//
//  Created by Joyce Wu (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var json = "Loading..."
    
    var body: some View {
        VStack {
            
            Text(json)
        }
        .task {
            let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=05709f590c024f94b948c1038be158c8")!

            let (data, _) = try! await URLSession.shared.data(from: url)

         

            json = String(decoding: data, as: UTF8.self)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
