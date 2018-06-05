function post_install(){
    link_to_path "${PEARL_PKGDIR}/module/ranger.py" "ranger"

    mkdir -p ${HOME}/.config/ranger/
    cp -f ${PEARL_PKGDIR}/rifle.conf ${HOME}/.config/ranger/
}

function post_update(){
    post_install
}

function pre_remove(){
    unlink_from_path "${PEARL_PKGDIR}/module/ranger.py" "ranger"

    rm -f ${HOME}/.config/ranger/rifle.conf
}
