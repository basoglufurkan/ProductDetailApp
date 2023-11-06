//
//  ProductDetailsService.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import Foundation

import Foundation

protocol ProductDetailsServiceProtocol {
    func getBasicDetails(completion: @escaping (_ success: Bool, _ results: Product?, _ error: String?) -> ())
    func getSocialDetails(completion: @escaping (_ success: Bool, _ results: Social?, _ error: String?) -> ())
}

class ProductDetailsService: ProductDetailsServiceProtocol {
    func getBasicDetails(completion: @escaping (Bool, Product?, String?) -> ()) {
        RequestHelper().GET(dataFor: .product) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Product.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse Employees to model")
                }
            } else {
                completion(false, nil, "Error: Employees GET Request failed")
            }
        }
    }
    
    func getSocialDetails(completion: @escaping (Bool, Social?, String?) -> ()) {
        RequestHelper().GET(dataFor: .social) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Social.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse Employees to model")
                }
            } else {
                completion(false, nil, "Error: Employees GET Request failed")
            }
        }
    }
}
