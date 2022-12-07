//
//  extensionDataourcePeople.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 05/12/22.
//

import Foundation
import UIKit

//

extension PeopleViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return people.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! PeopleCell

        cell.cellSetupPplCell(people: people[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let peopleDetail: UIStoryboard = UIStoryboard(name: "PeopleDetail", bundle: nil)

        let peopleDetailController = peopleDetail.instantiateViewController(withIdentifier: "PeopleDetail") as! PeopleDetailController

        peopleDetailController.knownInfo = people[indexPath.row].knownFor!

        self.navigationController?.pushViewController(peopleDetailController, animated: true)

    }

}
