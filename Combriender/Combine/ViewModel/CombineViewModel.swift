//
//  CombineViewModel.swift
//  Combriender
//
//  Created by Victor Vidal on 10/11/21.
//

import Foundation
import Combine
import UIKit

class CombineViewModel {
    
    private var apistring: String = "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20"
    var pokemons: Result = Result(results: [])
    var pokemon: PokemonData = PokemonData(abilities: [], height: 0, weight: 0, id: 0, is_default: false)
    func getPokemonData(pokemon: String? = "") -> Future<Result, Never> {
        return Future { promise in
            
            guard let url = URL(string: self.apistring) else {return}

               let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                   
                   switch error {
                   case .none:
                       break
                   case .some(_):
                       promise(.failure(error as! Never))
                   }

                 if let data = data,
                   let pokemon = try? JSONDecoder().decode(Result.self, from: data) {
                     promise(.success(pokemon))
                     
                 }
               } )
            
               task.resume()
            
        }
    }
    
    func generateTableViewCell(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell{
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell") as? PokemonTableViewCell else {return UITableViewCell()}
        cell.pokemonName.text = pokemons.results[indexPath.row]?.name
        cell.pokemonImage.image = UIImage(named: "pokebol")
        return cell
    }
    
    func getPokemonDetail(pokemon: String) -> Future<PokemonData, Errors> {
        return Future { promise in
            
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/" + "\(pokemon)") else {return}

               let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

                 if let data = data,
                   let pokemon = try? JSONDecoder().decode(PokemonData.self, from: data) {
                     promise(.success(pokemon))
                     
                     if pokemon.weight == nil {
                         promise(.failure(.weightUnavailable))
                     }
                     if pokemon.height == nil {
                         promise(.failure(.heightUnavailable))
                     }
                     if pokemon.id == nil {
                         promise(.failure(.idUnavailable))
                     }
                     if pokemon.is_default == nil {
                         promise(.failure(.starterUnavailable))
                     }
                                          
                 }
               })
               task.resume()
            
        }
    }
    
    func receivePokemonImageFromPath(id: Int)-> Future<UIImage, Never> {
        return Future { promise in
            
            guard let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png") else {return}
                if let data = try? Data(contentsOf: url) {
                    guard let pokemonImage = UIImage(data: data) else { return }
                    
                    promise(.success(pokemonImage))
                }
        }
        
    
    }
    
    enum Errors: Error {
        case weightUnavailable
        case heightUnavailable
        case idUnavailable
        case starterUnavailable
        case imageUnavailable
        case generic
        
    }
    
}
