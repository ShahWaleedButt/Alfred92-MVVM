import UIKit
import OpenAIKit
import Lottie

class SecondScreenVC: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loadingAnimationBoxFour: LottieAnimationView!
    @IBOutlet weak var imageViewFour: UIImageView!
    @IBOutlet weak var loadingAnimationBoxTwo: LottieAnimationView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet weak var loadingAnimationBoxThree: LottieAnimationView!
    @IBOutlet weak var imageViewThree: UIImageView!
    @IBOutlet weak var loadingAnimationBox: LottieAnimationView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var animationOnSearchButton: LottieAnimationView!
    
    var openAI: OpenAI?
    var decodedImages: [UIImage] = []
    var blurView: UIVisualEffectView?
    
    var myViewModel: SecondScreenVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openAI = OpenAI(Configuration(organizationId: "Personal", apiKey: "YOUR_API_KEYS_from_OPENAI"))
        
        myViewModel = SecondScreenVM()
        myViewModel.delegate = self
        textField.delegate = self
        
        self.stopAnimationsOnImageViews()
        self.stopAnimationOnGenerateButton()
        
        roundImageViews()
        tapGesturesForImageViews()
        
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        guard let prompt = textField.text, !prompt.isEmpty else {
            showErrorAlert(message: "Please enter a prompt.")
            return
        }
        
        playAnimationOnGenerateButton()
        playAnimationOnImageViews()
        myViewModel.generateImages(prompt: prompt, openAI: openAI!)
    }
    
    func roundImageViews() {
        let cornerRadius: CGFloat = 8.0
        let imageViews: [UIImageView] = [imageView, imageViewTwo, imageViewThree, imageViewFour]
        
        for imageView in imageViews {
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = cornerRadius
            imageView.layer.masksToBounds = true
        }
    }
    
    func playAnimationOnImageViews() {
        let animationBoxes: [LottieAnimationView] = [loadingAnimationBox, loadingAnimationBoxTwo, loadingAnimationBoxThree, loadingAnimationBoxFour]
        
        for animationBox in animationBoxes {
            animationBox.backgroundColor = .black
            animationBox.layer.cornerRadius = 8
            animationBox.isHidden = false
            animationBox.loopMode = .loop
            animationBox.play()
        }
    }
    
    
    func playAnimationOnGenerateButton(){
        animationOnSearchButton.isHidden = false
        animationOnSearchButton.loopMode = .loop
        animationOnSearchButton.backgroundColor = .black
        animationOnSearchButton.play()
    }
    
    
    
}









