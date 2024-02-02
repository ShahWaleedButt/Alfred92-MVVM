import UIKit

extension SecondScreenVC {
    
    func showImageOptions(image: UIImage) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let downloadAction = UIAlertAction(title: "Download", style: .default) { (_) in
            DispatchQueue.main.async {
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
            }
        }

        let openAction = UIAlertAction(title: "Open", style: .default) { (_) in
            self.openImage(image: image)
        }

        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(downloadAction)
        alertController.addAction(openAction)
        alertController.addAction(dismissAction)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    

    func openImage(image: UIImage) {
        let imageViewController = UIViewController()
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = imageViewController.view.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        imageViewController.view.addSubview(imageView)

        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeImageView))
        imageViewController.navigationItem.rightBarButtonItem = closeButton

        let navigationController = UINavigationController(rootViewController: imageViewController)

        present(navigationController, animated: true, completion: nil)
    }

    
    
    @objc func closeImageView() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print("Error saving image: \(error.localizedDescription)")
        } else {
            print("Image saved successfully.")
        }
        DispatchQueue.main.async {
            self.blurView?.removeFromSuperview()
        }
    }
    

    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
