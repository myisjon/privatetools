#!/bin/bash

# 私有仓库项目完整路径
PRIVATE_REGISTRY=""


function main() {
    images=$1
    if [[ -z "$images" ]] ; then
        echo "No images name"
        exit 1
    fi
    fstr=$(docker images -aq|tr '\n' '|' | sed -e "s#|\$##g")
    # pull docker hub
    echo "==================== sync image: ${images} ===================="
    docker pull "${images}"
    src_images=(`docker images -a "${images}" --format='{{.Repository}}:{{.Tag}} {{.ID}}'|grep -Ev "${fstr}"|head -n 1`)
    dest_images="${PRIVATE_REGISTRY}/${src_images[0]}"
    # push harbor
    echo "==================== push image ${dest_images} ===================="
    docker tag "${src_images[0]}" "${dest_images}"
    docker push "${dest_images}"

    # remove local images
    echo "==================== remove image ${dest_images} ===================="
    docker rmi -f "${src_images[1]}"
}

# 使用方式: ./sync_docker_to_private.sh centos 即将docker hub的centos:last 上传到私有仓库
main "$@"
