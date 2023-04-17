//
//  modelTwo.swift
//  OpenLibrary
//
//  Created by Даша Волошина on 17.04.23.
//

import Foundation
import UIKit

class Model2 {
    
    weak  var viewController: DetailViewController?
    
    var detail: Detail = Detail(title: "", description: ""){
        didSet{
            DispatchQueue.main.async {
                
                self.viewController?.decription.text = self.detail.description
                self.viewController?.header.text = self.detail.title
            }
            
        }
    }
    
    var detail2:Detail2 = Detail2(title: "", description: Created(type: "", value: "")){
        didSet{
            DispatchQueue.main.async {
                self.viewController?.decription.text =  self.detail2.description.value
                self.viewController?.header.text =  self.detail2.title
            }
            
        }
        
        
    }
    var rating:Summary = Summary(average: 0.0)  {
        didSet {
            DispatchQueue.main.async {
                self.viewController?.rating.text = "Rating " + String(format: "%.2f", self.rating.average)
            }
            
        }
    }
    
    func getData(id:String) {
        
        let url =  URL(string:"https://openlibrary.org\(id).json")
        
        guard let url = url else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        var task = URLSession.shared.dataTask(with: request) { data, error, response in
            
            guard let data = data else {return}
            
            do {
                
                let detailBook =  try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    if detailBook.detail1 != nil {
                        self.detail = detailBook.detail1!
                    }else {
                        
                        self.detail2 = detailBook.detail2!
                    }
                }
            }
            catch(let error){
                print(error)
            }
        }
        task.resume()
        
    }
    
    func getRating(id:String) {
        
        var url = URL(string: "https://openlibrary.org\(id)/ratings.json")
        
        guard let url = url else {return}
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        var task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard let data = data else {return}
            
            do {
                
                let rating = try  JSONDecoder().decode(Rating.self, from: data)
                self.rating = rating.summary
                
                
            }catch let error{
                print(error)
            }
            
        }
        task.resume()
        
    }
}
