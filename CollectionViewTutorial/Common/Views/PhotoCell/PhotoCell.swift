//
//  PhotoCell.swift
//  CollectionViewTutorial
//
//  Created by Андрей Зубехин on 22/05/2019.
//  Copyright © 2019 MAD. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(by image: UIImage, count: Int) {
        imageView.image = image
        countLabel.text = "\(count)"
    }
}
