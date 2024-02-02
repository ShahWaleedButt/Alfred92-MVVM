
import Foundation
import Lottie

protocol FirstScreenVMDelegate: AnyObject {
    func nextPageButtonTapped()
}

class FirstScreenVM {
    weak var delegate: FirstScreenVMDelegate?

    func animatedLogoControls(animationView: LottieAnimationView) {
        animationView.backgroundColor = .white
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.2
        animationView.play()
    }

    func nextPageAnimationControls(animationView: LottieAnimationView) {
        animationView.backgroundColor = .clear
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.isUserInteractionEnabled = false
        animationView.play()
    }

    func nextPageButtonTapped() {
        delegate?.nextPageButtonTapped()
    }
}
