//
//  CameraView.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 29/05/2024.
//

import SwiftUI

struct CameraView: View {
    
    @ObservedObject var viewModel = CameraViewModel()
    
    @State private var isFocused = false
    @State private var isScaled = false
    @State private var focusLocation: CGPoint = .zero
    @State private var currentZoomFactor: CGFloat = 1.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                //Color.black.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    
                    
                    ZStack {
                        CameraPreview(session: viewModel.session) { tapPoint in
                            isFocused = true
                            focusLocation = tapPoint
                            viewModel.setFocus(point: tapPoint)
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        }
                        .gesture(MagnificationGesture()
                            .onChanged { value in
                                self.currentZoomFactor += value - 1.0 // Calculate the zoom factor change
                                self.currentZoomFactor = min(max(self.currentZoomFactor, 0.5), 10)
                                self.viewModel.zoom(with: currentZoomFactor)
                            }).clipShape(RoundedRectangle(cornerRadius: 30))
                            .padding(5)
                        
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.9) // Adjust frame based on geometry
                        
                        //                        .animation(.easeInOut, value: 0.5)
                        VStack{
                            HStack{
                                Button(action: {
                                    viewModel.switchFlash()
                                }, label: {
                                    Image(systemName: viewModel.isFlashOn ? "bolt.fill" : "bolt.slash.fill")
                                        .font(.system(size: 20, weight: .medium, design: .default))
                                })
                                
                                .accentColor(viewModel.isFlashOn ? .yellow : .white)
                                
                                Spacer()
                                
                                
                                
                            }.padding(.leading, 25)
                                .padding(.top, 35)
                            
                            
                            
                            Spacer()
                            
                            HStack {
                                PhotoThumbnail(image: $viewModel.capturedImage)
                                
                                Spacer()
                                CaptureButton { viewModel.captureImage() }
                                Spacer()
                                
                                //Switch
                                CameraSwitchButton { viewModel.switchCamera() }
                                
                                
                                
                            }
                            
                            .padding()
                            .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.13)
                            .background(RoundedRectangle(cornerRadius: 40).foregroundStyle(.ultraThinMaterial.shadow(.inner(radius: 3)))).frame(width: geometry.size.width)
                            
                        }
                        if isFocused {
                            FocusView(position: $focusLocation)
                                .scaleEffect(isScaled ? 0.8 : 1)
                                .onAppear {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0)) {
                                        self.isScaled = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                            self.isFocused = false
                                            self.isScaled = false
                                        }
                                    }
                                }
                        }
                    }.padding(.bottom, 70)
                    
                    
                }
            }
            .alert(isPresented: $viewModel.showAlertError) {
                Alert(title: Text(viewModel.alertError.title), message: Text(viewModel.alertError.message), dismissButton: .default(Text(viewModel.alertError.primaryButtonTitle), action: {
                    viewModel.alertError.primaryAction?()
                }))
            }
            .alert(isPresented: $viewModel.showSettingAlert) {
                Alert(title: Text("Warning"), message: Text("Application doesn't have all permissions to use camera and microphone, please change privacy settings."), dismissButton: .default(Text("Go to settings"), action: {
                    self.openSettings()
                }))
            }
            .onAppear {
                viewModel.setupBindings()
                viewModel.requestCameraPermission()
            }
        }
    }
    
    func openSettings() {
        let settingsUrl = URL(string: UIApplication.openSettingsURLString)
        if let url = settingsUrl {
            UIApplication.shared.open(url, options: [:])
        }
    }
}

struct PhotoThumbnail: View {
    @Binding var image: UIImage?
    
    var body: some View {
        Group {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
                
            } else {
                Rectangle()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
        }
    }
}

struct CaptureButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Circle()
                .foregroundColor(.white)
                .frame(width: 70, height: 70, alignment: .center)
                .overlay(
                    Circle()
                        .stroke(Color.black.opacity(0.8), lineWidth: 2)
                        .frame(width: 59, height: 59, alignment: .center)
                )
        }
    }
}

struct CameraSwitchButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Circle()
                .foregroundColor(Color.gray.opacity(0.2))
                .frame(width: 40, height: 40, alignment: .center)
                .overlay(
                    Image(systemName: "camera.rotate.fill")
                        .foregroundColor(.white))
        }
    }
}

struct FocusView: View {
    
    @Binding var position: CGPoint
    
    var body: some View {
        Circle()
            .frame(width: 70, height: 70)
            .foregroundColor(.clear)
            .border(Color.yellow, width: 1.5)
            .position(x: position.x, y: position.y)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
