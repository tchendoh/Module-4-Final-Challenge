//
//  BookDetails.swift
//  Module 4 Final Challenge
//
//  Created by Eric Chandonnet on 2022-11-24.
//

import SwiftUI

struct BookDetails: View {
    
    @EnvironmentObject var model: ViewModel
    
    var book:Book
    
    @State private var rating = 3
    @State private var isFavourite = false
    
    var body: some View {
        
        VStack {
            
            // MARK: Titre
            HStack  {
                Text(book.title)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Spacer()
            }
            NavigationLink(destination: BookContent(book: book)) {
                VStack {
                    // MARK: Lire maintenant + livre
                    Text("Lire maintenant! ")
                        .font(.title)
                        .foregroundColor(Color.black)
                    
                    Image("cover"+String(book.id))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.bottom, 30)
                }
            }

            
            
            // MARK: Cocher comme favori
            Text("Marquer pour plus tard")
                .bold()
            
            
            Toggle(isOn: $isFavourite) {
                Image(systemName: isFavourite ? "star.fill" : "star")
            }
            .foregroundColor(.yellow)
            .toggleStyle(.button)
            .onChange(of: isFavourite) { value in
                model.updateFavourite(book.id, isFavourite)
            }
            .onAppear { isFavourite = book.isFavourite }
                
            // MARK: Évaluation du livre
            Text("Évaluer ce livre")
                .bold()

            Picker("ratingPicker", selection: $rating) {
                ForEach (1..<6) { index in
                    Text("\(index)").tag(index)
                }
    
            }
            .onChange(of: rating) { value in
                model.updateRating(book.id, rating)
            }
            .onAppear { rating = book.rating }
                
            .pickerStyle(.segmented)
            .padding(.horizontal, 60)
            Spacer()
        }
        
        
        
    }
}

struct BookDetails_Previews: PreviewProvider {
    static var previews: some View {
        BookDetails(book: Book())
            .environmentObject(ViewModel())
    }
}
