//
//  TvShows.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 04/12/22.
//

import Foundation


struct TvShows: Codable {
    
    let originalName: String
    let releaseDate: Date
    let voteAvarage: Double
    let voteCount: Int
    let posterPath: String
    let overview: String
    var imageUrl: String {
        
        let imgUrl = "https://image.tmdb.org/t/p/w500"
        
        return imgUrl + posterPath }
        
        enum CodingKeys: String, CodingKey {
            
            case originalName = "original_name"
            case releaseDate = "first_air_date"
            case voteAvarage = "vote_average"
            case voteCount = "vote_count"
            case posterPath = "poster_path"
            case overview
            
            
        }
    
    
    func FormatDate() -> String{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            
        return dateFormatter.string(from: self.releaseDate)
            }
        
    }

