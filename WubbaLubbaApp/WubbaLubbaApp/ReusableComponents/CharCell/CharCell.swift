//
//  CharCell.swift
//  WubbaLubbaApp
//
//  Created by Murilo Ribeiro de Oliveira on 20/11/23.
//

import SwiftUI

struct CharCell: View {
    @ObservedObject private var viewModel: CharCellViewModel
    

    init(viewModel: CharCellViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack {
            if viewModel.isLoading {
                ProgressView()
                    .frame(width: 50, height: 50)
            } else {
                if let charImage = viewModel.charImage {
                    Image(uiImage: charImage)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                        .shadow(radius: 5)
                }
            }

            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.character.name)
                    .font(.headline)

                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Status: \(viewModel.character.status.rawValue)")
                        Text("Species: \(viewModel.character.species)")
                        Text("Gender: \(viewModel.character.gender.rawValue)")
                    }
                    Spacer()

                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CharCell(viewModel: CharCellViewModel(
        character: Character(
            id: 1,
            name: "Rick Sanchez",
            status: .alive,
            species: "Human",
            type: "",
            gender: .male,
            origin: Origin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
            location: SingleLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2",
            ],
            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
    ))

}
