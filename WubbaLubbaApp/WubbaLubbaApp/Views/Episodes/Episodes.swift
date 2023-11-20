//
//  Episodes.swift
//  WubbaLubbaApp
//
//  Created by Murilo Ribeiro de Oliveira on 20/11/23.
//

import SwiftUI

struct Episodes: View {
    @StateObject private var viewModel = EpisodesViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                } else {
                    List(viewModel.episodes, id: \.id) { episode in
                        EpisodeCell(episode: episode)
                    }
                }
            }
            .navigationBarTitle("Episodes")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .task {
            await viewModel.fetchEpisodes()
        }
    }
}

#Preview {
    Episodes()
}
