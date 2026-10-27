{pkgs,...}:
{
services.ollama = {
  enable = true;
  # Вместо acceleration = "cuda"; используем нужный пакет
  package = pkgs.ollama-cuda;
};

# Настройка CUDA-кэша для ускорения сборки
{
  nix.settings = {
    substituters = [ "https://cache.nixos-cuda.org" ];
    trusted-public-keys = [ "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M=" ];
  };
}
}
