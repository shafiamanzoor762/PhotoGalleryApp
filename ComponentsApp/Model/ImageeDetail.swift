//
//  ImageeDetails.swift
//  ComponentsApp
//
//  Created by apple on 14/03/2025.
//

import Foundation
struct ImageeDetail{
    var Id: Int
    var Path: String
    var IsSync: Bool
    var CaptureDate: Date
    var DateTaken: Date
    var LastModified: Date
    var location: Locationn
    var events: [Eventt]
    var persons: [Personn]
}

enum ImgesData {
    // Creating an ImageeDetail object
    static var imagesDetail = [
        ImageeDetail(
        Id: 1,
        Path: "img1",
        IsSync: true,
        CaptureDate: Date(),
        DateTaken: Date(),
        LastModified: Date(),
        location: Locationn(Id: 1, Name: "Islamabad Pakistan", Lat: 40.7128, Lon: -74.0060),
        events: [
            Eventt(Id: 1, Name: "Birthday"),
            Eventt(Id: 2, Name: "Wedding")
        ],
        persons: [
            Personn(Id: 1, Name: "Kiran", Gender: "F", Path: "p8"),
            Personn(Id: 2, Name: "Salman", Gender: "M", Path: "p12"),
            Personn(Id: 3, Name: "Kashaf", Gender: "F", Path: "p18")
        ]
    ),ImageeDetail(
        Id: 2,
        Path: "img2",
        IsSync: true,
        CaptureDate: Date(),
        DateTaken: Date(),
        LastModified: Date(),
        location: Locationn(Id: 2, Name: "BIIT", Lat: 40.7128, Lon: -74.0060),
        events: [
            Eventt(Id: 3, Name: "Ceremony")
        ],
        persons: [
            Personn(Id: 4, Name: "Sir Noman", Gender: "M", Path: "p3")
        ]
    ),ImageeDetail(
        Id: 3,
        Path: "img3",
        IsSync: true,
        CaptureDate: Date(),
        DateTaken: Date(),
        LastModified: Date(),
        location: Locationn(Id: 3, Name: "BIIT", Lat: 40.7128, Lon: -74.0060),
        events: [
            Eventt(Id: 4, Name: "Debate")
        ],
        persons: [
            Personn(Id: 5, Name: "Sir Ahsan", Gender: "M", Path: "p5")
        ]
    ),ImageeDetail(
        Id: 4,
        Path: "img4",
        IsSync: true,
        CaptureDate: Date(),
        DateTaken: Date(),
        LastModified: Date(),
        location: Locationn(Id: 4, Name: "Islamabad Pakistan", Lat: 40.7128, Lon: -74.0060),
        events: [
            Eventt(Id: 5, Name: "Birthday"),
            Eventt(Id: 6, Name: "Wedding")
        ],
        persons: [
            Personn(Id: 6, Name: "Ali", Gender: "M", Path: "p16"),
            Personn(Id: 7, Name: "Salman", Gender: "M", Path: "p9"),
            Personn(Id: 8, Name: "Raza", Gender: "M", Path: "p2"),
            Personn(Id: 9, Name: "Saim", Gender: "M", Path: "p1")
        ]
    ),ImageeDetail(
        Id: 5,
        Path: "img5",
        IsSync: true,
        CaptureDate: Date(),
        DateTaken: Date(),
        LastModified: Date(),
        location: Locationn(Id: 5, Name: "Islamabad Pakistan", Lat: 40.7128, Lon: -74.0060),
        events: [
            Eventt(Id: 7, Name: "Birthday"),
            Eventt(Id: 8, Name: "Wedding")
        ],
        persons: [
            Personn(Id: 10, Name: "Kashaf", Gender: "F", Path: "p18")
        ]
    ),ImageeDetail(
        Id: 6,
        Path: "img6",
        IsSync: true,
        CaptureDate: Date(),
        DateTaken: Date(),
        LastModified: Date(),
        location: Locationn(Id: 6, Name: "BIIT", Lat: 40.7128, Lon: -74.0060),
        events: [
            Eventt(Id: 9, Name: "Prize Distribution"),
            Eventt(Id: 10, Name: "Cyber Security Club")
        ],
        persons: [
            Personn(Id: 11, Name: "Sir Afraisaib", Gender: "M", Path: "p10"),
            Personn(Id: 12, Name: "Sir Shahid", Gender: "M", Path: "p11"),
            Personn(Id: 13, Name: "Saim", Gender: "M", Path: "p17")
        ]
    ),ImageeDetail(
        Id: 7,
        Path: "img7",
        IsSync: true,
        CaptureDate: Date(),
        DateTaken: Date(),
        LastModified: Date(),
        location: Locationn(Id: 7, Name: "Islamabad Pakistan", Lat: 40.7128, Lon: -74.0060),
        events: [
            Eventt(Id: 11, Name: "Birthday"),
            Eventt(Id: 12, Name: "Wedding")
        ],
        persons: [
        ]
    ),ImageeDetail(
        Id: 8,
        Path: "img8",
        IsSync: true,
        CaptureDate: Date(),
        DateTaken: Date(),
        LastModified: Date(),
        location: Locationn(Id: 1, Name: "Islamabad Pakistan", Lat: 40.7128, Lon: -74.0060),
        events: [
            Eventt(Id: 13, Name: "Birthday"),
            Eventt(Id: 14, Name: "Wedding")
        ],
        persons: [
        ]
    )
    ]
    
}
