//
//  CharacterView.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 10/7/23.
//

import SwiftUI

struct CharacterView: View {
    @StateObject var presenter: CharacterPresenter
    private let spacingStack = 25.0
    private let direction = 20.0
    private let sides = 15.0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.hexColor(hex: "#000428"), .hexColor(hex: "#a8e063")], startPoint: .top, endPoint: .bottom)
                .blur(radius: 4)
            ScrollView( [.vertical], showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: spacingStack) {
                    ForEach( presenter.characterList ) { character in
                        NavigationLink (destination: Description(description: character)) {
                            CharacterTableCell(characterCell: character)
                        }
                        .onAppear {
                            let result = presenter.characterList.last
                            if let currentId = result?.id,
                                character.id == currentId {
                                presenter.getList(with: presenter.currentPage)
                            }
                        }
                        Divider().background(.white)
                    }
                }
                .toolbarBackground(Color.hexColor(hex: "#4D695C"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .listStyle(.plain)
                .padding(EdgeInsets(top: direction, leading: sides, bottom: direction, trailing: sides))
                .onAppear {
                    if presenter.characterList.isEmpty {
                        print("ESTA VACIO")
                        presenter.getList(with: 1)
                    }
                }
            }
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView( presenter: CharacterPresenter())
    }
}
