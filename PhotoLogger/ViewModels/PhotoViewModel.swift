//
//  PhotoViewModel.swift
//  PhotoLogger
//
//  Created by David Emery on 4/20/26.
//

import Foundation
import UIKit

class PhotoViewModel: ObservableObject {
    
    @Published var folders: [String] = []
    @Published var selectedFolder: String = ""
    @Published var photos: [Photo] = []
    
    private let service = PhotoService.shared
    
    init() {
        loadFolders()
    }
    
    func loadFolders() {
        folders = service.folders()
    }
    
    func loadPhotos(folder: String) {
        selectedFolder = folder
        photos = service.photos(in: folder)
    }
    
    func addPhoto(image: UIImage, folder: String) {
        guard let data = image.jpegData(compressionQuality: 0.8) else { return }
        
        let photo = Photo(folderName: folder, imageData: data)
        service.save(photo: photo)
        
        loadFolders()
        loadPhotos(folder: folder)
    }
}
