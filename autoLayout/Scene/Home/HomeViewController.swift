//
//  HomeViewController.swift
//  autoLayout
//
//  Created by Rodrigo Conte on 13/01/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let listaViagens = TravelDAO().retornaTodasAsViagens()
    
    // MARK: - Outlets
    @IBOutlet weak var travelTable: UITableView!
    @IBOutlet weak var hoteisView: UIView!
    @IBOutlet weak var pacotesView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupView()
        self.travelTable.dataSource = self
    }
    
    private func setupView() {
        self.hoteisView.layer.cornerRadius = 10
        self.pacotesView.layer.cornerRadius = 10
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "CustomHomeTableViewCell", bundle: nil)
        travelTable.register(nib, forCellReuseIdentifier: "customHomeCell")
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customHomeCell", for: indexPath) as! CustomHomeTableViewCell
        
        cell.daysLabel.text = "10 Dias"
        cell.titleLabel.text = "Corney Island"
        cell.priceLabel.text = "R$ 2399,99"
        cell.placeImage.image = #imageLiteral(resourceName: "place")
        
        return cell
    }
    
}
