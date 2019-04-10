//
//  DiscoverCollectionCell.swift
//  CarouselEffect
//
//  Created by Buse ERKUŞ on 7.04.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

class DiscoverCollectionCell: UICollectionViewCell{
    
    @IBOutlet weak var disLabel: UILabel!
    @IBOutlet weak var disBackColor: UIView!
    @IBOutlet weak var disImage: UIImageView!
    @IBOutlet weak var likeBtn: UIButton!
    
    var discover: Discover!{
    
    didSet{
        self.updatedUI()
    }
    }
    func updatedUI(){
        if let discover = discover{
           disImage.image = discover.featuredImage
           disLabel.text = discover.title
           disBackColor.backgroundColor = discover.color
        }else{
            disImage.image = nil
            disLabel.text = nil
            disBackColor.backgroundColor = nil
        }
        disBackColor.layer.cornerRadius = 10.0
        disBackColor.layer.masksToBounds = true
        disImage.layer.cornerRadius = 10.0
        disImage.layer.masksToBounds = true
    }
}
