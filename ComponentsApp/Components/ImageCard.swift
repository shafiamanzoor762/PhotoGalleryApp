//
//  SwiftUIView.swift
//  ComponentsApp
//
//  Created by apple on 02/11/2024.
//

import SwiftUI



struct ImageCard: View {
    
    @State var ImageURL = "BabyGirl"
    
    var body: some View {
        Image("\(ImageURL)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFill()
            .frame(width: 90, height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

#Preview {
    ImageCard()
}
