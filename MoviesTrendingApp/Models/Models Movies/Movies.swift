//
//  Movies.swift
//  MoviesTrendingApp
//
//  Created by Renan de Matos on 02/12/22.
//

import Foundation

struct Movies: Codable {
    
    let title: String
    let voteAvarage: Double
    let voteCount: Int
    let releaseDate: Date
    let posterPath: String
    let overview: String
    var imageUrl: String { // closure para buscar a imagem diretamente //
        
        let imgUrl = "https://image.tmdb.org/t/p/w500"
        
        return imgUrl + posterPath
    }
    
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case voteAvarage = "vote_average"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case overview
        
    }
    
    // func para formatar a data dessa maneira "dd/MM/yyyy" //
    
    func FormatDate() -> String{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
        return dateFormatter.string(from: self.releaseDate)
                
        
    }
}



