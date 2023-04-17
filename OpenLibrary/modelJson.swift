//
//  modelJson.swift
//  OpenLibrary
//
//  Created by Даша Волошина on 17.04.23.
//

import Foundation

struct Books:Decodable {
    let works: [Work]
}

struct Work:Decodable {
    let title:String
    let key:String
    let first_publish_year: Int?
    let author_name: [String]?
    let cover_i:Int?
    let availability:Availability?
    
}

struct Availability:Decodable {
    let isbn:String?
}



struct BookImage:Decodable {
    let id:Int
    let category_id: Int
    let source_url: String
  
}
