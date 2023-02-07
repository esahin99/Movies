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
        self.filmListViewModel.searchFilm(filmName: "dune")
    }
    
    var body: some View{
        NavigationView{
            List(filmListViewModel.films, id: \.imdbId){ (film) in
                HStack{
                    ImageView(url: film.poster)
                        .frame(width: 100, height: 150)
                    VStack(alignment: .leading){
                        Text(film.title)
                            .font(.title3)
                            .foregroundColor(.blue)
                        Text(film.year)
                            .foregroundColor(.orange)
                    }
                }
            }.navigationTitle(Text("Movies"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}
