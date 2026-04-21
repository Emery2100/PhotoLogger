//
//  ContentView.swift
//  PhotoLogger
//
//  Created by David Emery on 4/20/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PhotoViewModel()
    
    var body: some View {
        NavigationView {
            FolderListView()
                .environmentObject(viewModel)
        }
    }
}
