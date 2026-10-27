{pkgs,...}:
{
 services.ollama = {
  enable = true;
  acceleration = "cuda"; # Чтобы работало на твоей Nvidia
};
}
