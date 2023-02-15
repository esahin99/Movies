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
            ZStack {
                ImageView(url: filmDetailViewModel.filmDetails?.poster ?? "placeholder")
                    .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3)
            }.frame(maxWidth: .infinity, alignment: .center)
            
            VStack(alignment: .leading){
                Text(filmDetailViewModel.filmDetails?.title ?? "Title")
                    .font(.title)
                    .bold()
                    .padding()
                
                HStack{
                    Text(filmDetailViewModel.filmDetails?.plot ?? "Film Plot")
                        .fixedSize(horizontal: false, vertical: true)
                }.padding()
                
                HStack{
                    Text("Director:")
                        .bold()
                        .font(.title3)
                    Text(filmDetailViewModel.filmDetails?.director ?? "Director")
                }.padding()
                
                HStack{
                    Text("Writer:")
                        .bold()
                        .font(.title3)
                    Text(filmDetailViewModel.filmDetails?.writer ?? "Writer")
                }.padding()
                
                HStack{
                    Text("Awards:")
                        .bold()
                        .font(.title3)
                    Text(filmDetailViewModel.filmDetails?.awards ?? "Awards")
                }.padding()
                
                HStack{
                    Text("Year:")
                        .bold()
                    Text(filmDetailViewModel.filmDetails?.year ?? "Year")
                }.padding()
            }.padding()
        }.onAppear(perform: {
            self.filmDetailViewModel.getFilmDetail(imdbId: imdbId)
        })
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "tt1375666")
    }
}
