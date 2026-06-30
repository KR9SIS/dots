# All things programming.
{
  pkgs,
  ...
}:
let
  pythonWithDebug = pkgs.python3.withPackages (ps: [ ps.debugpy ]);
in
{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

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

  environment.systemPackages = with pkgs; [
    # Shell
    # direnv
    eza
    fzf
    starship
    zoxide
    tmux
    alacritty
    opencode

    # podman-compose

    # Neovim
    neovim
    # Lazyvim Deps
    # ast-grep
    # ghostscript
    luarocks
    # mermaid-cli
    # sqlite # Zotcite
    # tectonic
    nodejs
    tree-sitter

    # harper
    # ltex-ls-plus # Because harper doesn't support LaTeX??

    # INFO: Language Support

    # Bash
    bash-language-server

    # Elixir
    # elixir
    # beamMinimal28Packages.elixir-ls

    # Go
    # gcc # Apparently needed for Go sometimes? ("net")
    # go
    # golangci-lint
    gofumpt
    gopls
    delve

    # Latex
    # texlab

    # C/C++
    clang-tools

    # C#
    # omnisharp-roslyn
    # csharpier

    # Lua
    lua5_1
    lua-language-server
    selene
    stylua

    # Markdown
    markdownlint-cli2

    # TypeScript / JavaScript / CSS / Vue
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.vue-language-server
    nodePackages.prettierd

    # Nix
    nil
    nixfmt
    statix

    # Python
    (pkgs.writeShellScriptBin "python" ''
      export LD_BINARY_PATH=$NIX_LD_LIBRARY_PATH
      exec "${pythonWithDebug}/bin/python3" "$@"
    '')
    python3Packages.debugpy
    python3Packages.autopep8
    basedpyright
    ruff
    ty
    uv

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

    # YAML
    yaml-language-server

    # Speech
    # praat

    # Formatters / Linters
    shfmt
    # checkmake
    typos
    # bake # conform.lua refs this for Makefiles; no matching Nix pkg
    fd

    # CLI
    bat
    # borgbackup
    btop
    # delta
    # distrobox
    # exiftool
    file
    graphviz
    grc
    gum
    imagemagick
    # jless
    jq
    lazygit
    # libqalculate
    # moreutils
    # parallel-full
    # pandoc
    # pciutils
    # progress
    ripgrep
    # socat
    # go-task
    tldr
    # unstable.typst
    usbutils
    watchexec
    yq
    zip
    unzip
  ];
}
