//
//  NTWaterfallViewCell.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 6/30/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import UIKit

class NTWaterfallViewCell :UICollectionViewCell, NTTansitionWaterfallGridViewProtocol{
    var imageName : String?
    var imageViewContent : UIImageView = UIImageView()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGrayColor()
        contentView.addSubview(imageViewContent)
    }
    override func layoutSubviews() {
        print("layoutSubviews-NTWaterfallViewCell")
        super.layoutSubviews()
        imageViewContent.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        // このimageNameはどこで設定されるのだ。
        imageViewContent.image = UIImage(named: imageName!)
    }
    // どのタイミング？
    func snapShotForTransition() -> UIView! {
        let snapShotView = UIImageView(image: self.imageViewContent.image)
        snapShotView.frame = imageViewContent.frame
        return snapShotView
    }
}