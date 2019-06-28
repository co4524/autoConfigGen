path=$HOME/mytestnet/node
URL_path=$HOME/evm-lite-js/test/baseURL
nodeNum=$1
base=$2
rm $URL_path
for ((i=0 ; i<$1 ; i++)) {
	ip=$3
	for ((j=$1-1 ; j>-1 ; j--)){
		if [ "$i" = "0" ]
		then
			echo "http://$base.$ip:8080" >> $URL_path
		fi
		sed -i "s/node$j/$base.$ip/g" $path$i/tendermint/config/config.toml
		let ip=ip-1	
	}
}
