{ pkgs, config, ... }:
{
  sops.secrets.forgejo-runner-token = { };

  virtualisation.docker.enable = true;

  services.gitea-actions-runner = {
    package = pkgs.forgejo-runner;
    instances.default = {
      enable = true;
      name = "individual@actions.sreilich.de";
      url = "https://codeberg.org/";
      # Obtaining the path to the runner token file may differ
      # tokenFile should be in format TOKEN=<secret>, since it's EnvironmentFile for systemd
      tokenFile = config.sops.secrets.forgejo-runner-token.path;
      labels = [
        "nix-stable:docker://nixos/nix:latest"
        "nix-unstable:docker://nixos/nix:unstable"
      ];
    };
  };
}
