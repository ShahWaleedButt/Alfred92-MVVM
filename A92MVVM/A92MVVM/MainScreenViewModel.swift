// YourViewModel.swift
import Foundation
import UIKit

class YourViewModel {
    private var model: YourModel
    
    var onImagesUpdated: (() -> Void)?
    var onError: ((Error) -> Void)?
    
    var decodedImages: [UIImage] = [] {
        didSet {
            onImagesUpdated?()
        }
    }
    
    init(model: YourModel) {
        self.model = model
    }
    
    func generateImages(prompt: String) {
        model.generateImages(prompt: prompt) { [weak self] images, error in
            guard let self = self else { return }

            if let images = images {
                self.decodedImages = images
            } else if let error = error {
                self.onError?(error)
            }
        }
    }
}
