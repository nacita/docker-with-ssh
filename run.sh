#!/bin/bash
#set -x

# beri awala nama host
prefix_hostname=tefa
# nama docker image yang digunakan
image_name=nacitalabs/custom
# sumber data berupa file csv yang dipisahkan dengan tab
source_file=peserta.csv
# limit memory, (ya meskipun sepertinya belum terlalu berguna)
memlimit=1024MB
# cpu maksimum tiap kontainer
cpulimit=1


usage () {
	echo "Script untuk menjalankan banyak container." 
	echo -e "\nUsage:\n\t$0 [arguments]" 
	echo -e "\nArgumen:" 
	echo -e "\t-s\t\tMemulai Container" 
	echo -e "\t-t\t\tMenghentikan Container" 
	echo -e "\t-d\t\tMenghapus Container\n" 
}

run () {
paste -d ' ' `dirname $0`/$source_file | while read nomor siswa; do
    if [ $siswa != '' ]; then
    docker run -dti \
        --name $prefix_hostname-$siswa \
        --hostname $prefix_hostname-$siswa \
        --memory $memlimit \
        --memory-swap $memlimit \
        --cpus $cpulimit \
        -p 22$nomor:22 \
        $image_name;
    fi
done
}


stop () {
paste -d ' ' `dirname $0`/$source_file | while read nomor siswa; do
    docker stop $prefix_hostname-$siswa;
done
}


delete () {
paste -d ' ' `dirname $0`/$source_file | while read nomor siswa; do
    docker rm -f $prefix_hostname-$siswa;
done
}


while getopts "std" option;
    do
        case ${option}
        in
            s) run;;
            t) stop;;
            d) delete;;
            \?) usage
            exit 1;;
        esac;
done




