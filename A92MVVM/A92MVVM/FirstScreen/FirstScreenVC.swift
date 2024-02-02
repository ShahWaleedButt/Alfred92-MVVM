

import UIKit
import Lottie

class FirstScreenVC: UIViewController, FirstScreenVMDelegate {

    @IBOutlet weak var myAppName: UIImageView!
    @IBOutlet weak var animatedLogo: LottieAnimationView!
    @IBOutlet weak var nextPageAnimation: LottieAnimationView!

    var viewModel = FirstScreenVM()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        viewModel.animatedLogoControls(animationView: animatedLogo)
        viewModel.nextPageAnimationControls(animationView: nextPageAnimation)
    }

    @IBAction func nextPageButtonTapped(_ sender: UIButton) {
        viewModel.nextPageButtonTapped()
    }

    func nextPageButtonTapped() {
        if let nextScreen = storyboard?.instantiateViewController(withIdentifier: "SecondScreenVC") {
            navigationController?.pushViewController(nextScreen, animated: true)
        } else {
            return
        }
    }
}
