//import SwiftUI
//
//struct PeopleView: View {
//    @State private var selectedIndex: Int? = nil
//    var body: some View {
//        NavigationStack{
//            ScrollView {
//                //Text("This is the home screen")
//                LazyVGrid(columns: [
//                    GridItem(.flexible()),
//                    GridItem(.flexible()),
//                    GridItem(.flexible())
//                ], spacing: 20) {
//                    // Add your CardViews here
//                    ForEach(0..<10, id: \.self) { index in
//                        Button(action: {selectedIndex = index
//                        }) {
//                            CardView(title: "Card Title \(index + 1)", content: "\(index + 1)")
//                                .padding(.top, -10)
//                        }
//                    }
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .padding()
//            }
//            .navigationTitle("People View")
//                        .navigationDestination(isPresented: Binding(
//                            get: { selectedIndex != nil },
//                            set: { if !$0 { selectedIndex = nil } }
//                        )) {
//                            PicturesView()
//                        }
//        }
//    }
//}



import SwiftUI

struct PeopleView: View {
    @State private var selectedIndex: Int? = nil
    
    @EnvironmentObject var navManager: NavManager  // Access nav state
    
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



//struct PeopleView: View {
//    var body: some View {
//        NavigationStack {
//            VStack {
//                NavigationLink("Go to PicturesView", destination: PicturesView()).foregroundStyle(Color.red)
//            }
//        }
//    }
//}
