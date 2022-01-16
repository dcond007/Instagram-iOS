//
//  CameraViewController.swift
//  Instagram
//
//  Created by Astronaut Elvis on 1/14/22.
//

import UIKit
import AlamofireImage
import Parse
import Toast_Swift

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var placeholderImageView: UIImageView!
    @IBOutlet weak var commentTextView: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPostImage(_ sender: Any) {
        let post = PFObject(className: "Posts")
        
        post["author"] = PFUser.current()!
        post["caption"] = commentTextView.text!
        
        let imageData = placeholderImageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        post["image"] = file
        
        post.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("image posted")
            } else {
                self.view.makeToast("Error with posting image")
                print ("Error")
            }
        }
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageAspectScaled(toFill: size, scale: 1)
        
        placeholderImageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
}
