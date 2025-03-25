//
//  EditPersonCardView.swift
//  ComponentsApp
//
//  Created by apple on 23/03/2025.
//

import SwiftUI

struct EditPersonCardView: View {
    @Binding var person: Personn
    
    var body: some View {
        HStack {
            Image(person.Path)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            VStack(alignment: .leading) {
                Text("Name")
                    .font(.caption)
                Text(person.Name)
                    .font(.headline)
                    .foregroundColor(.blue)
                
                Text("Gender")
                    .font(.caption)
                
                Picker("Gender", selection: $person.Gender) {
                    Text("Female").tag("Female")
                    Text("Male").tag("Male")
                }
                .pickerStyle(.segmented)
                .frame(width: 150)
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
        }
    }
}

#Preview {
    //EditPersonCardView()
}
