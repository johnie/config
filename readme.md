<div align="center">
<h1 align="center">
<svg xmlns="http://www.w3.org/2000/svg" width="66" height="66" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-package"><path d="m7.5 4.27 9 5.15"/><path d="M21 8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16Z"/><path d="m3.3 7 8.7 5 8.7-5"/><path d="M12 22V12"/></svg>
<br>CONFIG</h1>
<h3>My personal setup of dotfiles and applications</h3>

<p align="center">
<img src="https://img.shields.io/github/license/johnie/config?style=flat-square&color=5D6D7E" alt="GitHub license" />
<img src="https://img.shields.io/github/last-commit/johnie/config?style=flat-square&color=5D6D7E" alt="git-last-commit" />
<img src="https://img.shields.io/github/commit-activity/m/johnie/config?style=flat-square&color=5D6D7E" alt="GitHub commit activity" />
<img src="https://img.shields.io/github/languages/top/johnie/config?style=flat-square&color=5D6D7E" alt="GitHub top language" />
</div>
</p>

---

## 📖 Table of Contents

- [📖 Table of Contents](#-table-of-contents)
- [📍 Overview](#-overview)
- [📦 Prerequisites](#-prerequisites)
- [📂 Repository Structure](#-repository-structure)
- [🚀 Getting Started](#-getting-started)
  - [🔧 Installation](#-installation)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

---

## 📍 Overview

This repository contains a collection of dotfiles and scripts for setting up a development environment quickly and efficiently. The included scripts automate the process of installing necessary applications and configuring your system to your preferences.

---

## 📦 Prerequisites

- Unix-like operating system (MacOS, Linux, etc.)
- `git` installed on your machine
- `curl` or `wget` for downloading files (if not included in the install script)

---

## 📂 Repository Structure

```sh
└── config/
    ├── .config/
    │   ├── karabiner/
    │   │   ├── automatic_backups/
    │   │   └── karabiner.json
    │   ├── nvim/
    │   │   ├── after/
    │   │   ├── colors/
    │   │   ├── init.vim
    │   │   ├── macos.vim
    │   │   ├── maps.vim
    │   │   ├── plug.vim
    │   │   └── windows.vim
    │   ├── sheldon/
    │   │   └── plugins.toml
    │   └── starship.toml
    ├── init/
    │   ├── vscode_extensions.json
    │   └── vscode_settings.json
    ├── scripts/
    │   ├── fresh.sh
    │   ├── git_config.sh
    │   ├── macos.sh
    │   ├── ssh.sh
    │   └── vscode.sh
    └── setup/
        ├── aliases
        ├── colors
        ├── editorconfig
        ├── exports
        ├── extra
        ├── functions
        ├── gitconfig
        ├── gitignore
        └── zshrc

```

---

## 🚀 Getting Started

### 🔧 Installation

1. Clone the config repository:

```sh
git clone https://github.com/johnie/config
```

2. Change to the project directory:

```sh
cd config
```

3. Run the Install Script

```sh
chmod +x install.sh
./install.sh
```

---

## 🤝 Contributing

Contributions are welcome! Here are several ways you can contribute:

- **[Report Issues](https://github.com/johnie/config/issues)**: Submit bugs found or log feature requests.

#### _Contributing Guidelines_

<details closed>
<summary>Click to expand</summary>

1. **Fork the Repository**: Start by forking the project repository to your GitHub account.
2. **Clone Locally**: Clone the forked repository to your local machine using a Git client.
   ```sh
   git clone <your-forked-repo-url>
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear and concise message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to GitHub**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.

Once your PR is reviewed and approved, it will be merged into the main branch.

</details>

---

## 📄 License

This project is protected under the [MIT License](https://github.com/johnie/config/license.md).
