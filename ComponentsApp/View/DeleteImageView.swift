//
//  DeleteImageView.swift
//  ComponentsApp
//
//  Created by apple on 23/03/2025.
//

import SwiftUI

struct DeleteImageView: View {
    @State var image: ImageeDetail
    
    var body: some View {
        VStack(alignment: .leading){
            Button(action: {}, label: {
                HStack{
                    Image(systemName: "photo.badge.exclamationmark")
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                    Text("Delete Metadata")
                        .foregroundStyle(.white)
                        .font(.title3)
                }
            }).padding()
            
            Button(action: {}, label: {
                HStack{
                    Image(systemName: "trash.square.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                    Text("Delete Image")
                        .foregroundStyle(.white)
                        .font(.title3)
                }
            })
            .padding()
        }
    }
}

#Preview {
    //DeleteImageView()
}
