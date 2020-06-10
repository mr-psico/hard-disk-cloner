function md5() {

                        echo "Sacando md5 del dispositivo"
                        md5sum $dispositivo > md5-dispositivo.txt
                        echo "Sacando md5 del iso"
                        md5sum $destino > md5-destino-iso.txt

}
function sha1(){
                        echo "Sacando sha1 del dispositivo"
                        sha1sum $dispositivo > sha1-dispositivo.txt
                        echo "Sacando sha1 del iso"
                        sha1sum $destino > sha1-destino.txt

}
function sha256(){
                        echo "Sacando sha256 del dispositivo"
                        sha256sum $dispositivo > sha256-dispositivo.txt
                        echo "Sacando sha256 del iso"
                        sha256sum $destino > sha256-destino.txt

}
function sha512(){
                        echo "Sacando sha512 del dispositivo"
                        sha512sum $dispositivo > sha512-dispositivo.txt
                        echo "Sacando sha512 del iso"
                        sha512sum $destino > sha512-destino.txt

}
#!/bin/bash
#mostramos la lista de dispositivos
#clonado_de_disco.shdisk -l
echo "Digite nombre del dispositivo"
read dispositivo
echo "Digite la velocidad de copiado (entre más bajo más seguro megas )"
read velocidad
echo "Digite el nombre y la ruta  del archivo(.iso) "
read destino
dd  bs=$velocidad if=$dispositivo of=$destino
echo "Desea obtener la verificación de la integridad del archivo "
read respuesta
if [ respuesta="y" ] 
	then
	echo "Elija cual obtener"
	echo "md5"
	echo "sha1"
	echo "sha256"
	echo "sha512"
	echo "todos"
	read respuesta1
	case $respuesta1 in
		1)
			md5
			;;
		2)
			sha1
			;;
		3)
			sha256
			;;
		4)
			sha512
			;;
		5)
			md5
			sha1
			sha256
			sha512
			;;
		esac
else :
	echo "adios"
fi
