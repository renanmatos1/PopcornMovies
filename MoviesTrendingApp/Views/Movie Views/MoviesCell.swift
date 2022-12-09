//
//  TableViewCell.swift
//  MoviesTrendingApp
//
//  Created by Renan de Matos on 02/12/22.
//

import UIKit

class MoviesCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var backgroundImgView: UIView!
    @IBOutlet weak var bdGrey: UIImageView!
    @IBOutlet weak var voteCountLabel: UILabel!
    
    @IBOutlet weak var viewActivity: UIView!
    @IBOutlet weak var activityIndicatorMovies: UIActivityIndicatorView!
    
    var movies: Movies?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func cellSetup(movies: Movies) {
        
        
        
        
        // layout //
        view.layer.cornerRadius = 12
        view.layer.shadowOpacity = 0.5
        backgroundImgView.layer.cornerRadius = 10
        backgroundImgView.layer.shadowOpacity = 2
        backgroundImgView.layer.cornerRadius = 12
        movieImage.layer.cornerRadius = 12
        bdGrey.layer.cornerRadius = 12
        
        // infos //
        movieNameLabel.text = movies.title
        releaseDateLabel.text = movies.FormatDate()
        ratingLabel.text = String(movies.voteAvarage)
        historyLabel.text = movies.overview
        movieImage.loadFrom(UrlAdress: movies.imageUrl)
        voteCountLabel.text = String(movies.voteCount)
        
        
        
    }
    
}
extension UIImageView {
        
        func loadFrom(UrlAdress: String){
            
            guard let url = URL(string: UrlAdress) else {return}
            
            DispatchQueue.global().async {
                let imageData = try? Data(contentsOf: url)
                DispatchQueue.main.async { [weak self] in
                    if let imageData = imageData {
                        if let loadedImage = UIImage(data: imageData) {
                            
                            self?.image = loadedImage
                        }
                    }
                }
            }
        }
    }

