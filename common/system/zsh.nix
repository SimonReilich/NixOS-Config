{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellInit = "eval \"$(oh-my-posh init zsh --config /home/simonr/.dotfiles/common/user/prompt.toml)\"";

    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];

    ohMyZsh = {
      enable = true;
      plugins = [
        "cabal"
        "colored-man-pages"
        "colorize"
        "copybuffer"
        "gh"
        "git"
        "git-auto-fetch"
        "history-substring-search"
        "npm"
        "pip"
        "python"
        "rust"
        "safe-paste"
        "spring"
        "ssh"
        "sudo"
        "zoxide"
      ];
      theme = "robbyrussell";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    flags = [
      "--cmd cd"
    ];
  };
}
