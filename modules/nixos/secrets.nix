{ ... }:
{
  age.identityPaths = [
    "/home/finnh/.ssh/id_ed25519"
    "/etc/ssh/ssh_host_ed25519_key"
  ];

  age.secrets.github-ssh-key = {
    file = ../../secrets/github-ssh-key.age;
    path = "/home/finnh/.ssh/github";
    owner = "finnh";
    group = "users";
    mode = "600";
  };
}
