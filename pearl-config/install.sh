function post_install(){
    info "Installing or updating the ranger git repository..."
    install_or_update_git_repo https://github.com/ranger/ranger.git "${PEARL_PKGVARDIR}/ranger" master

    link_to_path "${PEARL_PKGVARDIR}/ranger/ranger.py" "ranger"

    mkdir -p ${HOME}/.config/ranger/
    cp -f ${PEARL_PKGDIR}/rifle.conf ${HOME}/.config/ranger/
}

function post_update(){
    post_install
}

function pre_remove(){
    unlink_from_path "${PEARL_PKGVARDIR}/ranger/ranger.py" "ranger"

    rm -f ${HOME}/.config/ranger/rifle.conf
    rm -rf ${PEARL_PKGVARDIR}/ranger
}
