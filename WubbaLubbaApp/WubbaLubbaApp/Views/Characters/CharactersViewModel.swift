//
//  CharactersViewModel.swift
//  WubbaLubbaApp
//
//  Created by Murilo Ribeiro de Oliveira on 20/11/23.
//

import SwiftUI

@MainActor
class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = true
    let service = Service()

    func fetchCharacters() async {
        isLoading = true
        defer {
            isLoading = false
        }

        do {
            let response = try await service.getCharacters()
            characters = response.results
        } catch {
            print("Error fetching characters: \(error)")
        }
    }
}
