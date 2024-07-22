#!/bin/bash

_do_sh_completion() {
    local cur prev opts sub_opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Определение основных параметров
    opts="rx images clean_logs create-update-script generate_data_protection_cert_from_config all dt platform components db rxcmd ct certificatetool webserver nomad_service ccs dos widgets gs indexing intsrv job kds log pss ps reports ss worker wbs wps rabbitmq haproxy mongodb"

    # Определение значений для параметров (если требуется)
    case "${prev}" in
        all|webserver|nomad_service|ccs|dos|widgets|gs|indexing|intsrv|job|kds|log|pss|ps|reports|ss|worker|wbs|wps|rabbitmq|haproxy|mongodb)
            sub_opts="up down start stop restart config_up generate_config_yaml check"
            ;;
        platform)
            sub_opts="up down start stop restart config_up check"
            ;;
        components)
            sub_opts="list add add_package delete delete_all"
            ;;
        db)
            sub_opts="up convert check"
            ;;
        rxcmd)
            sub_opts="import_templates"
            ;;
        dt)
            sub_opts="deploy get_deployed_solutions get_applied_solutions_info init_and_apply_settings init remove_solutions run"
            ;;
        ct|certificatetool)
            sub_opts="encrypt_config decrypt_config"
            ;;
        enc)
            sub_opts="run list add remove"
            ;;
        images)
            sub_opts="remove"
            ;;
        rx)
            sub_opts="install"
            ;;
        *)
            sub_opts=""
            ;;
    esac

    if [[ -n ${sub_opts} ]]; then
        COMPREPLY=( $(compgen -W "${sub_opts}" -- ${cur}) )
    else
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    fi

    return 0
}

complete -F _do_sh_completion /srv/drx/do.sh
complete -F _do_sh_completion ./do.sh
