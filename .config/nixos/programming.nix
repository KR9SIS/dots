# All things programming.
{
  pkgs,
  ...
}:
{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    # INFO: Shell
    eza
    fzf
    starship
    zoxide
    tmux
    alacritty
    opencode
    fastfetch
    dig
    fd
    typos
    bat
    btop
    file
    graphviz
    grc
    gum
    imagemagick
    jq
    lazygit
    ripgrep
    tldr
    usbutils
    watchexec
    yq
    zip
    unzip
    uv

    # INFO: Neovim
    nodejs
    tree-sitter
    luarocks

    # Bash
    bash-language-server
    shfmt

    # Markdown
    markdownlint-cli2

    # C#
    omnisharp-roslyn
    csharpier

    # C/C++
    clang-tools

    # Go
    gofumpt
    gopls
    delve

    # Lua
    lua5_1
    lua-language-server
    selene
    stylua

    # TypeScript / JavaScript / CSS / Vue
    typescript-language-server
    vscode-langservers-extracted
    vue-language-server
    prettierd

    # Nix
    nil
    nixfmt
    statix

    # Python
    basedpyright
    ruff
    ty

    # YAML
    yaml-language-server

    # MakeFile
    mbake

    # virtualisation = {
    #   containers.enable = true;
    #   podman = {
    #     enable = true;
    #     dockerCompat = true;
    #     defaultNetwork.settings.dns_enabled = true;
    #   };
    # };

    # users.users.tobi = {
    #   extraGroups = [
    #     "podman"
    #   ];
    # };

    # programs.nix-ld = {
    #   enable = true;
    #   libraries = with pkgs; [
    #     acl
    #     attr
    #     bzip2
    #     curl
    #     libsodium
    #     libssh
    #     libxml2
    #     openssl
    #     stdenv.cc.cc
    #     systemd
    #     util-linux
    #     xz
    #     zlib
    #     zstd
    #   ];
    # };

    # direnv
    # podman-compose

    # Neovim
    # Lazyvim Deps
    # ast-grep
    # ghostscript
    # mermaid-cli
    # sqlite # Zotcite
    # tectonic

    # harper
    # ltex-ls-plus # Because harper doesn't support LaTeX??

    # INFO: Language Support

    # Elixir
    # elixir
    # beamMinimal28Packages.elixir-ls

    # gcc # Apparently needed for Go sometimes? ("net")
    # go
    # golangci-lint

    # Latex
    # texlab

    # Python
    #python3Packages.autopep8

    # Rust
    # cargo
    # cargo-insta
    # rust-analyzer
    # rustc
    # rustfmt

    # TCL
    # tclint

    # Typst
    # tinymist

    # Speech
    # praat

    # Formatters / Linters
    # checkmake
    # bake # conform.lua refs this for Makefiles; no matching Nix pkg

    # CLI
    # borgbackup
    # delta
    # distrobox
    # exiftool
    # jless
    # libqalculate
    # moreutils
    # parallel-full
    # pandoc
    # pciutils
    # progress
    # socat
    # go-task
    # unstable.typst
  ];
}
