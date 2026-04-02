<div align="center">
<h1 align="center">
<img src="https://github.com/johnie/config/assets/864992/bf05fd00-48b5-4310-9aaa-0b3f42c7ddb0" alt="Logo"/>
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

This repository contains my tracked shell, editor, terminal, and app configuration, plus bootstrap scripts for linking those files into a fresh machine safely.

---

## 📦 Prerequisites

- Unix-like operating system (MacOS, Linux, etc.)
- `git` installed on your machine
- `curl` for downloading dependencies when needed
- `bash` for the bootstrap scripts

---

## 📂 Repository Structure

```sh
config/
├── Brewfile               # Homebrew packages and casks
├── bootstrap/
│   └── vscode/            # VS Code bootstrap settings/extensions
├── .config/               # tracked XDG config
│   └── zsh/               # aliases/functions split into modules
├── examples/              # local/private config templates
├── scripts/               # link and setup helpers
├── setup/                 # tracked dotfiles linked into $HOME
└── install.sh             # entrypoint for bootstrap commands
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

3. Create symlinks for the tracked dotfiles:

```sh
./install.sh link
```

4. Run the setup doctor:

```sh
./install.sh doctor
```

The doctor checks:

- Homebrew availability
- `Brewfile` satisfaction
- key commands used by the repo
- managed symlink targets
- expected local/private files such as `~/.gitconfig.local`

5. Optional follow-up steps for a fresh machine:

```sh
./install.sh packages
./install.sh macos
./install.sh ssh
./install.sh git
./install.sh vscode
```

`./install.sh packages` runs `brew bundle` against the checked-in `Brewfile`.

You can also run it directly:

```sh
brew bundle --file ./Brewfile
```

## Private And Local Files

Tracked files are meant to be symlinked. Machine-local or secret-bearing files should stay outside the repo.

- `examples/gitconfig.local.example` -> `~/.gitconfig.local`
- `examples/functions.private.example` -> `~/.functions.private`
- `examples/zshrc.local.example` -> `~/.zshrc.local`
- `examples/npmrc.example` -> `~/.npmrc`

The linker backs up any existing target into `~/.dotfiles-backups/<timestamp>/` before replacing it with a symlink.

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
