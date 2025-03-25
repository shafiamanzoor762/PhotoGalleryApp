//
//  Cover.swift
//  ComponentsApp
//
//  Created by apple on 02/11/2024.
//

//                Button(action:{
//
//                }, label: {
//                    Image(systemName: "chevron.backward")
//                        .font(.title)
//                    .foregroundColor(.white)
//                    .padding(.bottom, 5)
//                })

import SwiftUI
import AVFoundation

struct Cover: View {
    
    let images: [String] = ["BabyGirl", "BabyGirl", "BabyGirl", "BabyGirl"]
    @State var viewName: String = "Label"
    @State var isNavigate: Bool = false
    @State private var path: [String] = []
    
    @State private var isShowingCamera = false
    @State private var capturedImage: UIImage?
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navBarState: NavBarState
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                
//                if(viewName == "Search" ||
//                   viewName == "Sync" ||
//                   viewName == "Settings"){
//                    NavigationLink(
//                        destination: Cover2(TabviewName:viewName),
//                        isActive: $isNavigate
//                    ) {
////                        EmptyView()
//                    }
//                    .hidden()
//                    
//                }
//                else {
                    // Top Bar
                    HStack {
                        Text(viewName)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        
                        Spacer()
                        
                        Menu {
                            Button(action: {
                                path.append("Search")
                                navBarState.isHidden = true
                                dismiss()
                                //viewName = "Search"
                                //isNavigate = true
                            }) {
                                Label("Search", systemImage: "magnifyingglass")
                            }
                            
                            Button(action: {
                                path.append("Sync")
                                navBarState.isHidden = true
                                dismiss()
                                //viewName = "Sync"
                                //isNavigate = true
                            }) {
                                Label("Sync", systemImage: "arrow.trianglehead.2.clockwise.rotate.90")
                            }
                            
                            Button(action: {
                                navBarState.isHidden = true
                                //viewName = "Settings"
                                //isNavigate = true
                            }) {
                                Label("Bulk Edit", systemImage: "rectangle.and.pencil.and.ellipsis")
                            }
                            
                            Button(action: {
                                navBarState.isHidden = true
                                //viewName = "Settings"
                                //isNavigate = true
                            }) {
                                Label("Undo Changes", systemImage: "arrow.uturn.backward")
                            }
                        }
                        label: {
                            Image(systemName: "ellipsis")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Defs.seeGreenColor)
                
                    
                    //NavigationLink("", destination: Cover2(), isActive: .constant(false))
                    
                    ZStack {
                        Color.white
                            .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .topRight]))
                        
                        VStack {
                            
                            if(viewName == "Label"){
                                LabelView()
                            }
                            else if(viewName == "People"){
                                PeopleView()
                            }
                            else if(viewName == "Location"){
                                LocationView()
                            }
                            else if(viewName == "Event"){
                                EventView()
                            }
                            else if(viewName == "Date"){
                                DateView()
                            }
                            
                            Spacer()
                            // Display selected image
                            if let image = capturedImage {
                                            Image(uiImage: image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 300)
                                                .cornerRadius(10)
                                                .padding()
                                        }
                            // Floating Button
                            HStack {
                                Spacer()
                                Button(action: {
                                    isShowingCamera = true
                                    print("Camera button tapped")
                                }) {
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Defs.seeGreenColor)
                                        .clipShape(Circle())
                                        .shadow(radius: 4)
                                }.padding(.top, -155)
                                    .padding()
                                    .fullScreenCover(isPresented: $isShowingCamera) {
                                                    CameraView(isPresented: $isShowingCamera, capturedImage: $capturedImage)
                                                }
                            }
                        }
                        //.padding(.top)
                    }.ignoresSafeArea(edges: .bottom)
                        .padding(.top, -25)
                    
//                }
                
            }.background(Defs.seeGreenColor.ignoresSafeArea())
                .navigationDestination(for: String.self) { value in
                    Cover2(TabviewName: value)
                }
        }
        .navigationBarBackButtonHidden(false)
        .tint(.black)
    }
}

// Camera View
struct CameraView: View {
    @Binding var isPresented: Bool
    @Binding var capturedImage: UIImage?
    
    var body: some View {
        CameraPreview(capturedImage: $capturedImage, isPresented: $isPresented)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CameraPreview: UIViewControllerRepresentable {
    @Binding var capturedImage: UIImage?
    @Binding var isPresented: Bool
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> CameraViewController {
        let cameraVC = CameraViewController()
        cameraVC.delegate = context.coordinator
        return cameraVC
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {}
    
    class Coordinator: NSObject, CameraViewControllerDelegate {
        var parent: CameraPreview

        init(_ parent: CameraPreview) {
            self.parent = parent
        }

        func didCapture(image: UIImage) {
            parent.capturedImage = image
            parent.isPresented = false
        }
    }
}

protocol CameraViewControllerDelegate: AnyObject {
    func didCapture(image: UIImage)
}

class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var photoOutput: AVCapturePhotoOutput!
    weak var delegate: CameraViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }

    func setupCamera() {
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo

        guard let backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("No camera available")
            return
        }

        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            if captureSession.canAddInput(input) {
                captureSession.addInput(input)
            }
        } catch {
            print("Error setting up camera: \(error)")
        }

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)

        photoOutput = AVCapturePhotoOutput()
        if captureSession.canAddOutput(photoOutput) {
            captureSession.addOutput(photoOutput)
        }

        let captureButton = UIButton(frame: CGRect(x: (view.frame.width - 70) / 2, y: view.frame.height - 100, width: 70, height: 70))
        captureButton.layer.cornerRadius = 35
        captureButton.backgroundColor = .white
        captureButton.layer.borderWidth = 3
        captureButton.layer.borderColor = UIColor.black.cgColor
        captureButton.addTarget(self, action: #selector(capturePhoto), for: .touchUpInside)
        
        view.addSubview(captureButton)

        captureSession.startRunning()
    }

    @objc func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: self)
    }

    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation(),
              let image = UIImage(data: imageData) else {
            return
        }
        delegate?.didCapture(image: image)
    }
}

#Preview {
    Cover()
}
