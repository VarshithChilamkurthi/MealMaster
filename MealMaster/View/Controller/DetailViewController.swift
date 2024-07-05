//
//  DetailViewController.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 03/07/24.
//

import UIKit
import MBProgressHUD

class DetailViewController: UIViewController {

    @IBOutlet var detailsTableView: UITableView!
    
    var mealId = ""
    let detailsViewModelObj = DetailsViewModel()
    var hud: MBProgressHUD!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.dataSource = self
        detailsTableView.delegate = self
        Task {
            await fetchData()
        }
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as! ImageTableViewCell
            if let setter = detailsViewModelObj.details?[0] {
                Task {
                    await cell.setup(setter: setter)
                }
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell") as! TitleTableViewCell
            if let setter = detailsViewModelObj.details?[0] {
                cell.setup(setter: setter)
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionsTableViewCell") as! InstructionsTableViewCell
            if let setter = detailsViewModelObj.details?[0] {
                cell.setup(setter: setter)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension DetailViewController {
    func fetchData() async {
        self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        do {
            let url = Constants.mealDetailsUrl.rawValue + mealId
            try await detailsViewModelObj.fetchData(url: url)
            self.hud.animationType = .fade
            detailsTableView.reloadData()
            self.hud.hide(animated: true)
        } catch {
            print(ServerErrors.invalidFetch.rawValue)
        }
    }
}
