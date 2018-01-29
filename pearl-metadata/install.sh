function post_install(){
    # TODO use newer `link_to_path` function for this
    local executable_path="${PEARL_PKGDIR}/module/ranger.py"
    local executable_name="ranger"
    link_to "${executable_path}" "${PEARL_HOME}/bin/${executable_name}"
}

function post_update(){
    post_install
}

function pre_remove(){
    # TODO use newer `unlink_from_path` function for this
    local executable_path="${PEARL_PKGDIR}/module/ranger.py"
    local executable_name="ranger"
    unlink_from "${executable_path}" "${PEARL_HOME}/bin/${executable_name}"
}
