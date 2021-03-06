//
//  HomeViewController.swift
//  MonitoraSummerStarter
//
//  Created by Yasmin Benatti on 2018-02-17.
//  Copyright © 2018 Yasmin Benatti. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var workshopsArray :[Workshop] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Title
        self.title = "Workshops"

        //TableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let array = WorkshopFactory.createWorkshops() {
            self.workshopsArray = array
        }
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeToDetailSegue" {
            if let vc = segue.destination as? DetailViewController {
                if let workshop = sender as? Workshop {
                    vc.selectedWorkshop = workshop
                }
            }
        }
    }
}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let workshop = self.workshopsArray[indexPath.row]
        self.performSegue(withIdentifier: "HomeToDetailSegue", sender: workshop)
    }
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.workshopsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        let workshop = self.workshopsArray[indexPath.row]
        cell.textLabel?.text = workshop.name
        cell.detailTextLabel?.text = workshop.tutor
        
        return cell
    }
}
