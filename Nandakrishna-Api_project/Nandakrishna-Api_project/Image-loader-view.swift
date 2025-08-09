//
//  Image-loader-view.swift
//  Nandakrishna-Api_project
//
//  Created by Nxt Wave mac mini 3 on 08/08/25.
//

import SwiftUI
import Combine

final class ImageLoader : ObservableObject {
    
    @Published var image : Image? = nil
    
    func load(fromURLString urlString : String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage : View {
    
    var image: Image?
    var body: some View {
        image?.resizable()  ?? Image("food_placeholder").resizable()
    }
}


struct AppetizerRemoteImage : View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString)}
    }
}
