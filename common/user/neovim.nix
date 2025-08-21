{ pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        extraPackages = with pkgs.vimPlugins; [
            catppuccin-nvim
            nvchad
        ];
    };
}
