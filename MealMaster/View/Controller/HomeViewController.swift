//
//  ViewController.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 01/07/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet var dessertsTableView: UITableView!
    
    let dessertsViewModelObj = DessertsViewModel()
    let categoryViewModelObj = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.dataSource = self
        dessertsTableView.dataSource = self
        dessertsTableView.delegate = self
        Task {
            await fetchData()
        }
    }
}
// MARK: - Category Collection View Setup
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryViewModelObj.categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        if let setter = categoryViewModelObj.categories?[indexPath.row] {
            let imageSetter = categoryViewModelObj.categoryImages[indexPath.row]
            cell.setUp(setter: setter, imageSetter: imageSetter)
        }
        return cell
    }
}
// MARK: - Desserts Table View Setup
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dessertsViewModelObj.desserts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DessertsTableViewCell") as! DessertsTableViewCell
        if let setter = dessertsViewModelObj.desserts?[indexPath.row] {
            Task {
                await cell.setUp(setter: setter)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mealId = dessertsViewModelObj.desserts?[indexPath.row].idMeal
        let dvc = sb.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        if let mealId = mealId {
            dvc.mealId = mealId
        }
        navigationController?.pushViewController(dvc, animated: true)
        dessertsTableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - API call
extension HomeViewController {
    func fetchData() async {
        do {
            try await categoryViewModelObj.fetchData(url: "https://www.themealdb.com/api/json/v1/1/list.php?c=list")
            categoryCollectionView.reloadData()
            try await dessertsViewModelObj.fetchData(url: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
            dessertsTableView.reloadData()
        } catch {
            print("error fetching data")
        }
    }
}
