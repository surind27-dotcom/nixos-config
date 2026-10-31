{pkgs,...}:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # --- Браузер и веб ---
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/chrome" = "firefox.desktop";
      "text/html" = "firefox.desktop";
      "application/x-extension-htm" = "firefox.desktop";
      "application/x-extension-html" = "firefox.desktop";
      "application/x-extension-shtml" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "application/x-extension-xhtml" = "firefox.desktop";
      "application/x-extension-xht" = "firefox.desktop";
      
      # PDF (открываем в Firefox, так как отдельных вьюеров нет)
      "application/pdf" = "firefox.desktop";

      # --- Файловый менеджер (Папки) ---
      "inode/directory" = "thunar.desktop";
      # --- Изображения ---
      "image/png" = "org.xfce.ristretto.desktop";
      "image/jpeg" = "org.xfce.ristretto.desktop";
      "image/gif" = "org.xfce.ristretto.desktop";
      "image/webp" = "org.xfce.ristretto.desktop";
      "image/svg+xml" = "org.xfce.ristretto.desktop";
      "image/bmp" = "org.xfce.ristretto.desktop";
      "image/tiff" = "org.xfce.ristretto.desktop";
      "image/avif" = "org.xfce.ristretto.desktop";
      "image/heic" = "org.xfce.ristretto.desktop";


      # --- Архивы (Xarchiver вместо file-roller) ---
      "application/zip" = "xarchiver.desktop";
      "application/x-tar" = "xarchiver.desktop";
      "application/x-7z-compressed" = "xarchiver.desktop";
      "application/x-rar" = "xarchiver.desktop";
      "application/gzip" = "xarchiver.desktop";
      "application/x-bzip2" = "xarchiver.desktop";
      "application/x-xz" = "xarchiver.desktop";

      # --- Видео (MPV) ---
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/avi" = "mpv.desktop";
      "video/quicktime" = "mpv.desktop";

      # --- Текст (Zed) ---
      "text/plain" = "dev.zed.Zed.desktop";
    };
  };
}
