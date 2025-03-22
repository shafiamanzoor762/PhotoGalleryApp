import SwiftUI

struct LabelView: View {
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    @State var imageList = [Imagee]()
    
    var body: some View {
        ScrollView {
            //Text("This is the home screen")
            LazyVGrid(columns: columns, spacing: 20) {
                // Add your CardViews here
                ForEach(imageList, id:\.self.Id) { img in
                    ImageCard(ImageURL: img.Path)
                        
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
                
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

//struct HomeScreenView: View{
//    @State var name = ""
//    
//    var body: some View {
//        VStack{
//            CustomTextField(
//                placeholder: "Name",
//                text: $name,
//                systemImageString: "person"
//                                    )
//        }
//    }
//}

//import SwiftUI
//import UIKit
//
//struct HomeScreenView: View {
//    @State private var image: UIImage?
//    @State private var filePath: URL?
//    @State private var name: String = ""
//    @State private var event: String = ""
//    @State private var location: String = ""
//    @State private var receivedImage: UIImage?
//    @State private var tags: [String: String] = [:]
//    @State private var errorMessage: String?
//    
//    var body: some View {
//        VStack {
//            // Image selection and display
//            if let image = image {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 200)
//            } else {
//                Text("Select an Image")
//                    .frame(height: 200)
//                    .background(Color.gray.opacity(0.2))
//            }
//            
//            // Input fields for tags
//            TextField("Name", text: $name)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            TextField("Event", text: $event)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            TextField("Location", text: $location)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            
//            HStack {
//                ButtonComponent(title: "Select Image", action: selectImage)
//                
//                ButtonComponent(title: "Tag Image", action: tagImage)
//                .disabled(filePath == nil || name.isEmpty || event.isEmpty || location.isEmpty)
//            }
//            
//            if let receivedImage = receivedImage {
//                Image(uiImage: receivedImage)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 200)
//            }
//            
//            // Display tags
//            if let errorMessage = errorMessage {
//                Text(errorMessage)
//                    .foregroundColor(.red)
//            } else {
//                ForEach(tags.keys.sorted(), id: \.self) { key in
//                    Text("\(key.capitalized): \(tags[key] ?? "")")
//                }
//            }
//        }
//        .padding()
//    }
//    
//    // Function to select an image from the photo library
//    private func selectImage() {
//        let picker = UIImagePickerController()
//        picker.sourceType = .photoLibrary
//        picker.delegate = ImagePickerDelegate(image: $image, filePath: $filePath)
//        if let rootVC = UIApplication.shared.windows.first?.rootViewController {
//            rootVC.present(picker, animated: true)
//        }
//    }
//
//    // Function to send the image and tags to the server
//    private func tagImage() {
//        guard let filePath = filePath else { return }
//        
//        let url = URL(string: "http://127.0.0.1:5000/tagimage")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        
//        let boundary = UUID().uuidString
//        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        
//        var body = Data()
//        
//        // Append image data
//        if let imageData = image?.jpegData(compressionQuality: 1.0) {
//            body.append("--\(boundary)\r\n".data(using: .utf8)!)
//            body.append("Content-Disposition: form-data; name=\"file\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
//            body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
//            body.append(imageData)
//            body.append("\r\n".data(using: .utf8)!)
//        }
//        
//        // Append tags as JSON
//        let jsonTags = ["name": name, "event": event, "location": location]
//        if let jsonData = try? JSONSerialization.data(withJSONObject: jsonTags, options: []) {
//            body.append("--\(boundary)\r\n".data(using: .utf8)!)
//            body.append("Content-Disposition: form-data; name=\"tags\"\r\n\r\n".data(using: .utf8)!)
//            body.append(jsonData)
//            body.append("\r\n".data(using: .utf8)!)
//        }
//        
//        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
//        
//        request.httpBody = body
//        
//        // Send the request
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    self.errorMessage = "Error: \(error.localizedDescription)"
//                }
//                return
//            }
//            
//            guard let data = data else {
//                DispatchQueue.main.async {
//                    self.errorMessage = "No data received."
//                }
//                return
//            }
//            
//            // Handle server response (for example: to receive tagged image)
//            DispatchQueue.main.async {
//                self.receivedImage = UIImage(data: data)
//                self.errorMessage = nil
//                self.tags = [:] // Clear previous tags if needed
//            }
//        }.resume()
//    }
//}
//
//// Custom delegate for image picker
//class ImagePickerDelegate: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    @Binding var image: UIImage?
//    @Binding var filePath: URL?
//    
//    init(image: Binding<UIImage?>, filePath: Binding<URL?>) {
//        _image = image
//        _filePath = filePath
//    }
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let pickedImage = info[.originalImage] as? UIImage {
//            image = pickedImage
//            if let url = info[.imageURL] as? URL {
//                filePath = url
//            }
//        }
//        picker.dismiss(animated: true, completion: nil)
//    }
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//    }
//}


//import PhotosUI
//
//struct HomeScreenView: View {
//    @State private var selectedImage: UIImage? = nil
//    @State private var imageUrl: URL? = nil
//    @State private var imageTags: [String: String] = [:]
//    
//    @State private var name: String = ""
//    @State private var event: String = ""
//    @State private var location: String = ""
//    
//    @State private var showImagePicker = false
//    @State private var showAlert = false
//    @State private var alertMessage = ""
//    
//    var body: some View {
//        VStack {
//            if let image = selectedImage {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 250)
//            } else {
//                Rectangle()
//                    .fill(Color.gray.opacity(0.5))
//                    .frame(height: 250)
//                    .overlay(Text("Select Image").foregroundColor(.white))
//            }
//            
//            // Buttons to pick image or send to server
//            HStack {
//                Button("Select Image") {
//                    showImagePicker = true
//                }
//                .padding()
//                
//                Button("Tag Image") {
//                    if let imageUrl = imageUrl {
//                        sendImageWithTags(imageUrl: imageUrl)
//                    }
//                }
//                .padding()
//                .disabled(selectedImage == nil)
//            }
//            
//            // Metadata form
//            Form {
//                Section(header: Text("Tags")) {
//                    TextField("Name", text: $name)
//                    TextField("Event", text: $event)
//                    TextField("Location", text: $location)
//                }
//            }
//            
//            // Display extracted tags
//            if !imageTags.isEmpty {
//                VStack(alignment: .leading) {
//                    Text("Extracted Tags:")
//                    Text("Name: \(imageTags["name"] ?? "")")
//                    Text("Event: \(imageTags["event"] ?? "")")
//                    Text("Location: \(imageTags["location"] ?? "")")
//                }
//                .padding()
//            }
//        }
//        .sheet(isPresented: $showImagePicker) {
//            ImagePicker(image: $selectedImage, imageUrl: $imageUrl)
//        }
//        .alert(isPresented: $showAlert) {
//            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//        }
//    }
//    
//    func sendImageWithTags(imageUrl: URL) {
//        let url = URL(string: "http://192.168.64.2:5000/tagimage")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        
//        let boundary = UUID().uuidString
//        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
////
//        print(imageUrl.absoluteString,name,event,location)
//        
//        var body = Data()
//        
//        // Append image data
//        if let imageData = try? Data(contentsOf: imageUrl) {
//            body.append("--\(boundary)\r\n".data(using: .utf8)!)
//            body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(imageUrl.lastPathComponent)\"\r\n".data(using: .utf8)!)
//            body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
//            body.append(imageData)
//            body.append("\r\n".data(using: .utf8)!)
//        }
//        
//        // Append metadata (tags)
//        let jsonTags = ["name": name, "event": event, "location": location]
//        let jsonData = try? JSONSerialization.data(withJSONObject: jsonTags, options: [])
//        body.append("--\(boundary)\r\n".data(using: .utf8)!)
//        body.append("Content-Disposition: form-data; name=\"tags\"\r\n".data(using: .utf8)!)
//        body.append("Content-Type: application/json\r\n\r\n".data(using: .utf8)!)
//        body.append(jsonData!)
//        body.append("\r\n".data(using: .utf8)!)
//        
//        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
//        
//        // Send the request
//        let task = URLSession.shared.uploadTask(with: request, from: body) { data, response, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    alertMessage = "Error: \(error.localizedDescription)"
//                    showAlert = true
//                }
//                return
//            }
//            
//            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                DispatchQueue.main.async {
//                    alertMessage = "Server error or no response"
//                    showAlert = true
//                }
//                return
//            }
//            
//            DispatchQueue.main.async {
//                // Handle the received image (if any) or extract the metadata
//                if let receivedImage = UIImage(data: data) {
//                    self.selectedImage = receivedImage
//                    self.alertMessage = "Image received and updated successfully."
//                    self.showAlert = true
//                }
//            }
//        }
//        task.resume()
//    }
//}
//
////struct ContentView_Previews: PreviewProvider {
////    static var previews: some View {
////        ContentView()
////    }
////}
//
//
//struct ImagePicker: UIViewControllerRepresentable {
//    @Binding var image: UIImage?
//    @Binding var imageUrl: URL?
//    
//    func makeUIViewController(context: Context) -> PHPickerViewController {
//        var config = PHPickerConfiguration()
//        config.filter = .images
//        let picker = PHPickerViewController(configuration: config)
//        picker.delegate = context.coordinator
//        return picker
//    }
//    
//    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    class Coordinator: NSObject, PHPickerViewControllerDelegate {
//        var parent: ImagePicker
//        
//        init(_ parent: ImagePicker) {
//            self.parent = parent
//        }
//        
//        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//            picker.dismiss(animated: true)
//            
//            guard let provider = results.first?.itemProvider else { return }
//            
//            if provider.canLoadObject(ofClass: UIImage.self) {
//                provider.loadObject(ofClass: UIImage.self) { image, _ in
//                    self.parent.image = image as? UIImage
//                }
//            }
//            
//            provider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { url, _ in
//                if let url = url {
//                    self.parent.imageUrl = url
//                }
//            }
//        }
//    }
//}
//
