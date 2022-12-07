//
//  PeopleDetailController.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 06/12/22.
//

import UIKit

class PeopleDetailController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!


    var knownInfo: [KnownForInfo] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Known For"
        tableview.delegate = self
        tableview.dataSource = self
        

    }
}



