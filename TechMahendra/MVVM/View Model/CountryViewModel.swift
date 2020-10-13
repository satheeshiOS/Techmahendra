//
//  CountryViewModel.swift
//  TechMahendra
//
//  Created by PPC-INDIA on 13/10/20.
//

import Foundation
import Alamofire

//Viewmodel to handle the data from server and Populating the UIView with updated the data
class CountryViewModel: NSObject {
        
    private var apiService : APIService! //apiservice handler
    
    private(set) var countryModel : CountryModel! {
        didSet {
            self.bindCountryViewModelToController()
        }
    }
    
    var bindCountryViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiToGetData()
    }
    
    func apiToGetData () {
        self.apiService.apiToGetEmployeeData { (countryDetails) in
            self.countryModel = countryDetails
        }
    }
    
}
