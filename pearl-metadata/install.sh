function post_install(){
    ln -s "${PEARL_PKGDIR}/module/scripts/ranger" ${PEARL_HOME}/bin
}

function pre_remove(){
    rm -f ${PEARL_HOME}/bin/ranger
}
