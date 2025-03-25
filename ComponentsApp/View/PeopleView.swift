//
//import SwiftUI
//
//struct PeopleView: View {
//    @State private var selectedIndex: Int? = nil
//    
//    @EnvironmentObject var navManager: NavManager  // Access nav state
//    
//    @State private var image = ImgesData.imagesDetail
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                LazyVGrid(columns: [
//                    GridItem(.flexible()),
//                    GridItem(.flexible()),
//                    GridItem(.flexible())
//                ], spacing: 20) {
//                    ForEach(image, id: \.self) { img in
//                        NavigationLink(
//                            tag: image.index(of: img),
//                            selection: $selectedIndex
//                        ) {
//                            PicturesView()
//                        } label: {
//                            CardView(title: img.persons[0].n, content: "\(index + 1)", imageURL: img.Path)
//                                .padding(.top, -10)
//                                .contentShape(Rectangle())
//                                .onTapGesture {
//                                    print("Card \(index + 1) tapped")
//                                    selectedIndex = index
//                                }
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                    }
//                }
//                .padding()
//            }
//            //.navigationTitle("People View")
//        }
//    }
//}



//struct PeopleView: View {
//    var body: some View {
//        NavigationStack {
//            VStack {
//                NavigationLink("Go to PicturesView", destination: PicturesView()).foregroundStyle(Color.red)
//            }
//        }
//    }
//}




import SwiftUI

struct PeopleView: View {
    @State private var selectedIndex: Int? = nil
    @EnvironmentObject var navManager: NavManager  // Access nav state
    @State private var image = ImgesData.imagesDetail

    private func getSelectedImages() -> [ImageeDetail] {
        var images: [ImageeDetail] = []
        if image.indices.contains(5) {
            images.append(image[5])
        }
        if image.indices.contains(7) {
            images.append(image[7])
        }
        return images
    }

    var body: some View {
        let selectedImages = getSelectedImages()  // Compute outside the loop to improve performance
        
        return NavigationStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 20) {
                    ForEach(Array(image.enumerated()), id: \.element.Id) { index, img in
                        
                        NavigationLink(
                            tag: index,
                            selection: $selectedIndex
                        ) {
                            PicturesView(screenName: img.persons.first?.Name ?? "Unknown", images: selectedImages)  // ✅ Pass precomputed value
                        } label: {
                            if img.persons.count>0{
                                CardView(
                                    title: img.persons.first?.Name ?? "Unknown",
                                    content: "\(index % 2 == 0 ? index + 1 : 2)",
                                    imageURL: img.persons.first?.Path ?? "p1"
                                )
                                
                                .padding(.top, -10)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    print("Card \(index + 1) tapped")
                                    selectedIndex = index
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
        }
    }
}
