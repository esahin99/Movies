//
//  ContentView.swift
//  Movies
//
//  Created by Emre Sahin on 5.02.2023.
//

import SwiftUI

struct FilmListView: View {
    @ObservedObject var filmListViewModel: FilmListViewModel
    @State var searchFilm = ""
    
    init() {
        self.filmListViewModel = FilmListViewModel()
    }
    
    var body: some View{
        NavigationView{
            VStack{
                TextField("Enter a Movie Name", text: $searchFilm, onCommit:{
                    self.filmListViewModel.searchFilm(filmName: searchFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchFilm)
                })
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                
                List(filmListViewModel.films, id: \.imdbId) { film in
                    NavigationLink(destination: DetailView(imdbId: film.imdbId)) {
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
                            
                            Spacer()
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle(Text("Movies"))
            .background(Color(.systemGray6))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}
