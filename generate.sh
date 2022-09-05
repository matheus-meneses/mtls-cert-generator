# shellcheck disable=SC2162

# Declare variables
base_folder="../"
tmp_folder="tmp"
private_folder="$tmp_folder/private"
certs_folder="$tmp_folder/certs"
client_certs_folder="$tmp_folder/client_certs"
index_file="$tmp_folder/index.txt"
serial_file="$tmp_folder/serial"

# Create temporary folder
rm -rf $tmp_folder && mkdir $tmp_folder
mkdir $private_folder && mkdir $certs_folder && mkdir $client_certs_folder

# Reads CA expiration
ECHO "Type days of CA expiration: "
read ca_expiration

#Creating serial file and index file
ECHO 01 >$serial_file && touch $index_file

# Generate files
openssl genrsa -out "$private_folder"/ca.key 4096
openssl req -new -x509 -days "$ca_expiration" -config openssl.cnf -key "$private_folder"/ca.key -out "$certs_folder"/ca.crt
openssl genrsa -out $client_certs_folder/client.key 4096
openssl req -new -key $client_certs_folder/client.key -config openssl.cnf -out $client_certs_folder/client.csr

# Reads Certificate expiration
ECHO "Type days of Certificate expiration: "
read certificate_expiration

openssl ca -config openssl.cnf -extfile client_ext.cnf -days "$certificate_expiration" -notext -batch -in "$client_certs_folder"/client.csr -out "$client_certs_folder"/client.crt

# Reads final folder name
ECHO "Type folder name: "
read folder_name

mkdir "$base_folder/$folder_name" && mv $private_folder "$base_folder/$folder_name"/private && mv $certs_folder "$base_folder/$folder_name"/certs && mv $client_certs_folder "$base_folder/$folder_name"/client_certs

rm -rf $tmp_folder
ECHO "FINISHED"
