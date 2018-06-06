function _init(){
    link_to_path "${PEARL_PKGVARDIR}/ranger/ranger.py" "ranger"

    mkdir -p ${HOME}/.config/ranger/
    cp -f ${PEARL_PKGDIR}/rifle.conf ${HOME}/.config/ranger/
}


function post_install(){
    git clone https://github.com/ranger/ranger.git ${PEARL_PKGVARDIR}/ranger

    _init
}

function post_update(){
    cd ${PEARL_PKGVARDIR}/ranger
    git fetch --quiet --all
    git reset --quiet --hard origin/master
    git submodule update --quiet --init --recursive
    git checkout --quiet master

    _init
}

function pre_remove(){
    unlink_from_path "${PEARL_PKGVARDIR}/ranger/ranger.py" "ranger"

    rm -f ${HOME}/.config/ranger/rifle.conf
    rm -rf ${PEARL_PKGVARDIR}/ranger
}
