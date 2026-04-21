//
//  Photo.swift
//  PhotoLogger
//
//  Created by David Emery on 4/20/26.
//

import Foundation
import UIKit

struct Photo: Identifiable, Codable {
    let id = UUID()
    let folderName: String
    let imageData: Data
}
