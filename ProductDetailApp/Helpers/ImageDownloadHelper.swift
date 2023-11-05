//
//  ImageDownloadHelper.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import UIKit

class ImageDownloadHelper {
    
    let session: URLSession
    
    private var images = NSCache<NSString, NSData>()
    static let shared = ImageDownloadHelper()
    
    private init() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    private func download(imageURL: URL, completion: @escaping (Data?) -> (Void)) {
      if let imageData = images.object(forKey: imageURL.absoluteString as NSString) {
        print("using cached images")
        completion(imageData as Data)
        return
      }
      
      let task = session.downloadTask(with: imageURL) { localUrl, response, error in
          if error != nil {
          completion(nil)
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
          completion(nil)
          return
        }
        
        guard let localUrl = localUrl else {
          completion(nil)
          return
        }
        
        do {
          let data = try Data(contentsOf: localUrl)
          self.images.setObject(data as NSData, forKey: imageURL.absoluteString as NSString)
          completion(data)
        } catch {
          completion(nil)
        }
      }
      
      task.resume()
    }
    
    func image(urlString: String, completion: @escaping (Data?) -> (Void)) {
        guard let url = URL(string: urlString) else {return}
        download(imageURL: url, completion: completion)
    }
    
    func image(data: Data?) -> UIImage? {
      if let data = data {
        return UIImage(data: data)
      }
      return UIImage(named: "img")
    }
}

