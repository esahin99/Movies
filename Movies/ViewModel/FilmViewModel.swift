//
//  FilmViewModel.swift
//  Movies
//
//  Created by Emre Sahin on 6.02.2023.
//

import Foundation
import SwiftUI

class FilmListViewModel: ObservableObject{
    
    @Published var films = [FilmViewModel]()
    let downloaderClient = DownloaderClient()
    
    func searchFilm(filmName: String){
        downloaderClient.downloadFilms(search: filmName) { (result) in
            switch result{
                case.failure(let error):
                    print(error)
                case.success(let filmArray):
                    if let filmArray = filmArray{
                        DispatchQueue.main.async {
                            self.films = filmArray.map(FilmViewModel.init)
                        }
                    }
            }
        }
    }
}

struct FilmViewModel{
    
    let film: Film
    var title: String{
        film.title
    }
    var poster: String{
        film.poster
    }
    var year: String{
        film.year
    }
    var imdbId: String{
        film.imdbId
    }
}
