//
//  extensionDatasource.swift
//  MoviesTrendingApp
//
//  Created by Renan de Matos on 02/12/22.
//

import Foundation
import UIKit


extension MoviesHomeController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoviesCell
        
        cell.cellSetup(movies: movies[indexPath.row])
        
        return cell
    }
}
