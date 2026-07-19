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

  environment = {

    shells = [ pkgs.bash ];
    sessionVariables = {
      PATH = [
        "/home/kr9sis/.local/bin/"
      ];
    };
    systemPackages = with pkgs; [
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
      wl-clipboard
      wev
      libxkbcommon
      ueberzugpp

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
      roslyn-ls
      csharpier
      dotnet-sdk_10

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
    ];
  };
}
