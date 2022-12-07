//
//  Peoples.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 05/12/22.
//

import Foundation

struct People: Codable {
    
    var name: String
    var popularity: Double
    var knownForDepartment: String
    var profilePath: String?
    var knownFor: [KnownForInfo]?
    var imageUrl: String {
        
        let imgUrl = "https://image.tmdb.org/t/p/w500"
        
        return imgUrl + (profilePath ?? "")
        
    }
    
    enum CodingKeys: String, CodingKey {
        
        case name
        case popularity
        case knownForDepartment = "known_for_department"
        case profilePath = "profile_path"
        case knownFor = "known_for"
        
    }
}
