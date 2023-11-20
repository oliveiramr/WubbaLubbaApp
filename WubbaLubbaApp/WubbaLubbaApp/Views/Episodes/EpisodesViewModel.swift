//
//  EpisodesViewModel.swift
//  WubbaLubbaApp
//
//  Created by Murilo Ribeiro de Oliveira on 20/11/23.
//

import SwiftUI

@MainActor
class EpisodesViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    @Published var isLoading: Bool = true
    let service = Service()

    func fetchEpisodes() async {
        isLoading = true
        defer {
            isLoading = false
        }

        do {
            let response = try await service.getEpisodes()
            episodes = response.results

        } catch {
            print("Error fetching episodes: \(error)")
        }
    }
}
