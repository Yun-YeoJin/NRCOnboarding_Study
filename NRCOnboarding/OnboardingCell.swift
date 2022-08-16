//
//  OnboardingCell.swift
//  NRCOnboarding
//
//  Created by 윤여진 on 2022/08/16.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ message: OnboardingMessage) {
        imageView.image = UIImage(named: message.imageName)
        titleLabel.text = message.title
        descriptionLabel.text = message.description
    }
}

