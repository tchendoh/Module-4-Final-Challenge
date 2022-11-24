//
//  ViewModel.swift
//  Module 4 Final Challenge
//
//  Created by Eric Chandonnet on 2022-11-24.
//

import Foundation

class ViewModel : ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        self.books = getLocalJson()
    }

    /// Retrieve all record data form a local JSON file with name `fileName` and extension `fileExtension`..
    func getLocalJson(_ fileName: String = "Data", fileExtension: String = "json") -> [Book] {
        
        var books = [Book]()
        
        // Get link to data file
        let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        
        guard url != nil else {
            print("Could not retrieve category data: \(fileName).\(fileExtension) not found.")
            return books
        }
            
        do {
            // Decode the data and return it
            let data = try Data(contentsOf: url!)
            books = try JSONDecoder().decode([Book].self, from: data)
            return books
            
        } catch {
            print("Error retrieving category data: \(error.localizedDescription)")
        }
        
        return books
    }
    
    // Toggle en favori ou pas, selon ce que la valeur était auparavant
    func updateFavourite(_ bookId: Int, _ isFavourite: Bool) {
        if let index = books.firstIndex(where:{ $0.id == bookId }) {
            books[index].isFavourite = isFavourite
        }
    }

    // Met à jour le rating du livre
    func updateRating(_ bookId: Int, _ rating: Int) {
        
        if let index = books.firstIndex(where:{ $0.id == bookId }) {
            books[index].rating = rating
        }
        
    }

    // Met à jour la page du livre où on est rendu
    func updateCurrentPage(_ bookId: Int, _ currentPage: Int) {

        if let index = books.firstIndex(where:{ $0.id == bookId }) {
            books[index].currentPage = currentPage
        }
        
    }

}
