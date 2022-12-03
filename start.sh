#!/bin/bash
set -o nounset
set -o errexit

# All in one 
function ALLINONE(){
    true
}

# Mulit node Cluster
function MULITNODE(){
    true
}

# Start install
function INSTALL(){
    true
}

# Parameter decomposition
function PROCESS(){
    local eval_param=""
    while [[ $# -gt 0 ]];do
        param="$1"
        case ${param} in
            --eval | -e)
                eval_param="${*:2}"
                break
                ;;
            --online)
                INSTALL_TYPE="online" && shift
                ;;
            --offline)
                INSTALL_TYPE="offline" && shift
                ;;
            --allinone)
                tmpDict[IPADDR]="$2" && shift
                ;;
            --multinode)
                tmpDict[IPADDR]="$2" && shift
                ;;
            -? | --help | -h)
                _help
                exit 1
        esac
        shift
    done
    # 模块调试
    if [[ ${eval_param} != "" ]];then
        [[ ${tmpDict['IPADDR']} != "" ]] && INITENV
        eval "${eval_param}"
        exit $?
    fi
    return 0
}

# 帮助函数
function _help(){
    printf "
Usage: bash start [OPTION...] <accountName>
    -d,--downfile       下载安装包
    --offline           离线安装
    --online            默认，在线安装
    --allinone          默认,安装allinone集群
    --multinode         多节点安装
    -e,--eval           区块函数调试，调用[ALLINONE,MULTINODE,INSTALL]

Help options:
    -?, --help,-h       help message.
    \n"
}

# 主函数
function main(){
    trap ROOLBACK INT TERM #EXIT
    PROCESS "$@"
    trap - INT TERM EXIT
}

# 入口
main "$@"