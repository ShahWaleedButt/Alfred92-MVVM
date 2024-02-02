import Foundation
import UIKit

extension SecondScreenVC {
    
    func tapGesturesForImageViews() {
        let imageViews: [UIImageView] = [imageView, imageViewTwo, imageViewThree, imageViewFour]

        for imageView in imageViews {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(sender:)))
            imageView.addGestureRecognizer(tapGestureRecognizer)
            imageView.isUserInteractionEnabled = true
        }
    }

    @objc func imageViewTapped(sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView, let image = imageView.image else { return }
        showImageOptions(image: image)
    }
}
