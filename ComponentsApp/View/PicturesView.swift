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
    @State private var image = ImageeDetail(
        Id: 101,
        Path: "BabyGirl",
        IsSync: true,
        CaptureDate: Date(),
        DateTaken: Date(),
        LastModified: Date(),
        location: Locationn(Id: 1, Name: "New York", Lat: 40.7128, Lon: -74.0060),
        events: [
            Eventt(Id: 1, Name: "Birthday"),
            Eventt(Id: 2, Name: "Wedding"),
            Eventt(Id: 3, Name: "Graduation")
        ],
        persons: [
            Personn(Id: 1, Name: "Alice", Gender: "M", Path: "BabyGirl"),
            Personn(Id: 2, Name: "Bob", Gender: "M", Path: "BabyGirl"),
            Personn(Id: 3, Name: "Charlie", Gender: "M", Path: "BabyGirl")
        ]
    )
    
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
                        ForEach(0..<10, id: \.self) { index in
                            
//                            ImageCard(ImageURL: "BabyGirl")
//                                .onTapGesture {
//                                    print("Picture \(index + 1) tapped")
//                                    selectedIndex = index
//                                }
                            NavigationLink(destination: PictureView(image: image)) {
                                ImageCard(ImageURL: "BabyGirl")
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
