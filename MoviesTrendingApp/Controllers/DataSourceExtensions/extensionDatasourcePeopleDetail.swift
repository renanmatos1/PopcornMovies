//
//  extensionDataSourcePeopleDetail.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 06/12/22.
//

import Foundation
import UIKit

extension PeopleDetailController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return knownInfo.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! PeopleDetailCell

        cell.cellSetupDetailCell(known: knownInfo[indexPath.row])

        return cell
    }

}
