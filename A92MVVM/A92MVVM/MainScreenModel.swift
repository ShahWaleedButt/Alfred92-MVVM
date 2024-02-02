// YourModel.swift
import Foundation
import OpenAIKit
import UIKit


class YourModel {
    private var openAI: OpenAI
    
    init(openAI: OpenAI) {
        self.openAI = openAI
    }
    
    func generateImages(prompt: String, completion: @escaping ([UIImage]?, Error?) -> Void) {
        Task {
            do {
                let parameters = ImageParameters(prompt: prompt, numberofImages: 4, resolution: .medium, responseFormat: .base64Json)
                let result = try await openAI.createImage(parameters: parameters)

                var decodedImages: [UIImage] = []

                for i in 0..<min(result.data.count, 4) {
                    if let image = try? openAI.decodeBase64Image(result.data[i].image) {
                        decodedImages.append(image)
                    }
                }

                completion(decodedImages, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}

