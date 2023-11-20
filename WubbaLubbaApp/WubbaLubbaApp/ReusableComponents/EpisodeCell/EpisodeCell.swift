//
//  EpisodeCell.swift
//  WubbaLubbaApp
//
//  Created by Murilo Ribeiro de Oliveira on 20/11/23.
//

import SwiftUI

struct EpisodeCell: View {
    var episode: Episode

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Episode \(episode.episode)")
                .font(.headline)
            
            Text(episode.name)
                .font(.subheadline)
                .foregroundColor(.black)

            Text("Air Date: \(episode.air_date)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
