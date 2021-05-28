//
//  APIClient.swift
//  MVVMTest
//
//  Created by Milton Orellana on 26/05/2021.
//

import Foundation
import Alamofire

enum APIClient {
    
    private static func createURL(path: String) -> String {
        let apiKey = "136d9694bc34910894d1b23004e7e663"
        let url = "https://api.themoviedb.org/3/\(path)?api_key=\(apiKey)"
        return url
    }
    
    private static func performQuery(completion: @escaping (Movie) -> Void, request: DataRequest) {
        request.responseData { (response: AFDataResponse<Data>) in
            guard let data = response.data else {
                return
            }
            let decoder = JSONDecoder()
            do{
                let movieSerie = try decoder.decode(Movie.self, from: data)
                
                completion(movieSerie)
                
            } catch {
                print(error)
            }
        }
    }
    
//    static func getTradingSeries(completion: @escaping (MoviesSeries) -> Void) {
//        let request = AF.request(createURL(path: "trending/all/week"), method: .get)
//        performQuery(completion: completion, request: request)
//    }
    
    static func getTrandingMovies(completion: @escaping (Movie) -> Void) {
        let request = AF.request(createURL(path: "trending/movie/week"), method: .get)
        performQuery(completion: completion, request: request)
    }
}
