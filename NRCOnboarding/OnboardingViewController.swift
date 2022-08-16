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
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = . zero
            
            //pageControl 동그라미 갯수 몇 개 만들건지 설정
            pageControl.numberOfPages = messages.count
            
        }
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
}

//스크롤 되고 있는 상황을 파악하기
extension OnboardingViewController: UIScrollViewDelegate {
   
    //감속하면서 멈출 때 PageControl의 currentPage가 넘어간다.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        pageControl.currentPage = index
    }
}
