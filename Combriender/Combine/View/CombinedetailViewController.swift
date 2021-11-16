//
//  CombinedetailViewController.swift
//  Combriender
//
//  Created by Victor Vidal on 09/11/21.
//

import UIKit
import Combine
class CombinedetailViewController: UIViewController {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    
    @IBOutlet weak var pokemonPokedexNumber: UILabel!
    @IBOutlet weak var pokemonIsStarter: UILabel!
    
    var viewModel = CombineViewModel()
    var cancelablle = Set<AnyCancellable>()
    var name: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPokemonDetail(pokemon: name!).sink { result in
            self.viewModel.pokemon = result
            DispatchQueue.main.async {
                self.pokemonHeight.text = String(self.viewModel.pokemon.height!)
                self.pokemonWeight.text = String(self.viewModel.pokemon.weight!)
                self.pokemonIsStarter.text = self.viewModel.pokemon.is_default! ? "Sim" : "Não"
                self.pokemonPokedexNumber.text = String(self.viewModel.pokemon.id!)
            }
            self.viewModel.receivePokemonImageFromPath(id: self.viewModel.pokemon.id!).sink { resultImage in
                DispatchQueue.main.async {
                    self.pokemonImage.image = resultImage
                }
            }.store(in: &self.cancelablle)
        }.store(in: &cancelablle)
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getPokemonDetail(pokemon: name!).sink { result in
            self.viewModel.pokemon = result
            print(result)
        }.store(in: &cancelablle)
    }

    
}
