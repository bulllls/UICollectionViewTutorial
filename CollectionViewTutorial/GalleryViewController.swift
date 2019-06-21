//
//  ViewController.swift
//  CollectionViewTutorial
//
//  Created by Андрей Зубехин on 22/05/2019.
//  Copyright © 2019 MAD. All rights reserved.
//

import UIKit

final class GalleryViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            // 1
            collectionView.delegate = self
            collectionView.dataSource = self
            // 2
            collectionView.register(UINib.init(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")
        }
    }
    
    private var images = [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!, UIImage(named: "image4")!, UIImage(named: "image5")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        let image = images[indexPath.row]
        cell.configure(by: image, count: indexPath.row + 1)
        return cell
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3, height: view.frame.width/3)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
