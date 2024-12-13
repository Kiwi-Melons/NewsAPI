//
//  ContentView.swift
//  NewsAPI
//
//  Created by Joyce Wu (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var data = FetchData()
    
    var body: some View {
        ScrollView{
            ForEach(data.response.articles){
                a in
                VStack (alignment: .leading, content: {
                    Text(a.title ?? "")
                        .padding(.all)
                    Text(a.descrption ?? "")
                        .padding(.all)
                    
                })
            }
            
      
            
            
            
        }
        

        .task {
            await data.getData()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
