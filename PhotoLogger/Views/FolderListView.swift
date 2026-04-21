//
//  FolderListView.swift
//  PhotoLogger
//
//  Created by David Emery on 4/20/26.
//

import SwiftUI

struct FolderListView: View {
    
    @EnvironmentObject var viewModel: PhotoViewModel
    @State private var newFolder = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("New Folder", text: $newFolder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Add") {
                    guard !newFolder.isEmpty else { return }
                    viewModel.folders.append(newFolder)
                    newFolder = ""
                }
            }
            .padding()
            
            List(viewModel.folders, id: \.self) { folder in
                NavigationLink(destination: PhotoGridView(folder: folder)) {
                    Text(folder)
                }
            }
        }
        .navigationTitle("Folders")
    }
}
