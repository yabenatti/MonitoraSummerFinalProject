//
//  DetailViewController.swift
//  MonitoraSummerStarter
//
//  Created by Yasmin Benatti on 2018-02-17.
//  Copyright © 2018 Yasmin Benatti. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tutorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Variables
    var selectedWorkshop :Workshop?

    override func viewDidLoad() {
        super.viewDidLoad()

        //Title
        self.title = "Detail"
        
        //Populate Screen
        self.populateScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Helpers
    
    func populateScreen() {
        if let workshop = self.selectedWorkshop {
            self.nameLabel.text = workshop.name
            self.tutorLabel.text = workshop.tutor
            self.descriptionLabel.text = workshop.description
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
