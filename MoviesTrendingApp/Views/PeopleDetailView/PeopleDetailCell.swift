//
//  PeopleDetailCell.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 06/12/22.
//

import UIKit

class PeopleDetailCell: UITableViewCell {

    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var bgGrey: UIImageView!
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var backgroundImageMovie: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }
    
    
    func cellSetupDetailCell(known: KnownForInfo) {
        
        // layout //
        backgroundImageMovie.layer.cornerRadius = 10
        backgroundImageMovie.layer.shadowOpacity = 2
        backgroundImageMovie.layer.cornerRadius = 12
        imageViewMovie.layer.cornerRadius = 12
        bgGrey.layer.cornerRadius = 12
        view.layer.cornerRadius = 12
        view.layer.shadowOpacity = 0.5
        
        // infos //
        movieLabel.text = known.title
        releaseDateLabel.text = known.releaseDate
        voteCountLabel.text = String(known.voteCount)
        ratingLabel.text = String(known.voteCount)
        descriptionLabel.text = known.overview
        imageViewMovie.loadFromPeopleDetail(UrlAdress: known.knowForMovieImgUrl)

    }
}

extension UIImageView {
    
    func loadFromPeopleDetail(UrlAdress: String){
        
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
