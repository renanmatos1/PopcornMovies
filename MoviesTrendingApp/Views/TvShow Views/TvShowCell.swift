//
//  TvShowCell.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 04/12/22.
//

import UIKit

class TvShowCell: UITableViewCell {
    
    
    @IBOutlet weak var tvShowImage: UIImageView!
    @IBOutlet weak var tvShowNameLabel: UILabel!
    @IBOutlet weak var releaseDateTS: UILabel!
    @IBOutlet weak var ratingTsLabel: UILabel!
    @IBOutlet weak var viewTs: UIView!
    @IBOutlet weak var historyLabelTs: UILabel!
    @IBOutlet weak var backgroundImageView: UIView!
    @IBOutlet weak var bdGrey: UIImageView!
    @IBOutlet weak var voteCountLabel: UILabel!
    
    
    var tvShows: TvShows?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func cellSetupTvShow(tvShow: TvShows) {
        
        // layout //
        backgroundImageView.layer.cornerRadius = 10
        backgroundImageView.layer.shadowOpacity = 2
        backgroundImageView.layer.cornerRadius = 12
        tvShowImage.layer.cornerRadius = 12
        bdGrey.layer.cornerRadius = 12
        viewTs.layer.cornerRadius = 12
        viewTs.layer.shadowOpacity = 0.5
        
        // infos //
        tvShowNameLabel.text = tvShow.originalName
        releaseDateTS.text = tvShow.FormatDate()
        ratingTsLabel.text = String(tvShow.voteAvarage)
        historyLabelTs.text = tvShow.overview
        voteCountLabel.text = String(tvShow.voteCount)
        tvShowImage.loadFromTvShow(UrlAdress: tvShow.imageUrl)
        
    }
}

extension UIImageView {
    
    func loadFromTvShow(UrlAdress: String){
        
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

