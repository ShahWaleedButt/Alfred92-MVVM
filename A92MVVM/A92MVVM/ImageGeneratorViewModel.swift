/*import Foundation
import UIKit
import OpenAIKit
import Lottie

protocol ImageGeneratorViewModelDelegate: AnyObject {
    func imagesDidLoad(images: [UIImage])
    func showError(message: String)
}

class ImageGeneratorViewModel {
    weak var delegate: ImageGeneratorViewModelDelegate?
    var openAI: OpenAI?

    init(openAI: OpenAI) {
        self.openAI = openAI
    }

    func generateImages(prompt: String) async {
        guard let openAI = openAI else { return }

        do {
            let parameters = ImageParameters(prompt: prompt, numberofImages: 4, resolution: .medium, responseFormat: .base64Json)
            let result = try await openAI.createImage(parameters: parameters)

            print("Received \(result.data.count) images")

            var decodedImages: [UIImage] = []

            for i in 0..<min(result.data.count, 4) {
                if let image = try? openAI.decodeBase64Image(result.data[i].image) {
                    decodedImages.append(image)
                }
            }

            delegate?.imagesDidLoad(images: decodedImages)
        } catch {
            if let openAIError = error as? OpenAIErrorResponse {
                let errorMessage = openAIError.error.message ?? "Unknown error"
                delegate?.showError(message: errorMessage)
            } else {
                delegate?.showError(message: error.localizedDescription)
            }
        }
    }
}


*/
