{pkgs,...}:
{
programs.bash = {
  enable = true;
  enableCompletion = true;
  initExtra = ''
    PS1='\[\e[34m\]\u\[\e[0m\]@\h:\w\$ '
  '';
};
}
