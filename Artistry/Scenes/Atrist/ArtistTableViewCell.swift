//
//  ArtistTableViewCell.swift
//  Artistry
//
//  Created by Ahmed Yasser on 8/9/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell, ArtistCellView {
  @IBOutlet weak var artistImageView: UIImageView!
  @IBOutlet weak var artistBio: UILabel!
  @IBOutlet weak var artistName: UILabel!

  func display(image: UIImage) {
    artistImageView.image = image
  }
  
  func display(bio: String) {
    artistBio.text = bio
  }
  
  func display(name: String) {
    artistName.text = name
  }
  
  

}
