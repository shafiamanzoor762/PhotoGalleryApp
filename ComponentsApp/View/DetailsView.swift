//
//  DetailsView.swift
//  ComponentsApp
//
//  Created by apple on 14/03/2025.
//

import SwiftUI

struct ImageDetailsView: View {
    @State var image: ImageeDetail
    
    @State private var showPopup = false // Track popup visibility
    
    let columns = [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10)
        ]
    
    var body: some View {
        ZStack {
            VStack {
                //Defs.seeGreenColor
                
                Text("Details for image: \(image.Path)")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                //                            RoundedRectangle(cornerRadius: 30)
                //                                .fill(Defs.seeGreenColor)
                //                                .frame(height: 300)
                //.padding(.top, 300)
                
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Name")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        VStack{
                            Text(image.persons.first?.Name ?? "No Name")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Image(image.persons.first?.Path ?? "")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40,height: 40)
                                .clipped().padding(.top, -15)
                        }
                            //Image(systemName: "plus")
                        Text("more..")
                            .padding(.top, 55)
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    withAnimation {
                                        showPopup = true
                                    }
                                }
                    }
                    Divider().background(.white)
                    
                    //                                HStack {
                    //                                    Text("Name")
                    //                                        .font(.headline)
                    //                                        .foregroundColor(.white)
                    //                                    Spacer()
                    //                                    Text("Ahmed")
                    //                                        .font(.headline)
                    //                                        .foregroundColor(.white)
                    //                                }
                    //                                Divider()
                    HStack {
                        Text("Gender")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Text(image.persons.first?.Gender ?? "Not Mention")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    Divider().background(.white)
                    HStack {
                        Text("Location")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Text(image.location.Name)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    Divider().background(.white)
                    
                    HStack {
                        Text("Event")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Text("Eid")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    Divider().background(.white)
                    
                    HStack {
                        Text("Date")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Text("12.12.2023")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(20)
            
            // Popup View
            if showPopup {
                ZStack {
                    // Background Overlay to Dismiss on Tap
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                showPopup = false
                            }
                        }
                    
                    // Popup Content
                    VStack {
                        HStack {
//                            Text("Select Gender")
//                                .font(.footnote)
//                                .foregroundColor(.black)
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    showPopup = false
                                }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        
//                        HStack {
//                            Text("Male")
//                            Spacer()
//                            Text("Female")
//                        }
//                        .padding()
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach($image.persons, id:\.self.Id) { $person in
                                    DetailsPersonCardView(person: $person)
                                }
                            }
                            .padding()
                        }
                        
//                        Button("Save") {
//                            withAnimation {
//                                showPopup = false
//                            }
//                        }
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .clipShape(Capsule())
                    }
                    .frame(width: 380, height: 280)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                }
            }
        }
        //.navigationTitle("Image Details")
    }
}

#Preview {
    //DetailsView()
}
