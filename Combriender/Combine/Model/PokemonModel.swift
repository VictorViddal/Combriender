//
//  PokemonModel.swift
//  Combriender
//
//  Created by Victor Vidal on 08/11/21.
//

import Foundation

struct Result: Codable {
    
    var results: [Pokemon?]
    
    struct Pokemon: Codable {
        var name: String?
        var url: String?
    }
}

struct PokemonData: Codable {
    var abilities: [Ability?]
    var height: Int?
    var weight: Int?
    var id: Int?
    var is_default: Bool?
    
    struct Ability: Codable {
        var name: String?
        var is_hidden: Bool?
        var slot: Int?
    }
}
