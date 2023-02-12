//
//  FilmDetailsViewModel.swift
//  Movies
//
//  Created by Emre Sahin on 12.02.2023.
//

import Foundation

class FilmDetailsViewModel: ObservableObject{
    
    @Published var filmDetails: FilmDetailViewModel?
    let downloaderClient = DownloaderClient()
    
    func getFilmDetail(imdbId: String){
        downloaderClient.downloadFilmDetails(imdbId: imdbId) { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let filmDetail):
                DispatchQueue.main.async {
                    self.filmDetails = FilmDetailViewModel(detail: filmDetail)
                }
            }
        }
    }
    
}

struct FilmDetailViewModel{
    
    let detail: FilmDetails
    var title: String{
        detail.title
    }
    var year: String{
        detail.year
    }
    var genre: String{
        detail.genre
    }
    var director: String{
        detail.director
    }
    var writer: String{
        detail.writer
    }
    var actors: String{
        detail.actors
    }
    var plot: String{
        detail.plot
    }
    var awards: String{
        detail.awards
    }
    var poster: String{
        detail.poster
    }
    var metascore: String{
        detail.metascore
    }
    var imdbRating: String{
        detail.imdbRating
    }
    var imdbId: String{
        detail.imdbId
    }
}
