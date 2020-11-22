//
//  ViewController.swift
//  CountryFacts
//
//  Created by Margulan Daribayev on 17.11.2020.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [Country]() {
        didSet {
            DispatchQueue.main.async {
                [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        getCountries()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Country Facts"
    }
    
    func getCountries() {
        fetchCountries {
            [weak self] result in
            switch result {
            case .success(let countries):
                self?.countries = countries
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - Table View Configuration
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cellID, for: indexPath)
        let countryName = countries[indexPath.row].name
        cell.textLabel?.text = countryName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: Identifier.detailVC) as? DetailViewController else { return }
        let country = countries[indexPath.row]
        detailVC.country = country
        detailVC.selectedCountryNumber = indexPath.row + 1
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

