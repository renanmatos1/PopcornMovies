//
//  KnownForInfo.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 05/12/22.
//

import Foundation

struct KnownForInfo: Codable {
    
    let title: String?
    let overview: String
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double
    let voteCount: Int
    
    var knowForMovieImgUrl: String {
        
        let imgURL = "https://image.tmdb.org/t/p/w500"
        
        return imgURL + (posterPath ?? "") }
    
    enum CodingKeys: String, CodingKey {
        
        case title 
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        
    }
    
}
