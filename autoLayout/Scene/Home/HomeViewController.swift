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
        self.travelTable.delegate = self
    }
    
    private func setupView() {
        self.hoteisView.layer.cornerRadius = 10
        self.pacotesView.layer.cornerRadius = 10
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "CustomHomeTableViewCell", bundle:  nil)
        travelTable.register(nib, forCellReuseIdentifier: "customHomeCell")
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customHomeCell", for: indexPath) as! CustomHomeTableViewCell
        
        cell.daysLabel.text = String(listaViagens[indexPath.row].days)
        cell.titleLabel.text = listaViagens[indexPath.row].title
        cell.priceLabel.text = listaViagens[indexPath.row].price
        cell.placeImage.image = UIImage(named: listaViagens[indexPath.row].imgPath)
        cell.placeImage.layer.cornerRadius = 10
        cell.placeImage.layer.masksToBounds = true
        
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
}
