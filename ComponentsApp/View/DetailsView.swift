//
//  DetailsView.swift
//  ComponentsApp
//
//  Created by apple on 14/03/2025.
//

import SwiftUI

struct ImageDetailsView: View {
    @State var image: ImageeDetail
    
    var body: some View {
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
                                        
                                        Image("BabyGirl")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 40,height: 40)
                                            .clipped().padding(.top, -15)
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
                                    Text("Islamabad")
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
        
        
        
        //.navigationTitle("Image Details")
    }
}

#Preview {
    //DetailsView()
}
