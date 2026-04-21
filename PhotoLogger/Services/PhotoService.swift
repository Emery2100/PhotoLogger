//
//  PhotoService.swift
//  PhotoLogger
//
//  Created by David Emery on 4/20/26.
//

import Foundation
import UIKit

class PhotoService {
    
    static let shared = PhotoService()
    private let key = "saved_photos"
    
    func save(photo: Photo) {
        var photos = fetchPhotos()
        photos.append(photo)
        
        if let encoded = try? JSONEncoder().encode(photos) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    func fetchPhotos() -> [Photo] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let photos = try? JSONDecoder().decode([Photo].self, from: data) else {
            return []
        }
        return photos
    }
    
    func photos(in folder: String) -> [Photo] {
        fetchPhotos().filter { $0.folderName == folder }
    }
    
    func folders() -> [String] {
        Set(fetchPhotos().map { $0.folderName }).sorted()
    }
}
