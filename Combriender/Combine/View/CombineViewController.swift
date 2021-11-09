//
//  CombineViewController.swift
//  Combriender
//
//  Created by Victor Vidal on 09/11/21.
//

import UIKit

class CombineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    func settingTableViewCell() {
        tableView.register(UINib(nibName: "PokemonTableViewCell", bundle: .main), forCellReuseIdentifier: "PokemonTableViewCell")
    }
}

extension CombineViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell.", for: indexPath) as? PokemonTableViewCell else {return UITableViewCell()}
        cell.pokemonImage.image = UIImage(systemName: "heart")
        cell.pokemonName.text = "teste"
        return cell
    }
    
    
}

extension CombineViewController: UITableViewDelegate {
    
}
