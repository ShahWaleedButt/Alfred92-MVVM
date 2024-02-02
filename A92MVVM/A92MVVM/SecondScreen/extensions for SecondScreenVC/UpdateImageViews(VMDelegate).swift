
import Foundation
import Lottie
import UIKit

extension SecondScreenVC: SecondScreenVMDelegate {
  
    func updateImageViews(images: [UIImage]) {
        print("Updating image views...")
        print("Decoded images count: \(decodedImages.count)")
     
        let imageViews: [UIImageView] = [imageView, imageViewTwo, imageViewThree, imageViewFour]
        for (index, image) in images.prefix(4).enumerated() {
            DispatchQueue.main.async{
                self.stopAnimationOnGenerateButton()
                self.stopAnimationsOnImageViews()
            
                imageViews[index].image = image
            }}
    }
    
    func handleError(message: String) {
        
    }
    
    func hideSearchButtonAnimation() {
        DispatchQueue.main.async { [self] in
            self.animationOnSearchButton.isHidden = true
            
            let loadingAnimationBoxes: [LottieAnimationView] = [loadingAnimationBox, loadingAnimationBoxTwo, loadingAnimationBoxThree, loadingAnimationBoxFour]
            
            for animationView in loadingAnimationBoxes {
                animationView.isHidden = true
                animationView.stop()
                
            }
        }
    }
    
    
    func stopAnimationsOnImageViews() {
        let loadingAnimationBoxes: [LottieAnimationView] = [loadingAnimationBox, loadingAnimationBoxTwo, loadingAnimationBoxThree, loadingAnimationBoxFour]

        for animationView in loadingAnimationBoxes {
            animationView.isHidden = true
            animationView.stop()
        }
    }
    
    func stopAnimationOnGenerateButton() {
        searchButton.layer.cornerRadius = 8
       searchButton.imageView?.layer.cornerRadius = 8
        animationOnSearchButton.backgroundColor = .black
        animationOnSearchButton.layer.masksToBounds = true
        animationOnSearchButton.loopMode = .loop
        animationOnSearchButton.isHidden = true
    }
}
