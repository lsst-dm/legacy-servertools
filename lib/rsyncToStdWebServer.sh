#! /bin/bash
#
# copy all recent changes from the local server staging area to the actual
# web server (on a remote machine)
#
function rsyncToStdWebServer {

    local delete=
    [ -n "$rsyncremove" ] && delete="--delete"
    local subdir=
    [ -n "$1" ] && subdir=/$1

    echo rsync -avz $delete --exclude=.git\* --exclude=/newinstall.sh --exclude=\*~ $localServerMirror$subdir/ $testPackageServerDir$subdir
    rsync -avz $delete --exclude=.git\* --exclude=/newinstall.sh --exclude=\*~ $localServerMirror$subdir/ $testPackageServerDir$subdir || return 1

    return 0
}

packageServerName=sw.lsstcorp.org/pkgs
testPackageServerPath=std/w12
testPackageServerDir=/lsst/DC3/distrib/servers/$testPackageServerPath
localServerMirror=$stackbase/www
