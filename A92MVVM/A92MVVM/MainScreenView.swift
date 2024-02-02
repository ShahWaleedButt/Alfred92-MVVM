/*// YourView.swift
import UIKit
import Lottie
import OpenAIKit

class YourView: UIView {
    private var viewModel: YourViewModel
    
    // Connect your outlets here
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingAnimationBox: LottieAnimationView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    init(viewModel: YourViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        commonInit()
        
        // Observe changes in the ViewModel
        viewModel.onImagesUpdated = { [weak self] in
            self?.updateUI()
        }
    }
    
    private func commonInit() {
        // Initialize viewModel if it's not already set
        if viewModel == nil {
            self.viewModel = YourViewModel(model: YourModel(openAI: OpenAI(Configuration(organizationId: "Personal", apiKey: "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"))))
        }

        // Load your view from nib or set up UI components programmatically
        // Example: loadFromNib()
    }
    
    // Set up your UI and update it based on ViewModel changes
    func setupUI() {
        // Configure your UI components
        // Example:
        imageView.image = viewModel.decodedImages.first
    }
    
    // Add functions to handle user interactions and update UI
    func updateUI() {
        // Update your UI based on ViewModel properties
        // Example:
        loadingAnimationBox.isHidden = true
        loadingAnimationBox.stop()
    }
    
    // Example: Load view from nib if applicable
    private func loadFromNib() {
        let nib = UINib(nibName: "YourView", bundle: nil)
        guard let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Could not load YourView from nib.")
        }
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}


*/

/*// YourView.swift
import UIKit
import Lottie
import OpenAIKit

class YourView: UIView {
    private var viewModel: YourViewModel
    
    // Connect your outlets here
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingAnimationBox: LottieAnimationView!
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = YourViewModel(model: YourModel(openAI: OpenAI(Configuration(organizationId: "Personal", apiKey: "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"))))
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        self.viewModel = YourViewModel(model: YourModel(openAI: OpenAI(Configuration(organizationId: "Personal", apiKey: "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"))))
        super.init(frame: frame)
        commonInit()
    }
    
    init(viewModel: YourViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        commonInit()
        
        // Observe changes in the ViewModel
        viewModel.onImagesUpdated = { [weak self] in
            self?.updateUI()
        }
    }
    
    private func commonInit() {
        // Load your view from nib or set up UI components programmatically
        // Example: loadFromNib()
        setupUI()
    }
    
    // Set up your UI and update it based on ViewModel changes
    func setupUI() {
        // Configure your UI components
        // Example:
        imageView.image = viewModel.decodedImages.first
    }
    
    // Add functions to handle user interactions and update UI
    func updateUI() {
        // Update your UI based on ViewModel properties
        // Example:
        loadingAnimationBox.isHidden = true
        loadingAnimationBox.stop()
    }
    
    // Example: Load view from nib if applicable
    private func loadFromNib() {
        let nib = UINib(nibName: "YourView", bundle: nil)
        guard let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Could not load YourView from nib.")
        }
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

*/

import UIKit
import Lottie
import OpenAIKit

class YourView: UIView {
    private var viewModel: YourViewModel
    
    // Connect your outlets here
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingAnimationBox: LottieAnimationView!
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = YourViewModel(model: YourModel(openAI: OpenAI(Configuration(organizationId: "Personal", apiKey: "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"))))
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        self.viewModel = YourViewModel(model: YourModel(openAI: OpenAI(Configuration(organizationId: "Personal", apiKey: "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"))))
        super.init(frame: frame)
        commonInit()
    }
    
    init(viewModel: YourViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        commonInit()
        
        // Observe changes in the ViewModel
        viewModel.onImagesUpdated = { [weak self] in
            self?.updateUI()
        }
    }
    
    private func commonInit() {
        // Load your view from nib or set up UI components programmatically
        // Example: loadFromNib()
        setupUI()
    }
    
    // Set up your UI and update it based on ViewModel changes
    func setupUI() {
        // Configure your UI components
        // Example:
        imageView.image = viewModel.decodedImages.first
    }
    
    // Add functions to handle user interactions and update UI
    func updateUI() {
        // Update your UI based on ViewModel properties
        // Example:
        loadingAnimationBox.isHidden = true
        loadingAnimationBox.stop()
    }
    
    // Example: Load view from nib if applicable
    private func loadFromNib() {
        let nib = UINib(nibName: "YourView", bundle: nil)
        guard let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Could not load YourView from nib.")
        }
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

