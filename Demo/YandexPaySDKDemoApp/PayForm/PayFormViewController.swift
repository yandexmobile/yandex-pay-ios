import UIKit

final class PayFormViewController: UIViewController {
    var viewModel: PayFormViewModel? = nil

    // Создайте кнопку
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Ваша красивая кнопка", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(UIColor(named: "blueDark"), for: .normal)
        button.backgroundColor = UIColor(named: "blue")
        button.layer.borderColor = UIColor(named: "blueDark")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16

        button.addTarget(self, action: #selector(openPayForm), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.descriptionText
        label.numberOfLines = 4
        label.font = .systemFont(ofSize: 12)
        label.textColor = .separator
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()



    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        // Добавьте кнопку в иерархию
        view.addSubview(button)
        view.addSubview(descriptionLabel)

        // Установите layout для кнопки
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            button.widthAnchor.constraint(equalToConstant: 280),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -50),
            descriptionLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20)
        ])
    }
}

private extension PayFormViewController {
    @objc
    func openPayForm() {
        viewModel?.openPayForm()
    }
}

extension PayFormViewController {
    enum Constants {
        static let descriptionText = "Вы можете добавить таргет открытия формы на любовой объект. Например, так и сделано с этой кнопкой"
    }
}
