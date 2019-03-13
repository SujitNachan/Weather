//
//  HomeTableViewController.swift
//  Ansh
//
//  Created by Sujit Nachan on 13/03/19.
//  Copyright © 2019 Sujit Nachan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    fileprivate lazy var homeVM : HomeVM = {
        return HomeVM(vc: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        Timer.scheduledTimer(withTimeInterval: 5*60, repeats: true) { [weak self] (timer) in
            self?.homeVM.refreshData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        homeVM.fetchData()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return homeVM.numberOfRow()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        cell.setupCell(name: homeVM.getObject(atIndex: indexPath.row).name, temp: homeVM.getObject(atIndex: indexPath.row).temp?.description)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        vc.weather = homeVM.getObject(atIndex: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
    }
}
