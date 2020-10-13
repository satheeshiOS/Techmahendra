//
//  ViewController.swift
//  TechMahendra
//
//  Created by PPC-INDIA on 13/10/20.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController {

    private var countryViewModel : CountryViewModel!
    private var countryModel: CountryModel? = nil

    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = UIColor.clear
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUILayout()
        callToViewModelForUIUpdate()
    }

    func setUpUILayout() {
        
        self.view.backgroundColor = .white
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100
        self.view.addSubview(self.tableView)
        
        tableView.register(CountryDetailsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
    
    
    func callToViewModelForUIUpdate(){
        self.countryViewModel =  CountryViewModel() //Initialize and fetch the data
        self.countryViewModel.bindCountryViewModelToController = {
            self.countryModel = self.countryViewModel.countryModel
            
            self.countryModel?.rows = self.countryViewModel.countryModel?.rows?.filter({ (details) -> Bool in
                if details.title != nil && details.title != nil && details.title != nil {
                 return true
                } else {
                    return false
                }
            })
                    
            DispatchQueue.main.async {
                self.navigationItem.title = self.countryModel?.title
                self.tableView.reloadData()
            }
        }
    }
        
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryModel?.rows?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryDetailsTableViewCell
        cell.backgroundColor = .white
        if let data = self.countryModel?.rows?[indexPath.row] {
            cell.countryData = data
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
}


