//
//  DetailView.swift
//  Movies
//
//  Created by Emre Sahin on 12.02.2023.
//

import SwiftUI

struct DetailView: View {
    
    let imdbId: String
    @ObservedObject var filmDetailViewModel = FilmDetailsViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            HStack{
                Spacer()
                ImageView(url: filmDetailViewModel.filmDetails?.poster ?? "Poster")
                    .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3)
                Spacer()
            }
            
            Text(filmDetailViewModel.filmDetails?.title ?? "Title")
                .font(.title)
                .padding()
            
            Text(filmDetailViewModel.filmDetails?.plot ?? "Film Plot")
                .padding()
            
            Text("Director: \(filmDetailViewModel.filmDetails?.director ?? "Director")")
                .padding()
            
            Text("Writer: \(filmDetailViewModel.filmDetails?.writer ?? "Writer")")
                .padding()
            
            Text("Awards: \(filmDetailViewModel.filmDetails?.awards ?? "Awards")")
                .padding()
            
            Text("Year: \(filmDetailViewModel.filmDetails?.year ?? "Year")")
                .padding()
            
            Spacer()
            
        }.onAppear(perform: {
            self.filmDetailViewModel.getFilmDetail(imdbId: imdbId)
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}
