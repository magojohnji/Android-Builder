#!/bin/bash
# Extract for common file formats.

OUTPUT_DIR="."

while getopts ":o:" opt; do
  case ${opt} in
    o )
      OUTPUT_DIR=$OPTARG
      ;;
    \? )
      echo "\033[31m[ERROR]\033[0m Invalid option: $OPTARG" 1>&2
      exit 1
      ;;
    : )
      echo "\033[31m[ERROR]\033[0m Invalid option: $OPTARG requires an argument" 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

if [ -z "$1" ]; then
  # display usage if no parameters given
  echo "Usage: extract.sh [-o output_dir] <file>"
else
  if [ -f "$1" ] ; then
      NAME=${1%.*}
      mkdir -p $OUTPUT_DIR
      cd $OUTPUT_DIR
      case "$1" in
        *.tar)       tar xvf ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"             ;;
        *.tbz2)      tar xvjf ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"            ;;
        *.tgz)       tar xvzf ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"            ;;
        *.tar.bz2)   tar xvjf ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"            ;;
        *.tar.gz)    tar xvzf ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"            ;;
        *.tar.xz)    tar xvJf ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"            ;;
        *.tar.Z)     tar xvZf ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"            ;;
        *.txz)       tar xvJf ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"            ;;
        *.lz)        lzip -d ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"             ;;
        *.lzma)      unlzma ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"              ;;
        *.bz2)       bunzip2 ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"             ;;
        *.rar)       unrar x -ad ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"         ;;
        *.gz)        gunzip ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"              ;;
        *.zip)       unzip ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"               ;;
        *.zipx)      unzip ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"               ;;
        *.Z)         uncompress ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"          ;;
        *.7z)        7z x ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"                ;;
        *.xz)        unxz ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"                ;;
        *.lzo)       lzo -dv ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"             ;;
        *.exe)       cabextract ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"          ;;
        *.lzh)       lha -xiw=agis ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"       ;;
        *.lha)       lha -e ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"              ;;
        *.cpio)      cpio -idmv ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"          ;;
        *.lrz)       lrzuntar ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"            ;;
        *.ace)       unace e ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"             ;;
        *.alz)       unalz ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"               ;;
        *.egg)       unzip ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"               ;;
        *.cab)       cabextract ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"          ;;
        *.arj)       arj e ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"               ;;
        *.arc)       nomarch -p ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"          ;;
        *.zpaq)      zpaq x ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"              ;;
        *.zst)       unzstd ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"              ;;
        *.br)        brotli --decompress ./"$1" && echo -e "\033[32mExtraction successful!\033[0m" ;;
        *.uue)       uudecode ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"            ;;
        *.iso)       7z x ./"$1" && echo -e "\033[32mExtraction successful!\033[0m"                ;;
        *)           echo -e "\033[31m[ERROR]\033[0m extract: '$1' - unknown or unsupported archive method!" ;;
      esac
  else
      echo -e "\033[31m[ERROR]\033[0m '$1' - file does not exist"
  fi
fi
