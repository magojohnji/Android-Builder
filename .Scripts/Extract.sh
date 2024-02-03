#!/bin/bash
# Extract for common file formats.

if [ -z "$1" ]; then
  # display usage if no parameters given
  echo "A script to extract for common file formats."
  echo "Usage: extract <path/file_name>.<tar|tbz2|tgz|tar.bz2|tar.gz|tar.xz|tar.Z|txz|lz|lzma|bz2|rar|gz|zip|zipx|Z|7z|xz|lzo|exe|lzh|lha|cpio|lrz|ace|alz|egg|cab|arj|arc|zpaq|zst|br|uue|iso>"
else
  if [ -f "$1" ] ; then
      NAME=${1%.*}
      #mkdir $NAME && cd $NAME
      case "$1" in
        *.tar)       tar xvf ./"$1"             ;;
        *.tbz2)      tar xvjf ./"$1"            ;;
        *.tgz)       tar xvzf ./"$1"            ;;
        *.tar.bz2)   tar xvjf ./"$1"            ;;
        *.tar.gz)    tar xvzf ./"$1"            ;;
        *.tar.xz)    tar xvJf ./"$1"            ;;
        *.tar.Z)     tar xvZf ./"$1"            ;;
        *.txz)       tar xvJf ./"$1"            ;;
        *.lz)        lzip -d ./"$1"             ;;
        *.lzma)      unlzma ./"$1"              ;;
        *.bz2)       bunzip2 ./"$1"             ;;
        *.rar)       unrar x -ad ./"$1"         ;;
        *.gz)        gunzip ./"$1"              ;;
        *.zip)       unzip ./"$1"               ;;
        *.zipx)      unzip ./"$1"               ;;
        *.Z)         uncompress ./"$1"          ;;
        *.7z)        7z x ./"$1"                ;;
        *.xz)        unxz ./"$1"                ;;
        *.lzo)       lzo -dv ./"$1"             ;;
        *.exe)       cabextract ./"$1"          ;;
        *.lzh)       lha -xiw=agis ./"$1"       ;;
        *.lha)       lha -e ./"$1"              ;;
        *.cpio)      cpio -idmv ./"$1"          ;;
        *.lrz)       lrzuntar ./"$1"            ;;
        *.ace)       unace e ./"$1"             ;;
        *.alz)       unalz ./"$1"               ;;
        *.egg)       unzip ./"$1"               ;;
        *.cab)       cabextract ./"$1"          ;;
        *.arj)       arj e ./"$1"               ;;
        *.arc)       nomarch -p ./"$1"          ;;
        *.zpaq)      zpaq x ./"$1"              ;;
        *.zst)       unzstd ./"$1"              ;;
        *.br)        brotli --decompress ./"$1" ;;
        *.uue)       uudecode ./"$1"            ;;
        *.iso)       7z x ./"$1"                ;;
        *)           echo -e "\033[31m[ERROR]\033[0m extract: '$1' - unknown or unsupported archive method!" ;;
      esac
  else
      echo -e "\033[31m[ERROR]\033[0m '$1' - file does not exist"
  fi
fi
