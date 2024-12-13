//
//  FetchData.swift
//  NewsAPI
//
//  Created by Joyce Wu (student LM) on 12/12/24.
//

import Foundation

struct FetchData{
    
    var response: Response = Response()
    
    mutating func getData() async{
        let URLString = "https://newsapi.org/v2/everything?q=apple&from=2024-12-11&to=2024-12-11&sortBy=popularity&apiKey=05709f590c024f94b948c1038be158c8"
        
        guard let url = URL(string: URLString) else {return}
        
        let(data, _) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data)
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
    }
}


struct Response: Codable{
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article] = []
}

struct Article: Codable{
    var title: String?
    var description: String?
}

extension Article: Identifiable{
    var id: String {title ?? ""}
   
}





