//
//  modelJsonTwo.swift
//  OpenLibrary
//
//  Created by Даша Волошина on 17.04.23.
//

import Foundation

struct Detail:Decodable {
    let title: String
    let description: String
}

struct Detail2:Decodable {
    let title: String
    let description: Created
}

struct Created: Decodable {
    let type:String
    let value: String
}


struct Response: Decodable {
    var  detail1:Detail?
    var detail2:Detail2?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let data = try? container.decode(Detail.self) {
            detail1 = data
        } else {
            let data = try container.decode(Detail2.self)
            detail2 = data
        }
    }
}

struct Rating:Decodable{
    let summary:Summary
}

struct Summary:Decodable {
    let average:Float
}
