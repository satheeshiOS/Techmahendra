//
//  CountryDetailsTableViewCell.swift
//  TechMahendra
//
//  Created by PPC-INDIA on 13/10/20.
//

import UIKit
import AlamofireImage

class CountryDetailsTableViewCell: UITableViewCell {

    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .red
        return label
        
    }()
    
    lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var countryDetailImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 25
        img.clipsToBounds = true
        return img
    }()
    
    
    //country data to load after api call
    var countryData:DetailsModel? {
            didSet {
                guard let countryDetails = countryData else {return}
                if let title = countryDetails.title {
                    titleLabel.text = title
                } else {
                    titleLabel.text = ""
                }
                if let desc = countryDetails.description {
                   descriptionLabel.text = desc
                } else {
                    descriptionLabel.text = ""
                }
                if let imageUrl = countryDetails.imageHref  {
                    if let detailImageUrl = URL(string: imageUrl) {
                        self.countryDetailImage.af.setImage(withURL: detailImageUrl, placeholderImage: #imageLiteral(resourceName:"default-placeholder-image"))
                    }
                } else {
                    self.countryDetailImage.image = #imageLiteral(resourceName: "default-placeholder-image")
                }

            }
        }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(self.titleLabel)
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.countryDetailImage)
        setUpUILayout()
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    //Layout Setup
    fileprivate func setUpUILayout() {
        [self.countryDetailImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
         self.countryDetailImage.widthAnchor.constraint(equalToConstant: 50),
         self.countryDetailImage.heightAnchor.constraint(equalToConstant: 50),
         self.countryDetailImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5)].forEach{$0!.isActive = true}
        
        [self.titleLabel.leadingAnchor.constraint(equalTo: self.countryDetailImage.trailingAnchor, constant: 10),
         self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
         self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5)].forEach{$0!.isActive = true}
        
        [self.descriptionLabel.leadingAnchor.constraint(equalTo: self.countryDetailImage.trailingAnchor, constant: 10),
         self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
         self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 0),
         self.descriptionLabel.bottomAnchor.constraint(equalTo:self.bottomAnchor ,constant: -10),
         self.descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20)].forEach{$0!.isActive = true}
    }


}
