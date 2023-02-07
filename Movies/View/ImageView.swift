//
//  ImageView.swift
//  Movies
//
//  Created by Emre Sahin on 7.02.2023.
//

import SwiftUI





struct ImageView: View {
    
    let url: String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.downloadImage(url: self.url)
    }
    
    
    
    var body: some View {
        if let data = self.imageDownloaderClient.image{
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        else{
            return Image("placeholder")
                .resizable()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg")
    }
}
