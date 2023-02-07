//
//  ContentView.swift
//  Movies
//
//  Created by Emre Sahin on 5.02.2023.
//

import SwiftUI

struct FilmListView: View {
    @ObservedObject var filmListViewModel: FilmListViewModel
    
    init(){
        self.filmListViewModel = FilmListViewModel()
        self.filmListViewModel.searchFilm(filmName: "titan")
    }
    
    var body: some View{
        List(filmListViewModel.films, id: \.imdbId){ (film) in
            HStack{
                Image("placeholder")
                    .resizable()
                    .frame(width: 100, height: 150)
                VStack(alignment: .leading){
                    Text(film.title)
                        .font(.title3)
                        .foregroundColor(.blue)
                    Text(film.year)
                        .foregroundColor(.orange)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}
