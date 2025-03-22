//
//  Image.swift
//  ComponentsApp
//
//  Created by apple on 06/03/2025.
//

import Foundation
struct Imagee{
    var Id: Int
    var Path: String
    var IsSync: Bool
    var CaptureDate: Date
    var DateTaken: Date
    var LastModified: Date
}

enum Img {
    // Creating an ImageeDetail object
    static var imagesDetail = [ImageeDetail(
        Id: 101,
        Path: "img1",
        IsSync: true,
        CaptureDate: Date(),
        DateTaken: Date(),
        LastModified: Date(),
        location: Locationn(Id: 1, Name: "New York", Lat: 40.7128, Lon: -74.0060),
        events: [
            Eventt(Id: 1, Name: "Birthday"),
            Eventt(Id: 2, Name: "Wedding"),
            Eventt(Id: 3, Name: "Graduation")
        ],
        persons: [
            Personn(Id: 1, Name: "Kiran", Gender: "F", Path: "p1"),
            Personn(Id: 2, Name: "Salman", Gender: "M", Path: "p2"),
            Personn(Id: 3, Name: "Kashaf", Gender: "F", Path: "p3"),
            Personn(Id: 3, Name: "Aliha", Gender: "F", Path: "p4")
        ]
    ),ImageeDetail(
        Id: 101,
        Path: "img2",
        IsSync: true,
        CaptureDate: Date(),
        DateTaken: Date(),
        LastModified: Date(),
        location: Locationn(Id: 1, Name: "New York", Lat: 40.7128, Lon: -74.0060),
        events: [
            Eventt(Id: 1, Name: "Birthday"),
            Eventt(Id: 2, Name: "Wedding"),
            Eventt(Id: 3, Name: "Graduation")
        ],
        persons: [
            Personn(Id: 1, Name: "Alice", Gender: "M", Path: "BabyGirl"),
            Personn(Id: 2, Name: "Bob", Gender: "M", Path: "BabyGirl"),
            Personn(Id: 3, Name: "Charlie", Gender: "M", Path: "BabyGirl")
        ]
    )
    ]
    
}
