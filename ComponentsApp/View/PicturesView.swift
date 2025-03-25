//
//  PicturesView.swift
//  ComponentsApp
//
//  Created by apple on 06/03/2025.
//

import SwiftUI

struct PicturesView: View {
//    init() {
//            print("PicturesView loaded")
//        }
    
    @State var screenName: String = "Alina"
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    @State private var selectedIndex: Int? = nil
    @State var images = [ImageeDetail]()
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navBarState: NavBarState
    
    var body: some View {
            ScrollView{
                VStack(alignment: .leading, spacing: 20) {
                    
//                    Text(screenName)
//                        .font(.largeTitle)
//                        .fontWeight(.bold).padding()
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        // Add your CardViews here
                        ForEach(Array(images.enumerated()), id: \.element.Id) { index, img in
                            
//                            ImageCard(ImageURL: "BabyGirl")
//                                .onTapGesture {
//                                    print("Picture \(index + 1) tapped")
//                                    selectedIndex = index
//                                }
                            NavigationLink(destination: PictureView(image: img, screenName:"")) {
                                ImageCard(ImageURL: img.Path)
                            }.onTapGesture {
                                selectedIndex = index
                            }
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                }
            }
            .onAppear {
                //navBarState.isHidden = true
                //dismiss()
            }
            .onDisappear {
                //navBarState.isHidden = false
            }
            .navigationTitle(screenName)
    }

}

#Preview {
//    NavigationStack {
//        PicturesView()
//    }
}
