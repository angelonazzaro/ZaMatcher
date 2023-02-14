//
//  Meeter.swift
//  OpenMeetLite
//
//  Created by Yuri on 14/02/23.
//

import Foundation

struct Meeter: Codable {
    var name: String
    var surname: String
    var gender: String
    var searchingGender: String
    var age: Int
    var interests: String
    var latitude: Double
    var longitude: Double
}


func doStoreMeeter(meeter: Meeter){
    do {
        // Create JSON Encoder
        let encoder = JSONEncoder()

        // Encode Note
        let data = try encoder.encode(meeter)

        // Write/Set Data
        UserDefaults.standard.set(data, forKey: "user")

    } catch {
        print("Unable to Encode Note (\(error))")
    }

}

func doRetrieveMeeter() -> Meeter{
    if let data = UserDefaults.standard.data(forKey: "user") {
        do {
            // Create JSON Decoder
            let decoder = JSONDecoder()

            // Decode Note
            let meeter = try decoder.decode(Meeter.self, from: data)
            return meeter

        } catch {
            print("Unable to Decode Note (\(error))")
        }
    }
    
    return Meeter(name: "", surname: "", gender: "", searchingGender: "", age: 0, interests: "", latitude: 0.0, longitude: 0.0)
}
