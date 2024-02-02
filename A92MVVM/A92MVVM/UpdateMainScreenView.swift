/*// YourViewController.swift
import UIKit
import OpenAIKit
import Lottie

class ViewController: UIViewController {
    private var viewModel: YourViewModel
    
    // Connect your outlets here
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var animationOnSearchButton: LottieAnimationView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loadingAnimationBoxFour: LottieAnimationView!
    @IBOutlet weak var imageViewFour: UIImageView!
    @IBOutlet weak var loadingAnimationBoxTwo: LottieAnimationView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet weak var loadingAnimationBoxThree: LottieAnimationView!
    @IBOutlet weak var imageViewThree: UIImageView!
    @IBOutlet weak var loadingAnimationBox: LottieAnimationView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    init(viewModel: YourViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        // Other setup code
        
        // Bind ViewModel properties to update UI
        viewModel.onImagesUpdated = { [weak self] in
            self?.updateUI()
        }
        
        viewModel.onError = { [weak self] error in
            self?.showErrorAlert(message: error.localizedDescription)
        }
    }
    
    // Add functions to handle user interactions and update ViewModel
    @IBAction func searchButtonTapped(_ sender: Any) {
        guard let prompt = textField.text, !prompt.isEmpty else {
            showErrorAlert(message: "Please enter a prompt.")
            return
        }

        animationOnSearchButton.isHidden = false
        animationOnSearchButton.play()
        playLottieAnimation()

        viewModel.generateImages(prompt: prompt)
    }

    func updateUI() {
        // Update your UI components based on the ViewModel
    }
    
    // Other methods
    
    func playLottieAnimation() {
        let animationBoxes: [LottieAnimationView] = [loadingAnimationBox, loadingAnimationBoxTwo, loadingAnimationBoxThree, loadingAnimationBoxFour]

        for animationBox in animationBoxes {
            animationBox.backgroundColor = .black
            animationBox.layer.cornerRadius = 8
            animationBox.isHidden = false
            animationBox.loopMode = .loop
            animationBox.play()
        }
    }
    
    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
*/
import UIKit
import OpenAIKit
import Lottie

class ViewController: UIViewController {
    private var viewModel: YourViewModel
    
    // Connect your outlets here
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var animationOnSearchButton: LottieAnimationView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loadingAnimationBoxFour: LottieAnimationView!
    @IBOutlet weak var imageViewFour: UIImageView!
    @IBOutlet weak var loadingAnimationBoxTwo: LottieAnimationView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet weak var loadingAnimationBoxThree: LottieAnimationView!
    @IBOutlet weak var imageViewThree: UIImageView!
    @IBOutlet weak var loadingAnimationBox: LottieAnimationView!
    @IBOutlet weak var imageView: UIImageView!
    
    init(viewModel: YourViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = YourViewModel(model: YourModel(openAI: OpenAI(Configuration(organizationId: "Personal", apiKey: "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"))))
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        // Other setup code
        
        // Bind ViewModel properties to update UI
        viewModel.onImagesUpdated = { [weak self] in
            self?.updateUI()
        }
        
        viewModel.onError = { [weak self] error in
            self?.showErrorAlert(message: error.localizedDescription)
        }
    }
    
    // Add functions to handle user interactions and update ViewModel
    @IBAction func searchButtonTapped(_ sender: Any) {
        guard let prompt = textField.text, !prompt.isEmpty else {
            showErrorAlert(message: "Please enter a prompt.")
            return
        }

        animationOnSearchButton.isHidden = false
        animationOnSearchButton.play()
        playLottieAnimation()

        viewModel.generateImages(prompt: prompt)
    }

    func updateUI() {
        // Update your UI components based on the ViewModel
    }
    
    // Other methods
    
    func playLottieAnimation() {
        let animationBoxes: [LottieAnimationView] = [loadingAnimationBox, loadingAnimationBoxTwo, loadingAnimationBoxThree, loadingAnimationBoxFour]

        for animationBox in animationBoxes {
            animationBox.backgroundColor = .black
            animationBox.layer.cornerRadius = 8
            animationBox.isHidden = false
            animationBox.loopMode = .loop
            animationBox.play()
        }
    }
    
    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
