//
//  ImageView.swift
//  ComponentsApp
//
//  Created by apple on 14/03/2025.
//
//B2AFE5
import SwiftUI

struct PictureView: View {
    @State var image: ImageeDetail
    @State var screenName: String
    @State private var showEdit = false
    @State private var showDelete = false
    @State private var showDetails = false
    @State private var showInfo = false
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navBarState: NavBarState
    
//    var tabItems: [TabItemDescription] = [
//        .init(imageName: "photo", title: "PICTURE VIEW"),
//        .init(imageName: "pencil", title: "EDIT"),
//        .init(imageName: "list.bullet", title: "DETAILS"),
//        .init(imageName: "trash", title: "DELETE"),
//        .init(imageName: "info.circle", title: "INFO")
//    ]
    
    var body: some View {
        VStack {
 
            // Top Bar
            HStack {
//                Text("Picture View")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .padding(.bottom, 5)
                
                Spacer()
                
                Menu {
                    Button(action: {
                        showEdit = true
                    }) {
                        Label("Edit", systemImage: "pencil")
                    }
                    
                    Button(action: {
                        showDetails = true
                    }) {
                        Label("Details", systemImage: "list.bullet")
                    }
                    
                    Button(action: {
                        showDelete = true
                    }) {
                        Label("Delete", systemImage: "trash")
                    }
                    Button(action: {
                        showInfo = true
                    }) {
                        Label("Info", systemImage: "info.circle")
                    }
                    
                }
                label: {
                    Image(systemName: "ellipsis")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(Defs.seeGreenColor)
            
            
            Spacer()
            Image(image.Path)
                .resizable()
                .scaledToFit()
                //.frame(width:.infinity)
                .padding()
            Spacer()
            
        }
        .onAppear {
            navBarState.isHidden = true
            print("hide")
        }
        .onDisappear {
            navBarState.isHidden = false
            print("unhide")
        }
        .navigationTitle(screenName)
        
        .sheet(isPresented: $showEdit) {  // Sheet to show Edit
                    EditView(image: image)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Defs.seeGreenColor)
                        .presentationDetents([.medium, .large])  // Custom sizes for the popup
                        .presentationDragIndicator(.visible) // Show a drag indicator for the popup
                }
        .sheet(isPresented: $showDetails) {  // Sheet to show details
                    ImageDetailsView(image: image)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Defs.seeGreenColor)
                        .presentationDetents([.medium, .large])  // Custom sizes for the popup
                        .presentationDragIndicator(.visible) // Show a drag indicator for the popup
                }
        .sheet(isPresented: $showDelete) {
                    DeleteImageView(image: image)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Defs.seeGreenColor)
                        .presentationDetents([.medium, .large])  // Custom sizes for the popup
                        .presentationDragIndicator(.visible) // Show a drag indicator for the popup
                }
        .sheet(isPresented: $showInfo) {  // Sheet to show info
                    InfoImageView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Defs.seeGreenColor)
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible) // Show a drag indicator for the popup
        }
        
    }
}

#Preview {
   //PictureView(image: ImageeDetail())
}
