//
//  BrainTvShow.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 04/12/22.
//

import Foundation

protocol BrainDelegateTvShow{
    
    func successTvShow(decodedData: TvResults)
    func failTvShow(error: Error)
    
}

struct BrainTvShow {
    
    var delegate: BrainDelegateTvShow?
    
    func getApiTvshow() {
        
        let urlString: String = "https://api.themoviedb.org/3/trending/tv/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a"
        
        if let url: URL = URL(string: urlString) {
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "GET"
            request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
                
                if error != nil {
                    print("Error")
                    
                    self.delegate?.failTvShow(error: error!)
                    
                }
                
                if let safeData = data {
                    
                    print(safeData)
                    
                    let tvShow = self.parseJson(safeData)
                    
                    print(tvShow?.results ?? "")
                    
                    self.delegate?.successTvShow(decodedData: tvShow! )
                    
                }
            }
            
            task.resume()
        }
    }
    
        func parseJson(_ decodedData: Data) -> TvResults? {
        
        let decoder = JSONDecoder()
        
        do {
            
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            decoder.dateDecodingStrategy = .formatted(dateFormat)
            
            let decodedData = try decoder.decode(TvResults.self, from: decodedData)
            
            print(decodedData)
            
            return decodedData
            
            } catch {
            
            print(error)
            
            return nil
            
        }
    
    }
    
}
