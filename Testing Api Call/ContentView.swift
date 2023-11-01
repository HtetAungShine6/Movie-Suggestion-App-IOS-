//
//  ContentView.swift
//  Testing Api Call
//
//  Created by Akito Daiki on 25/10/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = Api()
    
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
        
        NavigationView{
            List(viewModel.games){ games in
                NavigationLink(destination: Text("\(games.title)")){
                    HStack(spacing: 30){
                        AsyncImage(url: URL(string: games.thumb) ?? URL(string: "https://loremflickr.com/640/360")!){ image in
                            image
                                .resizable()
                                .scaledToFill()
                        }placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
                    }
                    
                    VStack(alignment: .leading){
                        Text("\(games.title)").bold().lineLimit(1)
                        Text("Originally : \(games.normalPrice)")
                        Text("\(games.salePrice)$").foregroundColor(.red)
                        Text("\(games.steamRatingPercent)%")
                    }
                }
            }.onAppear()
        }
    }
}

#Preview {
    ContentView()
}
