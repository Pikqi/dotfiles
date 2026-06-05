# How to find MIME types and .desktop file names:
#
# 1. Find a file's MIME type:
#      xdg-mime query filetype <file>
#    Or browse: https://wiki.archlinux.org/title/XDG_MIME_applications
#
# 2. List available .desktop files for an app:
#      ls /run/current-system/sw/share/applications/ | grep <appname>
#      ls ~/.local/share/applications/ | grep <appname>
#
# 3. Find which app handles a MIME type currently:
#      xdg-mime query default <mimetype>
#
# 4. Common MIME type lists:
#      https://www.iana.org/assignments/media-types/media-types.xhtml

{ config, pkgs, ... }:

let
  browser = "librewolf.desktop";
  fileManager = "org.kde.dolphin.desktop";
  textEditor = "nvim.desktop";
  pdfViewer = "org.pwmt.zathura.desktop";
  imageView = "imv.desktop";
  mediaPlayer = "mpv.desktop";
in
{
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "Alacritty.desktop" ];
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Browser
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "x-scheme-handler/about" = browser;
      "x-scheme-handler/unknown" = browser;
      "text/html" = browser;
      "application/xhtml+xml" = browser;
      "application/x-extension-htm" = browser;
      "application/x-extension-html" = browser;

      # File manager
      "inode/directory" = fileManager;
      "x-scheme-handler/file" = fileManager;

      # Text editor
      "text/plain" = textEditor;
      "text/markdown" = textEditor;
      "text/x-c" = textEditor;
      "text/x-c++" = textEditor;
      "text/x-java" = textEditor;
      "text/x-python" = textEditor;
      "text/x-shellscript" = textEditor;
      "text/css" = textEditor;
      "application/json" = textEditor;
      "application/x-shellscript" = textEditor;

      # PDF viewer
      "application/pdf" = pdfViewer;

      # Image viewer
      "image/png" = imageView;
      "image/jpeg" = imageView;
      "image/gif" = imageView;
      "image/webp" = imageView;
      "image/svg+xml" = imageView;
      "image/bmp" = imageView;
      "image/tiff" = imageView;

      # Video player
      "video/mp4" = mediaPlayer;
      "video/mpeg" = mediaPlayer;
      "video/webm" = mediaPlayer;
      "video/x-matroska" = mediaPlayer;
      "video/x-msvideo" = mediaPlayer;
      "video/quicktime" = mediaPlayer;

      # Audio player
      "audio/mpeg" = mediaPlayer;
      "audio/ogg" = mediaPlayer;
      "audio/flac" = mediaPlayer;
      "audio/aac" = mediaPlayer;
      "audio/x-wav" = mediaPlayer;
      "audio/webm" = mediaPlayer;
    };
  };
}
