let
  finnh = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHBAmd1G1MXkUQhO52l/kPIrYqpsqyDXWoUqTxNtb5aq finnh@nixos";
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILjtGWn3GBQDIuE0L3JI3ceIrH1OBrGjDJIuq+I9adxU root@nixos";
in
{
  "github-ssh-key.age".publicKeys = [
    finnh
    system
  ];
}
