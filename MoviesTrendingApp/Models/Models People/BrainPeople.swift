//
//  BrainPeoples.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 05/12/22.
//

import Foundation

protocol BrainDelegatePeople{

    func successPeople(decodedData: PeopleResult)
    func failPeople(error: Error)

}

struct BrainPeople {

    var delegate: BrainDelegatePeople?

    func getApiPeople() {

        let urlString: String = "https://api.themoviedb.org/3/trending/person/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a"

        if let url: URL = URL(string: urlString) {

            var request = URLRequest(url: url)

            request.httpMethod = "GET"
            request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")

            let session = URLSession.shared

            let task = session.dataTask(with: url) { data, response, error in

                if error != nil {
                    print("Error")

                    self.delegate?.failPeople(error: error!)

                }

                if let safeData = data {

                    print(safeData)

                    let people = self.parseJson(safeData)

                    self.delegate?.successPeople(decodedData: people!)

                    print(people?.results ?? "")

                }
            }

            task.resume()
        }
    }

        func parseJson(_ decodedData: Data) -> PeopleResult? {

        let decoder = JSONDecoder()

        do {
            
            
            let decodedData = try decoder.decode(PeopleResult.self, from: decodedData)

            print(decodedData)

            return decodedData

            } catch {

            print(error)

            return nil

        }
    }
}
