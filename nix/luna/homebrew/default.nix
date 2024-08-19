{...}:

{
  imports = [./brews ./casks ./taps.nix];

  homebrew = {
    enable = true;
    global = { autoUpdate = true; };
  };
}
