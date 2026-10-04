{pkgs,...}:
{
 # disks
  fileSystems."/mnt/disk1" = {
  device = "/dev/disk/by-uuid/EAFC148BFC1453E3";
  fsType = "ntfs3";
  options = [
    "rw"
    "uid=1000"
    "gid=100"
    "umask=0000"
    "nofail"
    "noatime"
  ];
};

fileSystems."/mnt/disk2" = {
  device = "/dev/disk/by-uuid/BEF096DAF096986B";
  fsType = "ntfs3";
  options = [
    "rw"
    "uid=1000"
    "gid=100"
    "umask=0000"
    "nofail"
    "noatime"
  ];
};
fileSystems."/mnt/disk1/SteamLibrary/steamapps/compatdata" = {
  device = "/home/danil/.steam/steam/steamapps/compatdata";
  fsType = "none";
  options = [ "bind" "nofail" ];
};
}
