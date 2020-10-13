//
//  File.swift
//  TechMahendra
//
//  Created by PPC-INDIA on 13/10/20.
//

import Foundation

struct CountryModel: Codable {
  let title: String?
  var rows: [DetailsModel]?
}

struct DetailsModel: Codable {
    let title: String?
    let description: String?
    let imageHref: String?
}



