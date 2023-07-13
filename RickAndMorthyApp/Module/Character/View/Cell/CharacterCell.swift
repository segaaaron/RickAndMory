//
//  CellCharacters.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 11/7/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterTableCell: View {
    
    private var characterCell: Result
    private let imageSize = 60.0
    private let cornerImage = 30.0
    private let shadowRadius = 2.0
    
    init(characterCell: Result) {
        self.characterCell = characterCell
    }
    
    var body: some View {
        ZStack {
            HStack {
                if let currentImage = characterCell.image {
                    AnimatedImage(url: URL(string: currentImage))
                        .resizable()
                        .frame(width: imageSize, height: imageSize)
                        .clipShape(RoundedRectangle(cornerRadius: cornerImage))
                        .animation(.easeOut, value: 5)
                }
                
                VStack {
                    if let currentName = characterCell.name {
                        Text(currentName)
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    if let status = characterCell.status?.rawValue,
                       let species = characterCell.species {
                        Text(status)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(Color.hexColor(hex: "#e96656"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(species)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(Color.hexColor(hex: "#e96656"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                HStack {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct CellCharacters_Previews: PreviewProvider {
    static var previews: some View {
        CharacterTableCell( characterCell: Result(name: "Rick Fake", status: .alive, species: "Humano" ,image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg") )
    }
}
