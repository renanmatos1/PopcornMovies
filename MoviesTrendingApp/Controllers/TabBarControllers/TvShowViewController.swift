//
//  TvShowViewController.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 04/12/22.
//

import UIKit

class TvShowViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var tableViewTvShow: UITableView!
    
    @IBOutlet weak var viewActivityIndicator: UIView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var tvShow: [TvShows] = []
    var tvShowBrain = BrainTvShow()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "TvShows"
        tableViewTvShow.dataSource = self
        tvShowBrain.delegate = self
        showLoaderTvShow()
        tvShowBrain.getApiTvshow()
        
    }
    
    func showLoaderTvShow() {
            self.viewActivityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
            self.view.isUserInteractionEnabled = false

        }

        func hideLoaderTvShow() {
            self.viewActivityIndicator.isHidden = true
            self.activityIndicator.startAnimating()
            self.view.isUserInteractionEnabled = true
    }
}


extension TvShowViewController: BrainDelegateTvShow {
    
    func successTvShow(decodedData: TvResults) {
        DispatchQueue.main.async {
            
            self.hideLoaderTvShow()
            self.tvShow = decodedData.results
            self.tableViewTvShow.reloadData()
            
        }
    }
    func failTvShow(error: Error) {
        DispatchQueue.main.async {
            return
            
        }
    }
}

