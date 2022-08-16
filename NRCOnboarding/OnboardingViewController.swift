//
//  OnboardingViewController.swift
//  NRCOnboarding
//
//  Created by 윤여진 on 2022/08/16.
//

import UIKit

class OnboardingViewController: UIViewController {

    let messages: [OnboardingMessage] = OnboardingMessage.messages
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else { return UICollectionViewCell() }
        
        
        let message = messages[indexPath.item]
        cell.configure(message)
        
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
}
