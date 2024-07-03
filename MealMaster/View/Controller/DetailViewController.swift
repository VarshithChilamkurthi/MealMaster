//
//  DetailViewController.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 03/07/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var detailsTableView: UITableView!
    
    var mealId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.dataSource = self
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell3") else { return UITableViewCell() }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4")
            return cell ?? UITableViewCell()
        }
    }
}
