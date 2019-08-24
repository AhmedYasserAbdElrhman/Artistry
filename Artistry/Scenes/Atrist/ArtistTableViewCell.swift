//
//  ArtistTableViewCell.swift
//  Artistry
//
//  Created by Ahmed Yasser on 8/9/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell, ArtistCellView {
  @IBOutlet private weak var artistImageView: UIImageView!
  @IBOutlet private weak var artistBio: UILabel!
  @IBOutlet private weak var artistName: UILabel!

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
