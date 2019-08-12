//
//  ViewController.swift
//  Artistry
//
//  Created by Ahmed Yasser on 8/7/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class ArtistTableViewController: UITableViewController {
  var presenter : ArtistPresenter!

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Artists"
    presenter = ArtistPresenterImplementation()
    presenter.viewDidLoad()
    print(presenter.numberOfArtist)

  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfArtist
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell") as! ArtistTableViewCell
    presenter.configure(cell: cell, forRow: indexPath.row)
    return cell
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.didSelect(row: indexPath.row)
  }

}


