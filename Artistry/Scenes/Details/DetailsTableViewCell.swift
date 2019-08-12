//
//  DetailsTableViewCell.swift
//  Artistry
//
//  Created by Ahmed Yasser on 8/12/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell, DetailsCellView {  
  
  @IBOutlet weak var detailsArtistImageView: UIImageView!
  @IBOutlet weak var detailsArtistName: UILabel!
  @IBOutlet weak var detailsArtistTextView: UITextView!
  
  func display(image: UIImage) {
    self.detailsArtistImageView.image = image
  }
  
  func display(name: String) {
    self.detailsArtistName.text = name
  }
  
  func display(moreInfo: String) {
    self.detailsArtistTextView.text = moreInfo
  }
  

}
