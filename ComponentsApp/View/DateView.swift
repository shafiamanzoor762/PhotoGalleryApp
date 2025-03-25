
import SwiftUI

struct DateView: View {
    @State private var selectedIndex: Int? = nil
    @EnvironmentObject var navManager: NavManager  // Access nav state
    @State private var image = ImgesData.imagesDetail

    private func getSelectedImages() -> [ImageeDetail] {
        var images: [ImageeDetail] = []
        if image.indices.contains(5) {
            images.append(image[5])
        }
        if image.indices.contains(6) {
            images.append(image[6])
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
                            PicturesView(screenName:  {
                                let formatter = DateFormatter()
                                formatter.dateFormat = "yyyy-MM-dd"
                                return formatter.string(from: img.DateTaken)
                            }()
                                         , images: selectedImages)
                        } label: {
                            if img.persons.count>0{
                                CardView(
                                    title: {
                                        let formatter = DateFormatter()
                                        formatter.dateFormat = "yyyy-MM-dd"
                                        return formatter.string(from: img.DateTaken)
                                    }(),
                                    content: "\(index + 1)",
                                    imageURL: img.Path
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
