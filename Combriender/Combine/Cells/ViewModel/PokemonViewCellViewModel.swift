//
//  PokemonViewCellViewModel.swift
//  Combriender
//
//  Created by Victor Vidal on 08/11/21.
//

import Foundation
class PokemonCellViewModel: ObservableObject {
    @Published var model = PokemonView()
    
    func create(model: PokemonView) {
        self.model = model
    }
}
