# Thanks, Kaito Udagawa san & 3846masa san!
# Modified for TeX-esolang-battle. (c) 2019 domperor
# Options reference: munepi san's Qiita
# => https://qiita.com/munepi/items/f2eaa30f0cd00a9a68f8

# Original Dockerfile is from ......
# => https://github.com/Paperist/docker-alpine-texlive-ja/blob/master/Dockerfile
# Copyright (c) 2016 Kaito Udagawa
# Copyright (c) 2016-2019 3846masa
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM esolang/ubuntu-base

RUN mkdir /tmp/install-tl-unx && \
    curl -L http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | \
    tar -xz -C /tmp/install-tl-unx --strip-components=1 && \
    printf "%s\n" \
      "selected_scheme scheme-minimal" \
      "TEXDIR /usr/local/texlive/2020" \
      "TEXMFLOCAL /usr/local/texlive/texmf-local" \
      "TEXMFSYSCONFIG /usr/local/texlive/2020/texmf-config" \
      "TEXMFSYSVAR /usr/local/texlive/2020/texmf-var" \
      "TEXMFHOME ~/texmf" \
      "TEXMFCONFIG ~/.texlive2020/texmf-config" \
      "TEXMFVAR ~/.texlive2020/texmf-var" \
      "option_doc 0" \
      "option_src 0" \
      "binary_x86_64-darwin 0" \
      "binary_x86_64-linux 1" \
      "binary_win32 0" \
      "option_adjustrepo 0" \
      "option_autobackup 0" \
      "option_backupdir tlpkg/backups" \
      "option_desktop_integration 0" \
      "option_file_assocs 0" \
      "option_fmt 1" \
      "option_letter 0" \
      "option_path 0" \
      "option_post_code 1" \
      "option_sys_bin /usr/local/bin" \
      "option_sys_info /usr/local/share/info" \
      "option_sys_man /usr/local/share/man" \
      "option_w32_multi_user 1" \
      "option_write18_restricted 1" \
      "portable 0" \
      > /tmp/install-tl-unx/texlive.profile && \
    /tmp/install-tl-unx/install-tl --location http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet --profile=/tmp/install-tl-unx/texlive.profile && \
    /usr/local/texlive/2020/bin/x86_64-linux/tlmgr --verify-repo=none install collection-basic && \
    rm -rf /tmp/* && \
    ln -s /bin/script /bin/tex

COPY script /root/script