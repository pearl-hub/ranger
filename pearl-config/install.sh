function post_install(){
    info "Installing or updating the ranger git repository..."
    install_or_update_git_repo https://github.com/ranger/ranger.git "${PEARL_PKGVARDIR}/ranger" master

    # The following cannot be used because the shebang is hardcoded in ranger.py:
    # link_to_path "${PEARL_PKGVARDIR}/ranger/ranger.py" "ranger"
    echo "#!/usr/bin/env bash" > ${PEARL_HOME}/bin/ranger
    echo '/usr/bin/env python -O ${PEARL_PKGVARDIR}/ranger/ranger.py "$@"' >> ${PEARL_HOME}/bin/ranger
    chmod +x ${PEARL_HOME}/bin/ranger

    mkdir -p ${HOME}/.config/ranger/
    cp -f ${PEARL_PKGDIR}/rifle.conf ${HOME}/.config/ranger/
}

function post_update(){
    post_install
}

function pre_remove(){
    rm -f ${PEARL_HOME}/bin/ranger

    rm -f ${HOME}/.config/ranger/rifle.conf
    rm -rf ${PEARL_PKGVARDIR}/ranger
}
