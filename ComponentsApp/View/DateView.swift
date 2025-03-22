//
//  DateView.swift
//  ComponentsApp
//
//  Created by apple on 02/11/2024.
//

import SwiftUI

struct DateView: View {
//    var body: some View {
//        ScrollView {
//            //Text("This is the home screen")
//            LazyVGrid(columns: [
//                GridItem(.flexible()),
//                GridItem(.flexible()),
//                GridItem(.flexible())
//            ], spacing: 20) {
//                // Add your CardViews here
//                ForEach(0..<10) { index in
//                    NavigationLink(destination: PicturesView(), label: {
//                        CardView(title: "Card Title \(index + 1)", content: "\(index + 1)")
//                            .padding(.top, -10)
//                    })
//                }
//            }.frame(maxWidth: .infinity, maxHeight: .infinity)
//            .padding()
//        }
//    }
    @State private var selectedIndex: Int? = nil

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 20) {
                    ForEach(0..<10, id: \.self) { index in
                        NavigationLink(
                            tag: index,
                            selection: $selectedIndex
                        ) {
                            PicturesView()
                        } label: {
                            CardView(title: "Card Title \(index + 1)", content: "\(index + 1)")
                                .padding(.top, -10)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    print("Card \(index + 1) tapped")
                                    selectedIndex = index
                                }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            //.navigationTitle("People View")
        }
    }
}

#Preview {
    DateView()
}
