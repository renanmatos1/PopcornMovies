//
//  PeopleViewController.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 04/12/22.
//

import UIKit

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var tableViewPeople: UITableView!
    
    var people: [People] = []
    var peopleBrain = BrainPeople()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewActivityIndicator: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "People"
        peopleBrain.delegate = self
        tableViewPeople.dataSource = self
        tableViewPeople.delegate = self
        showLoaderPeople()
        peopleBrain.getApiPeople()
        
    }
    
    func showLoaderPeople() {
            self.viewActivityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
            self.view.isUserInteractionEnabled = false

        }

        func hideLoaderPeople() {
            self.viewActivityIndicator.isHidden = true
            self.activityIndicator.startAnimating()
            self.view.isUserInteractionEnabled = true
        }
}

extension PeopleViewController: BrainDelegatePeople {
    
    func successPeople(decodedData: PeopleResult) {
        DispatchQueue.main.async {
            
            
            self.people = decodedData.results
            self.tableViewPeople.reloadData()
            self.hideLoaderPeople()
        }
    }

    func failPeople(error: Error) {
        DispatchQueue.main.async {
            return
            
        }
    }
}
