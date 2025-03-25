//
//  EditView.swift
//  ComponentsApp
//
//  Created by apple on 23/03/2025.
//

import SwiftUI

struct EditView: View {
    @State var image: ImageeDetail
    
    var body: some View {
        VStack {
            Text("Edit \(image.Path)")
            Spacer()
        }
        //.navigationTitle("Edit Image")
    }
}

#Preview {
    //EditView()
}
