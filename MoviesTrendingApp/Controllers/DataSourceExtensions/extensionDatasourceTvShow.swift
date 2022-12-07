//
//  extensionDatasourceTvShow.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 04/12/22.
//

import Foundation
import UIKit


extension TvShowViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return tvShow.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! TvShowCell

        cell.cellSetupTvShow(tvShow: tvShow[indexPath.row])

        return cell
    }
}
