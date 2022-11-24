//
//  BookContent.swift
//  Module 4 Final Challenge
//
//  Created by Eric Chandonnet on 2022-11-24.
//

import SwiftUI

struct BookContent: View {
    
    @EnvironmentObject var model: ViewModel
    
    var book:Book
    @State private var currentPage = 0
    
    var body: some View {
            
        TabView (selection: $currentPage) {
            ForEach(0..<book.content.count, id:\.self) { index in
                
                VStack {
                    HStack {
                        Text(book.content[index])
                            .padding()
                        Spacer()
                    }
                    Spacer()
                    Text("- \(index+1) -")
                            
                }
                .tag(index)

            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .never))
        .onAppear { currentPage = book.currentPage }
        .onChange(of: currentPage) { value in
            model.updateCurrentPage(book.id, currentPage)
        }

        
         
        
        
        
    }
}

struct BookContent_Previews: PreviewProvider {
    static var previews: some View {
        BookContent(book: Book())
            .environmentObject(ViewModel())
    }
}
