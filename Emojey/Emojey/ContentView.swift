//
//  ContentView.swift
//  Emojey
//
//  Created by Jimmy Lynch on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    let emojis: [Emoji] = Bundle.main.decode("emoji.json")
    @State private var searchText = ""
    
    let columns = [
        GridItem(.adaptive(minimum: 60))
    ]
    
    var searchResults: [Emoji] {
        if searchText.isEmpty {
            return emojis
        } else {
            return emojis.filter {$0.description.contains(searchText.lowercased())}
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(searchResults) { emoji in
                        NavigationLink {
                            EmojiView(emoji: emoji)
                        } label: {
                            Text("\(emoji.emoji)")
                                .font(.largeTitle)
                                .padding(.bottom, 10)
                        }
                    }
                }
                .padding(.horizontal)
                //Title w/ Search bar
                //Scroll view of all emojis to select
            }
            .navigationTitle("Emojiey")
        }
        .searchable(text: $searchText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
