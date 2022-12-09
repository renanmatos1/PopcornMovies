//
//  ViewController.swift
//  MoviesTrendingApp
//
//  Created by Renan de Matos on 02/12/22.
//

import UIKit

class MoviesHomeController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var viewActivityIndicator: UIView!
    @IBOutlet weak var activityIndicator:
    
    UIActivityIndicatorView!
    
    var movies: [Movies] = []
    var moviesBrain = Brain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.dataSource = self
        tableView.delegate = self
        moviesBrain.delegate = self
        moviesBrain.getApiMovie()
        showLoaderMovies()
        self.title = "Movies"
        
    }
    
    // metodo para ACTIVITY INDICATOR //
    func showLoaderMovies() {
            self.viewActivityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
            self.view.isUserInteractionEnabled = false

        }

    func hideLoaderMovies() {
        self.viewActivityIndicator.isHidden = true
        self.activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = true
    }
}


extension MoviesHomeController: BrainDelegate {
    
    
    func successMovies(decodedData: Result) {
        
        DispatchQueue.main.async {
            
            self.hideLoaderMovies()
            self.movies = decodedData.results
            self.tableView.reloadData()
        }
    }
    
    func failMovies(error: Error) {
        
        return
    }
}



