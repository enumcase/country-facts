//
//  DetailViewController.swift
//  CountryFacts
//
//  Created by Margulan Daribayev on 17.11.2020.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var countryFlagLabel: UILabel!
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var capitalNameLabel: UILabel!
    @IBOutlet var regionNameLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet var currenciesLabel: UILabel!
    
    let country: Country!

    var selectedCountryNumber = Int()
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        DispatchQueue.main.async {
            [weak self] in
            self?.createUI()
            self?.setupUI()
        }
        
        defer {
            setupUI()
        }
        
        print("View did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // MARK: - UI Setup
    
    func setupNavBar() {
        navigationItem.largeTitleDisplayMode = .never
        title = "Number in list: \(selectedCountryNumber)"
    }
    
    func createUI() {
        countryFlagLabel = UILabel()
        countryNameLabel = UILabel()
        capitalNameLabel = UILabel()
        regionNameLabel  = UILabel()
        populationLabel  = UILabel()
        currenciesLabel  = UILabel()
        
        let labels = [
            countryFlagLabel, countryNameLabel, capitalNameLabel,
            regionNameLabel, populationLabel, currenciesLabel
        ]

        for label in labels {
            label?.numberOfLines = 0
        }
    }
    
    func setupUI() {
        countryFlagLabel.text = country.flagEmoji
        countryNameLabel.text = country.name
        capitalNameLabel.text = "Capital: \(country.capital)"
        regionNameLabel.text  = "Region: \(country.region)"
        populationLabel.text  = "Population: \(country.population.formatted)"
        guard let currencyName = country.currencies.first?.name else {
            currenciesLabel.text = "Currencies: unavailable"
            return
        }
        currenciesLabel.text = "Currencies: \(currencyName)"

        guard let currencySymbol = country.currencies.first?.symbol else { return }
        currenciesLabel.text = "Currencies: \(currencyName)(\(currencySymbol))"
    }

}
