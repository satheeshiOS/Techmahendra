//
//  ApiService.swift
//  TechMahendra
//
//  Created by Satheesh K on 13/10/20.
//

import Foundation

class APIService :  NSObject {
    
    static let shared = APIService()
    
    private override init() { }

    func apiToGetEmployeeData(completion : @escaping (CountryModel) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                do {
                    let utf8Data = String(decoding: data, as: UTF8.self).data(using: .utf8)
                    let countryData = try JSONDecoder().decode(CountryModel.self, from: utf8Data!)
                    completion(countryData)
                    
                } catch let error {
                    print(error)
                }
                
            }
        }.resume()
    }
}
