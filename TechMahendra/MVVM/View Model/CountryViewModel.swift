//
//  CountryViewModel.swift
//  TechMahendra
//
//  Created by Satheesh K on 13/10/20.
//

import Foundation
import Alamofire

//Viewmodel to handle the data from server and Populating the UIView with updated the data
class CountryViewModel: NSObject {
    
    private(set) var countryModel : CountryModel! {
        didSet {
            self.bindCountryViewModelToController()
        }
    }
    
    //Connecting the viewmodel with updated data to View using completion handler
    var bindCountryViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiToGetData()
    }

    //Fetch data from the server
    func apiToGetData () {
        APIService.shared.apiToGetEmployeeData { (countryDetails) in
            self.countryModel = countryDetails
            self.countryModel?.rows = countryDetails.rows?.filter({ (details) -> Bool in
                if details.title != nil && details.title != nil && details.title != nil {
                    return true
                } else {
                    return false
                }
            })
        }
    }
    
}
