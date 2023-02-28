import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var messages = ["010-000-0000", "1566-0000", "1577-0000?", "114?", "112?", "1544"]

    var filteredMessages = [String]()

    var isSearching = false

    let tableView = UITableView()

    let searchBar = UISearchBar()



    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        searchBar.delegate = self

        view.addSubview(tableView)
        view.addSubview(searchBar)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    extension ViewController: UITableViewDelegate, UITableViewDataSource {

        func tableView(_ tableView: UITableView, numberOfRowsInsection section: Int) -> Int
            return 20
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredMessages.count
        } else {
            return messages.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if isSearching {
            cell.textLabel?.text = filteredMessages[indexPath.row]
        } else {
            cell.textLabel?.text = messages[indexPath.row]
        }
        return cell
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "검색" {
            isSearching = false
        } else {
            isSearching = true
            filteredMessages = messages.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
}

func viewDidLoad() {

    let vc1 = UINavigationController(rootViewController: MessageCallViewController())
    let nav1 = UINavigationController(rootViewController: vc1)
    nav1.tabBarItem.image = UIImage(systemName: "square.and.pencil")
}
