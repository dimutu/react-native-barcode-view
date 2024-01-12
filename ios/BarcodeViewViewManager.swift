@objc(BarcodeViewViewManager)
class BarcodeViewViewManager: RCTViewManager {

  override func view() -> (BarcodeViewView) {
    return BarcodeViewView()
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return false
  }
}

class BarcodeViewView : UIView {
  var imageView: UIImageView!

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupLayout()
  }
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }

  func setupLayout() {
    imageView = UIImageView()
    addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    let horizontalConstraint = imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
    let verticalConstraint = imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
    let widthConstraint = imageView.widthAnchor.constraint(equalTo: widthAnchor)
    let heightConstraint = imageView.heightAnchor.constraint(equalTo: heightAnchor)
    addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
  }
    
  @objc var value: String = "" {
    didSet {
      imageView.image = generateBarcode(from: value)
    }
  }
    
  override func layoutSubviews() {
    imageView.image = generateBarcode(from: value)
    super.layoutSubviews()
  }
    
  func generateBarcode(from string: String) -> UIImage? {
    let data = string.data(using: String.Encoding.ascii)
    if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
      filter.setValue(data, forKey: "inputMessage")
      if let output = filter.outputImage {
        let imageSize = output.extent.size
        let transform = CGAffineTransform(scaleX: (frame.width * 2.0) / imageSize.width,
                                          y: (frame.height * 2.0) / imageSize.height)
        let scaledImage = output.transformed(by: transform)
        return UIImage(ciImage: scaledImage)
      }
    }    
    return nil
  }
}
