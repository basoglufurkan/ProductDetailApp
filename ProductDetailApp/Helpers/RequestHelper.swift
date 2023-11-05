//
//  RequestHelper.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import Foundation

class RequestHelper {
    func GET(dataFor: LocalFile, complete: @escaping (Bool, Data?) -> ()) {
        guard let data = readLocalJSONFile(forName: dataFor.rawValue) else {
            print("Error: did not receive data")
            complete(false, nil)
            return
        }
        complete(true, data)
    }
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
