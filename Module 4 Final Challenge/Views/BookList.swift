//
//  BookList.swift
//  Module 4 Final Challenge
//
//  Created by Eric Chandonnet on 2022-11-24.
//

import SwiftUI

struct BookList: View {
    
    @EnvironmentObject var model:ViewModel
    
    var body: some View {

        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 30) {
                    ForEach(model.books) { book in
                        NavigationLink(destination: BookDetails(book: book) ) {
                            BookCard(book: book)
                                .padding(20)
                        }
                    }
                    .navigationTitle("Ma bibliothèque")
                }
            }
        }

    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
            .environmentObject(ViewModel())
    }
}
