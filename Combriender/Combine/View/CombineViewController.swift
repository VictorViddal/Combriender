//
//  CombineViewController.swift
//  Combriender
//
//  Created by Victor Vidal on 09/11/21.
//

import UIKit
import Combine
import CoreData

class CombineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = CombineViewModel()
    var cancelablle = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableViewCell()
  
        viewModel.getPokemonData().sink { completion in
        switch completion {
        case .failure(let error):
            switch error {
            
            }
        case .finished:
            break
       
        }
        } receiveValue: { result in
            self.viewModel.pokemons = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.store(in: &self.cancelablle)
    }
    
    private func settingTableViewCell() {
        tableView.register(UINib(nibName: "PokemonTableViewCell", bundle: .main), forCellReuseIdentifier: "PokemonTableViewCell")
    }
}

extension CombineViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemons.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.generateTableViewCell(indexPath: indexPath, tableView: tableView)
    }
    
    
}

extension CombineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Combine", bundle: .main)
        if let viewController = storyboard.instantiateViewController(identifier: "CombinedetailViewController") as? CombinedetailViewController{
            viewController.name = viewModel.pokemons.results[indexPath.row]?.name
            navigationController?.pushViewController(viewController, animated: false)
        }
    }
}

