//
//  SwiftUIView.swift
//  ComponentsApp
//
//  Created by apple on 14/03/2025.
//

import SwiftUI

// MARK: - Main Navigation View
struct ContentView1: View {
    var body: some View {
        NavigationView {
            TabView {
                PeopleView1()
                    .tabItem {
                        Label("People", systemImage: "person.3.fill")
                    }
                DateView1()
                    .tabItem {
                        Label("Date", systemImage: "calendar")
                    }
                EventView1()
                    .tabItem {
                        Label("Event", systemImage: "star.fill")
                    }
                LocationView1()
                    .tabItem {
                        Label("Location", systemImage: "map")
                    }
            }
        }
    }
}

// MARK: - People View
struct PeopleView1: View {
    let peopleAlbums = ["John Doe", "Jane Smith", "Alice Johnson"]
    
    var body: some View {
        NavigationView {
            List(peopleAlbums, id: \ .self) { person in
                NavigationLink(destination: AlbumView1(albumName: person)) {
                    Text(person)
                }
            }
            .navigationTitle("People")
        }
    }
}

// MARK: - Date View
struct DateView1: View {
    let dateAlbums = ["2023-05-01", "2023-06-15", "2023-07-20"]
    
    var body: some View {
        NavigationView {
            List(dateAlbums, id: \ .self) { date in
                NavigationLink(destination: AlbumView1(albumName: date)) {
                    Text(date)
                }
            }
            .navigationTitle("Date")
        }
    }
}

// MARK: - Event View
struct EventView1: View {
    let eventAlbums = ["Birthday Party", "Wedding", "Graduation"]
    
    var body: some View {
        NavigationView {
            List(eventAlbums, id: \ .self) { event in
                NavigationLink(destination: AlbumView1(albumName: event)) {
                    Text(event)
                }
            }
            .navigationTitle("Events")
        }
    }
}

// MARK: - Location View
struct LocationView1: View {
    let locations = ["New York", "Los Angeles", "Paris", "London"]
    
    var body: some View {
        NavigationView {
            List(locations, id: \ .self) { location in
                NavigationLink(destination: AlbumView1(albumName: location)) {
                    Text(location)
                }
            }
            .tabItem {
                Label("Location", systemImage: "map")
            }
        }
    }
}

// MARK: - Album View
struct AlbumView1: View {
    @State var albumName: String
    let images = ["image1", "image2", "image3"]
    
    var body: some View {
        ScrollView {
//            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
//                ForEach(images, id: \ .self) { imageName in
//                    NavigationLink(destination: ImageView(image: )) {
//                        Image(systemName: "photo")
//                            .resizable()
//                            .frame(width: 100, height: 100)
//                            .cornerRadius(10)
//                    }
//                }
//            }
//            .padding()
        }
        .navigationTitle(albumName)
    }
}

// MARK: - Image View
struct ImageView: View {
    @State var image: ImageeDetail
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .padding()
            
            HStack {
                NavigationLink("Edit", destination: EditImageView(image: image))
                NavigationLink("Delete", destination: DeleteImageView(image: image))
                Button("Details") {showDetails = true}
            }
            .padding()
        }
        .navigationTitle($image.Path)
        .sheet(isPresented: $showDetails) {  // Sheet to show details
                    ImageDetailsView(image: image)
                        .presentationDetents([.medium, .large])  // Custom sizes for the popup
                        .presentationDragIndicator(.visible) // Show a drag indicator for the popup
                }
    }
}

// MARK: - Edit Image View
struct EditImageView: View {
    @State var image: ImageeDetail
    
    var body: some View {
        VStack {
            Text("Edit \(image.Path)")
            Spacer()
        }
        //.navigationTitle("Edit Image")
    }
}

// MARK: - Delete Image View
struct DeleteImageView: View {
    @State var image: ImageeDetail
    
    var body: some View {
        VStack {
            Text("Are you sure you want to delete this image?")
            Button("Delete", role: .destructive) {
                print("\(image.Path) deleted!")
            }
        }
        //.navigationTitle("Delete Image")
    }
}

// MARK: - Image Details View


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}

