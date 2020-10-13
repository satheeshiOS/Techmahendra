//
//  ViewController.swift
//  TechMahendra
//
//  Created by Satheesh K on 13/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    private var countryViewModel : CountryViewModel!
    private var countryModel: CountryModel? = nil
    private var refreshControl = UIRefreshControl()
    
    lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = UIColor.clear
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.allowsSelection = false
        tableview.tableFooterView = UIView(frame: .zero)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUILayout()
        callToViewModelForUIUpdate()
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(callToViewModelForUIUpdate), for: .valueChanged)
        tableView.addSubview(refreshControl) // add refresh
    }
    
    //Create constraints on layout
    func setUpUILayout() {
        
        self.view.backgroundColor = .white
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100
        self.view.addSubview(self.tableView)
        
        //Register cell before using it in tableview
        tableView.register(CountryDetailsTableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
    
    // MARK: - ViewModel -> View to update data
    @objc func callToViewModelForUIUpdate(){
        self.countryViewModel =  CountryViewModel() //Initialize and fetch the data
        self.countryViewModel.bindCountryViewModelToController = {
            self.countryModel = self.countryViewModel.countryModel
            //Use Main Thread to update the data
            DispatchQueue.main.async {
                self.navigationItem.title = self.countryModel?.title
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
}

// MARK: - UITableViewDataSource
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    // table view data source methods
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


