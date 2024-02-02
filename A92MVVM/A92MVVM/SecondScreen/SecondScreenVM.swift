import Foundation
import UIKit
import OpenAIKit

protocol SecondScreenVMDelegate: AnyObject {
    func updateImageViews(images: [UIImage])
    func handleError(message: String)
    func hideSearchButtonAnimation()
    func stopAnimationOnGenerateButton()
    func stopAnimationsOnImageViews()
}

class SecondScreenVM {
    weak var delegate: SecondScreenVMDelegate?
    var decodedImages: [UIImage] = []

    func generateImages(prompt: String, openAI: OpenAI) {
        Task {
            do {
                let parameters = ImageParameters(prompt: prompt, numberofImages: 4, resolution: .medium, responseFormat: .base64Json)
                let result = try await openAI.createImage(parameters: parameters)

                print("Received \(result.data.count) images")

                decodedImages.removeAll()

                for i in 0..<min(result.data.count, 4) {
                    if let image = try? openAI.decodeBase64Image(result.data[i].image) {
                        decodedImages.append(image)
                        print("Appended image to decodedImages")
                    }
                }
               
                await delegate?.updateImageViews(images: decodedImages)
                

            } catch {
                print("Error generating images: \(error)")

                   if let openAIError = error as? OpenAIKit.OpenAIErrorResponse {
                       print("OpenAI Error Code: \(openAIError.error)")
                       print("OpenAI Error Message: \(openAIError.localizedDescription)")
                   }
                await delegate?.handleError(message: "Error generating images: \(error.localizedDescription)")
            }
        }
    }
}
