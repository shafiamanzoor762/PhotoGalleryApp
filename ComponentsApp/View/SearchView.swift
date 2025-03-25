//
//  SearchView.swift
//  ComponentsApp
//
//  Created by apple on 24/11/2024.
//

import SwiftUI
import MapKit

struct SearchView: View {
    @State private var nameInput = ""
    @State private var selectedNames: [String] = ["Alina", "Rimsha", "Aliya", "Esha", "Alishba", "Aliha"]
    @State private var selectedGender: String = ""
    @State private var selectedEvents: [String] = []
    @State private var selectedDates: [String] = ["12.11.2024", "04.01.2022", "01.10.2009", "02.11.2024"]
    @State private var captureDate = Date()
    @State private var events = ["Birthday", "Eid", "Convocation", "Independence Day"]

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 33.6995, longitude: 73.0363), // Default to San Francisco
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @State private var selectedLocations: [MapLocation] = []

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navBarState: NavBarState
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20) {
                //                Text("Search")
                //                    .font(.largeTitle)
                //                    .fontWeight(.bold)
                
                // Name Section
                Text("Name")
                    .font(.headline)
                HStack {
                    TextField("Eman", text: $nameInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        // Logic to add name to the selected list
                        if !nameInput.isEmpty && !selectedNames.contains(nameInput) {
                            selectedNames.append(nameInput)
                            nameInput = ""
                        }
                    }) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Defs.seeGreenColor)
                            .font(.title)
                    }
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(selectedNames, id: \.self) { name in
                            HStack {
                                Text(name)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.gray.opacity(0.2)).foregroundColor(Color.white)
                                    .cornerRadius(12)
                                Button(action: {
                                    // Logic to remove name from the list
                                    selectedNames.removeAll { $0 == name }
                                }) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                }
                            }.frame(width:120, height:35).background(Defs.seeGreenColor).cornerRadius(25)
                        }
                    }
                }
                // Event Section
                Text("Gender")
                    .font(.headline)
                HStack{
                    RadioButton(selectedText: $selectedGender,text: "Male")
                    RadioButton(selectedText: $selectedGender, text:"Female")
                }
                // Event Section
                Text("Event")
                    .font(.headline)
                ForEach(events, id: \.self) { event in
                    HStack {
                        Toggle(isOn: Binding(
                            get: { selectedEvents.contains(event) },
                            set: { isSelected in
                                if isSelected {
                                    selectedEvents.append(event)
                                } else {
                                    selectedEvents.removeAll { $0 == event }
                                }
                            }
                        )) {
                            Text(event)
                        }
                    }
                }
                
                // Capture Date Section
                Text("Capture Date")
                    .font(.headline)
                HStack {
                    DatePicker("", selection: $captureDate, displayedComponents: .date)
                        .labelsHidden()
                    Button(action: {
                        let formatter = DateFormatter()
                        formatter.dateStyle = .short
                        let formattedDate = formatter.string(from: captureDate)
                        if !selectedDates.contains(formattedDate) {
                            selectedDates.append(formattedDate)
                        }
                    }) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Defs.seeGreenColor)
                            .font(.title)
                    }
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(selectedDates, id: \.self) { date in
                            HStack {
                                Text(date)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.gray.opacity(0.2)).foregroundColor(Color.white)
                                    .cornerRadius(12)
                                Button(action: {
                                    // Logic to remove date from the list
                                    selectedDates.removeAll { $0 == date }
                                }) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                }
                            }.frame(width:150, height:35).background(Defs.seeGreenColor).cornerRadius(25)
                        }
                    }
                }
                
                // Location Section
                Text("Location")
                    .font(.headline)
                //                Image("Map") // Replace with the actual image name in your assets
                //                    .resizable()
                //                    .scaledToFit()
                //                    .frame(width: 350)
                //                    .padding(.leading)
                
//                Map(coordinateRegion: .constant(MKCoordinateRegion(
//                    center: CLLocationCoordinate2D(latitude: 30.3753, longitude: 69.3451), // Example: San Francisco
//                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//                )))
//                .frame(height: 300)
//                .cornerRadius(12)
//                .padding(.horizontal)
                
                
                Text("Tap on the map to select a location")
                                .font(.headline)
                                .padding()

                            Map(coordinateRegion: $region, interactionModes: .all, annotationItems: selectedLocations) { location in
                                MapMarker(coordinate: location.coordinate, tint: .red) // Marker at selected location
                            }
                            .frame(height: 300)
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .onTapGesture { location in
                                let coordinate = convertTapToCoordinate(location: location, in: region)
                                let newLocation = MapLocation(coordinate: coordinate)
                                selectedLocations = [newLocation] // Updates the state with new location
                            }
                            
                            // Display selected coordinates
                            if let lastLocation = selectedLocations.last {
                                Text("Latitude: \(lastLocation.coordinate.latitude), Longitude: \(lastLocation.coordinate.longitude)")
                                    .padding()
                            }

                            Spacer()
                
                ButtonComponent(title: "Search", action: {}).padding(.leading, 100)
                // Search Button
                //                Button(action: {
                //                    // Logic for search
                //                }) {
                //                    Text("Search")
                //                        .frame(maxWidth: .infinity)
                //                        .padding()
                //                        .background(Defs.seeGreenColor)
                //                        .foregroundColor(.white)
                //                        .cornerRadius(10)
                //                }
            }
            .padding()
        }.onAppear {
            navBarState.isHidden = true
        }
        .onDisappear {
            navBarState.isHidden = false
        }
    }
}

// MARK: - Identifiable Struct for Locations
struct MapLocation: Identifiable {
    let id = UUID() // Unique identifier for SwiftUI
    let coordinate: CLLocationCoordinate2D
}

// MARK: - Convert Tap to Coordinate Function
func convertTapToCoordinate(location: CGPoint, in region: MKCoordinateRegion) -> CLLocationCoordinate2D {
    let mapSize = UIScreen.main.bounds
    let lat = region.center.latitude + (Double(location.y / mapSize.height) - 0.5) * region.span.latitudeDelta
    let lon = region.center.longitude + (Double(location.x / mapSize.width) - 0.5) * region.span.longitudeDelta
    return CLLocationCoordinate2D(latitude: lat, longitude: lon)
}

#Preview {
    SearchView()
}
