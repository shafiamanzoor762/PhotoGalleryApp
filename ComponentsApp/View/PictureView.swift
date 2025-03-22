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
    @State private var showEdit = false
    @State private var showDelete = false
    @State private var showDetails = false
    @State private var showInfo = false
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navBarState: NavBarState
    
    @State public var selectedIndex = 0
    var tabCount = 3
    var tabItems: [TabItemDescription] = [
        .init(imageName: "list.bullet", title: "DETAILS"),
        .init(imageName: "pencil", title: "EDIT"),
        .init(imageName: "trash", title: "DELETE")
    ]
    
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
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .padding()
            Spacer()
            
            ZStack {
//                if tabCount == 3{
//                    if selectedIndex == 0 {
//                        print("Details")
//                    } else if selectedIndex == 1 {
//                        print("Edit")
//                    } else if selectedIndex == 2 {
//                        print("Delete")
//                    }
//                }
                GeometryReader { proxy in
                    VStack {
                        Spacer()
                        HStack(alignment: .bottom, spacing: 0){
                            ForEach( 0..<tabItems.count
                                //0..<Defs.tabItems.count
                            ) { (index) in
                                VStack(spacing: 0) {
                                    Spacer()
                                    Rectangle()
                                        .foregroundColor( .clear)
                                        .frame(width: Defs.iconCircleEdge, height: Defs.iconCircleEdge)
                                        .overlay(
                                            ZStack {
                                                tabItems[index].iconView(Defs.seeGreenColor).opacity(self.selectedIndex == index ? 1.0 : 0.0)
                                                tabItems[index].iconView(Defs.accentColor).opacity(self.selectedIndex != index ? 1.0 : 0.0)
                                            }
                                        )
                                        .background(
                                            ZStack {
                                                tabItems[index].labelView(Defs.seeGreenColor).opacity(self.selectedIndex == index ? 1.0 : 0.0)
                                                tabItems[index].labelView(Color.white).opacity(self.selectedIndex != index ? 1.0 : 0.0)
                                            }.offset(Defs.labelOffset)
                                        )
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(height: self.selectedIndex == index ? 26 : 5)
                                }

                                .frame(width: proxy.size.width / CGFloat(tabCount)
                                )
    //                            .frame(width: proxy.size.width * 0.333)
                                //.frame(width: proxy.size.width / CGFloat(Defs.tabItems.count))
                                
                                .contentShape( Rectangle() )
                                .onTapGesture {
                                    withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.7) ) { self.selectedIndex = index }
                                }
                            }
                        }
                        .background(
                            Rectangle()
                                .frame(height: Defs.topFrameSize.height + Defs.tabbarHeight + Defs.bottomSafeArea)
                                .overlay(
                                    Circle()
                                        .foregroundColor(Defs.accentColor)
                                        .frame(width: Defs.iconCircleEdge, height: Defs.iconCircleEdge)
                                        .offset(CGSize(width: tabCount == 5 ? (proxy.size.width / CGFloat(Defs.tabItems.count)) * CGFloat(selectedIndex - 2) : CGFloat(self.selectedIndex - 1) * (proxy.size.width * 0.333)  , height: -29 ))
                                        //.offset(x: (proxy.size.width / CGFloat(Defs.tabItems.count)) * CGFloat(selectedIndex - 2), y: -29)
                                )
                                .foregroundColor(Defs.seeGreenColor)
                                .offset(Defs.bottomSafeAreaOffset)
                                .mask(
                                    VStack(spacing: 0) {
                                        TopFrameView()
                                            .frame(width: Defs.topFrameSize.width, height: Defs.topFrameSize.height)
                                        
                                            .offset(CGSize(width: tabCount == 5 ? (proxy.size.width / CGFloat(Defs.tabItems.count)) * CGFloat(selectedIndex - 2) : CGFloat(self.selectedIndex - 1) * (proxy.size.width * 0.333) , height: 0))
                                            //.offset(x: (proxy.size.width / CGFloat(Defs.tabItems.count)) * CGFloat(selectedIndex - 2))
                                        Rectangle()
                                            .frame(height: Defs.tabbarHeight + Defs.bottomSafeArea)
                                    }.offset(Defs.bottomSafeAreaOffset)
                                )
                                .shadow(color: Color.black.opacity(0.3) , radius: 15, x: 0, y: 0)
                        )
                        .frame(height: Defs.topFrameSize.height + Defs.tabbarHeight)
                    }
                }.ignoresSafeArea(edges: [.trailing, .leading])
                    //.opacity(navBarState.isHidden ? 0 : 1)
                
            }.background(Defs.backgroundColor)
        }
        .onAppear {
            navBarState.isHidden = true
            print("hide")
        }
        .onDisappear {
            navBarState.isHidden = false
            print("unhide")
        }
        .navigationTitle(image.Path)
        .sheet(isPresented: $showEdit) {  // Sheet to show Edit
                    EditImageView(image: image)
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
