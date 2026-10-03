{ ... }:

{
  imports =
    (path: (map (f: path + "/${f}") (builtins.attrNames (builtins.readDir path)))) ./
    ++ [ ];
}
