//
//  DownloaderClient.swift
//  Movies
//
//  Created by Emre Sahin on 5.02.2023.
//

import Foundation

class DownloaderClient{
    
    func downloadFilms(search: String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void){
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=ef744931") else{
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url){(data, response, error) in
            guard let data = data, error == nil else{
                return completion(.failure(.emptyData))
            }
            guard let filmResponse = try? JSONDecoder().decode(IncomingMovies.self, from: data) else{
                return completion(.failure(.unreadData))
            }
            completion(.success(filmResponse.films))
        }.resume()
        
    }
    
    func downloadFilmDetails(imdbId: String, completion: @escaping (Result<FilmDetails, DownloaderError>) -> Void){
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=ef744931") else{
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            guard let data = data, error == nil else{
                return completion(.failure(.emptyData))
            }
            
            guard let filmDetailsResponse = try? JSONDecoder().decode(FilmDetails.self, from: data) else{
                return completion(.failure(.unreadData))
            }
            completion(.success(filmDetailsResponse))
        }.resume()
    }
}

enum DownloaderError: Error{
    case wrongUrl
    case emptyData
    case unreadData
}
