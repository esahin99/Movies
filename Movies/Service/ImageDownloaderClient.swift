//
//  ImageDownloaderClient.swift
//  Movies
//
//  Created by Emre Sahin on 7.02.2023.
//

import Foundation

class ImageDownloaderClient: ObservableObject{
    
    @Published var image: Data?
    
    func downloadImage(url: String){
        guard let imageUrl = URL(string: url) else{
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            DispatchQueue.main.async {
                self.image = data
            }
        }.resume()
    }
}
