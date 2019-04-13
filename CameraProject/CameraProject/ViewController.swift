//
//  ViewController.swift
//  CameraProject
//
//  Created by yonekan on 2019/03/27.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func runCamera(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = .camera
            cameraPicker.delegate = self
            present(cameraPicker, animated: true, completion: nil)
        } else {
            print("カメラが使用できません")
        }
        
    }
    
    @IBAction func showAlbum(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        } else {
            print("フォトライブラリが使用できません")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: UIButton) {
        let image = imageView.image
        
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(
                image!,
                self,
                #selector(didFinishSavePhoto(_:didFinishSavingWithError:contextInfo:)),
                nil)
        }
    }
    
    @objc func didFinishSavePhoto(_ image: UIImage,
                     didFinishSavingWithError error: NSError!,
                     contextInfo: UnsafeMutableRawPointer) {
        
        if error != nil {
            print("写真の保存に失敗しました。")
            print(error.code)
        } else {
            print("写真を保存しました")
        }
    }
    
}

