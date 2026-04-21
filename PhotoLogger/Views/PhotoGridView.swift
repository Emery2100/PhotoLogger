//
//  PhotoGridView.swift
//  PhotoLogger
//
//  Created by David Emery on 4/20/26.
//

import SwiftUI

struct PhotoGridView: View {
    
    @EnvironmentObject var viewModel: PhotoViewModel
    let folder: String
    
    @State private var showPicker = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.photos) { photo in
                        if let uiImage = UIImage(data: photo.imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 150)
                                .clipped()
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadPhotos(folder: folder)
        }
        .navigationTitle(folder)
        .toolbar {
            Button("+") {
                showPicker = true
            }
        }
        .sheet(isPresented: $showPicker) {
            ImagePicker { image in
                viewModel.addPhoto(image: image, folder: folder)
            }
        }
    }
}
