{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    inter
    maple-mono.Normal-NF
    maple-mono.NF-unhinted
    nerd-fonts.jetbrains-mono
  ];
}
