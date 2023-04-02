//
//  EmojiView.swift
//  Emojey
//
//  Created by Jimmy Lynch on 3/30/23.
//

import SwiftUI

struct EmojiView: View {
    let emoji: Emoji
    
    var body: some View {
        VStack(alignment: .center) {
            Form {
                Section {
                    VStack {
                        ZStack {
                            Circle()
                                .frame(width: 200, height: 200)
                                .foregroundColor(Color("grey"))
                            Text("\(emoji.emoji)")
                                .font(.system(size: 170))
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 15)
                        Text("\(emoji.description)")
                            .bold()
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Category:")
                                .bold()
                                .font(.title2)
                            Text("\(emoji.category)")
                                .font(.title2)
                        }
                        HStack {
                            Text("Unicode Version:")
                                .bold()
                                .font(.title2)
                            Text("\(emoji.unicode_version)")
                                .font(.title2)
                        }
                        HStack {
                            Text("iOS Version:")
                                .bold()
                                .font(.title2)
                            Text("\(emoji.ios_version)")
                                .font(.title2)
                        }
                    }
                }
                
                Section {
                    HStack {
                        Text("Aliases: ")
                            .font(.title2)
                            .bold()
                        HStack {
                            ForEach(emoji.aliases, id: \.self) { alias in
                                Text("\(alias),")
                                    .font(.title3)
                            }
                        }
                    }
                    HStack {
                        Text("Tags: ")
                            .font(.title2)
                            .bold()
                        HStack {
                            ForEach(emoji.tags, id: \.self) { tag in
                                Text("\(tag),")
                                    .font(.title3)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct EmojiView_Previews: PreviewProvider {
    static let emojis: [Emoji] = Bundle.main.decode("emoji.json")
    
    static var previews: some View {
        EmojiView(emoji: emojis[0])
    }
}
