//
//  Brain.swift
//  MoviesTrendingApp
//
//  Created by Renan de Matos on 02/12/22.
//

import Foundation


protocol BrainDelegate{
    
    func successMovies(decodedData: Result )
    func failMovies(error: Error)
    
}


struct Brain {
    
    var delegate: BrainDelegate?
    
    func getApiMovie() {
        
        let urlString: String = "https://api.themoviedb.org/3/trending/movie/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a"
        
        if let url: URL = URL(string: urlString) {
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "GET"
            request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
                
                if error != nil {
                    
                    self.delegate?.failMovies(error: error!)
                    return
                    
                }
                
                if let safeDate = data {
                    
                    let movies = self.parseJson(safeDate)

                    print("Movies")
                    print(movies ?? "")

                    
                    self.delegate?.successMovies(decodedData: movies!)
                    
                  print(movies ?? "")
                }
            }
            
            task.resume()
        }
    }
    
    
    func parseJson(_ movieData: Data) -> Result? {
        
        let decoder = JSONDecoder()
        
        do {
            
            let decodedData = try decoder.decode(Result.self, from: movieData)
            
            return decodedData
            
            } catch {
            
            print("deu ruim")
            
            return nil
            
        }
    
    }
}
