//
//  DetailsTableViewCell.swift
//  Artistry
//
//  Created by Ahmed Yasser on 8/12/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell, DetailsCellView {  
  
  @IBOutlet private weak var detailsArtistImageView: UIImageView!
  @IBOutlet private weak var detailsArtistName: UILabel!
  @IBOutlet private weak var detailsArtistTextView: UITextView!
  
  func display(image: UIImage) {
    self.detailsArtistImageView.image = image
  }
  
  func display(name: String) {
    self.detailsArtistName.text = name
  }
  
  func display(moreInfo: String) {
    self.detailsArtistTextView.text = moreInfo
  }
  
  func update() {
    if self.detailsArtistTextView.text == "Select for info" {
      self.detailsArtistTextView.textAlignment = .center
      self.detailsArtistTextView.textColor = .red
      self.detailsArtistName.textColor = .black
    } else {
      self.detailsArtistTextView.textAlignment = .left
      self.detailsArtistName.textColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
      self.detailsArtistTextView.textColor = .black
    }
  }

}
