//
//  DiscoverController.swift
//  CarouselEffect
//
//  Created by Buse ERKUŞ on 7.04.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

class DiscoverController: UIViewController{
    
   
    @IBOutlet weak var disBar: UINavigationBar!
    @IBOutlet weak var disCollectionView: UICollectionView!
    
    var discover = Discover.fetchInterests()
    let scale: CGFloat = 0.6
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * scale)
        let cellHeight = floor(screenSize.height * scale)
        let insetX = (view.bounds.width - cellWidth) / 4.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = disCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        disCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)

        disCollectionView.dataSource = self
        disCollectionView.delegate = self
        
        func backButton(_ sender: Any) {
            performSegue(withIdentifier: "goBack", sender: self)
        }
    }
}

extension DiscoverController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return discover.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverCollectionCell", for: indexPath) as! DiscoverCollectionCell
        let disc = discover[indexPath.item]
        cell.discover = disc
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

extension DiscoverController: UIScrollViewDelegate, UICollectionViewDelegate{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.disCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        
        let cellWidthIncluedSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncluedSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncluedSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        
        targetContentOffset.pointee = offset    
    }
    
    
}
