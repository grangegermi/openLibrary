//
//  model.swift
//  OpenLibrary
//
//  Created by Даша Волошина on 17.04.23.
//

import Foundation
import UIKit

class Model {

    weak var viewController:ViewController?
    
    var books:[Work] = [] {
        didSet {
            DispatchQueue.main.async{
                self.viewController?.tableView.reloadData()
            }
        }
    }
    
    func getBooks() {
       
        let url =  URL(string:"https://openlibrary.org/trending/weekly.json")
        
        guard let url = url else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        var task = URLSession.shared.dataTask(with: request) { data, error, _ in
            guard let data = data else {return}
            
            do {
                let book =  try JSONDecoder().decode(Books.self, from: data)
                DispatchQueue.main.async {
                    
                    self.books.append(contentsOf: book.works)
                }
    
            }catch(let error){
                print(error.localizedDescription)
            }
        }
        task.resume()

    }
}
