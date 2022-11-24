//
//  BookCard.swift
//  Module 4 Final Challenge
//
//  Created by Eric Chandonnet on 2022-11-24.
//

import SwiftUI

struct BookCard: View {
    
    var book: Book
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(book.title)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    if (book.isFavourite) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    
                }
                
                Text(book.author)
                    .italic()
                
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
        }
        .accentColor(.black)
    }
}
struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        BookCard(book: Book())
    }
}
