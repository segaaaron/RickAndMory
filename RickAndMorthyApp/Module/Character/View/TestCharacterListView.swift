//
//  TestCharacterListView.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 12/7/23.
//

import SwiftUI

struct TestCharacterListView: View {
    @StateObject var presenter: CharacterPresenter
    private let spacingStack = 25.0
    private let direction = 5.0
    private let sides = 15.0
    
    var body: some View {
        NavigationView {
            ScrollView( [.vertical], showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: spacingStack) {
                    ForEach( presenter.characterList ) { character in
                        NavigationLink (destination: Description(description: character)) {
                            CharacterTableCell(characterCell: character)
                        }
                        Divider().background(.white)
                    }
                }
                .onAppear {
                    presenter.getList(with: 1)
                }
            }
            .clipped()
        }
        .padding(EdgeInsets(top: direction, leading: sides, bottom: direction, trailing: sides))
    }
}

struct TestCharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        TestCharacterListView(presenter: CharacterPresenter())
    }
}
