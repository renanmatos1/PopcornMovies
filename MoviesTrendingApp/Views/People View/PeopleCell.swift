//
//  PeopleCell.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 05/12/22.
//

import UIKit

class PeopleCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var imageViewPpl: UIImageView!
    @IBOutlet weak var peopleNameLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var bgGrey: UIImageView!
    @IBOutlet weak var backgroundImgView: UIImageView!
    @IBOutlet weak var buttonNextPage: UIImageView!
    
    var people: People?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
    func cellSetupPplCell(people: People) {
        
        // layout //
        bgGrey.layer.cornerRadius = 10
        bgGrey.layer.shadowOpacity = 2
        bgGrey.layer.cornerRadius = 12
        view.layer.cornerRadius = 12
        view.layer.shadowOpacity = 0.5
        imageViewPpl.layer.cornerRadius = 12
        imageViewPpl.layer.shadowOpacity = 30
        imageViewPpl.layer.shadowRadius = 10
        backgroundImgView.layer.shadowOpacity = 2
        backgroundImgView.layer.cornerRadius = 12
        backgroundImgView.layer.shadowRadius = 10
        
        // esconder a imagem do botão na celula quando for 0 //
        
        if people.knownFor?.count == 0 {
            
            buttonNextPage.isHidden = true
            
        }
        
        // infos //
        peopleNameLabel.text = people.name
        actionLabel.text = people.knownForDepartment
        ratingLabel.text = String(people.popularity)
        imageViewPpl.loadFromPeople(UrlAdress: people.imageUrl)
        
    }
}

extension UIImageView {
    
    func loadFromPeople(UrlAdress: String){
        
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


