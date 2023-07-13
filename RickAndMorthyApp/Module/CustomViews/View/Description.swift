//
//  Description.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 11/7/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct Description: View {
    let description: Result
    
    init(description: Result) {
        self.description = description
    }
    
    var body: some View {
        GeometryReader { viewReader in
            LinearGradient(colors: [.hexColor(hex: "#5b4892"), .hexColor(hex: "#5b492")], startPoint: .top, endPoint: .bottom)
                .blur(radius: 5)
            ZStack(alignment: .top) {
                Color.white.opacity(0.8)
                    .blur(radius: 8, opaque: true)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                VStack(spacing: 20) {
                    HStack {
                        if let currentImage = description.image {
                            AnimatedImage(url: URL(string: currentImage))
                                .resizable()
                                .placeholder(PlatformImage(named: "defaultImage"))
                                .frame(width: 130, height: 130, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 65))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        }
                    }
                    VStack {
                        if let currentName = description.name {
                            Text(currentName)
                                .font(.system(size: 25, weight: .bold, design: .serif))
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding(EdgeInsets(top: -65, leading: 0, bottom: 0, trailing: 0))
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .padding(EdgeInsets(top: 80, leading: 10, bottom: -20, trailing: 10))
        }
    }
}

struct Description_Previews: PreviewProvider {
    static var previews: some View {
        Description(description: Result(name: "Rick Sanchez", status: .alive, species: "humano" ,image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"))
    }
}
