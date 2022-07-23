//
//  HomeViewController.swift
//  Funios-Izlude-Task2
//
//  Created by FauziArda on 24/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var redBox : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var whiteBox : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private var height : CGFloat = 0.0
    func setupViews(){
        view.addSubview(redBox)
        view.addSubview(whiteBox)
        height = view.bounds.height
        
        

        NSLayoutConstraint.activate([
            redBox.topAnchor.constraint(equalTo: view.topAnchor),
            redBox.leftAnchor.constraint(equalTo: view.leftAnchor),
            redBox.trailingAnchor.constraint(equalTo:  view.trailingAnchor),
            redBox.heightAnchor.constraint(equalToConstant: view.bounds.height/2),


            whiteBox.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            whiteBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            whiteBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            whiteBox.topAnchor.constraint(equalTo: redBox.bottomAnchor)


        ])


    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print(UIDevice.current.orientation.isLandscape)
        print(view.bounds.width)
        print(view.bounds.height)
        
        if UIDevice.current.orientation.isPortrait{
            print("Potrait")
            print("width: \(view.bounds.width)")
            print("height: \(view.bounds.height)")
            NSLayoutConstraint.activate([
                redBox.heightAnchor.constraint(equalToConstant: height/2),
            ])
        }
        
        if UIDevice.current.orientation.isLandscape {
            NSLayoutConstraint.activate([
                redBox.heightAnchor.constraint(equalToConstant: view.bounds.width/2),
            
            ])
        }
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


#if DEBUG
import SwiftUI
struct HomeViewController_Preview : PreviewProvider {
    static var previews: some View{
        ViewControllerPreview {
            HomeViewController()
        }
        .previewInterfaceOrientation(.portrait)
    }
}

struct ViewControllerPreview: UIViewControllerRepresentable {
    let viewControllerBuilder: () -> UIViewController
    
    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Not needed
    }
}

#endif
