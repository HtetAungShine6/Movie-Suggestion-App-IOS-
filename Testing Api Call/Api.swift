//
//  Api.swift
//  Testing Api Call
//
//  Created by Akito Daiki on 25/10/2566 BE.
//

import Foundation

class Api: ObservableObject{
    @Published var games = [Game]()
    let baseURL = "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=5"
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        guard let url = URL(string: baseURL) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let games = try? JSONDecoder().decode([Game].self, from: data!) else {return}
            DispatchQueue.main.async {
                self.games = games
            }
        }.resume()
    }
}
