# Oracle Cloud Bucket Ubuntu s3fs Init
# example: wget -qO - https://raw.githubusercontent.com/Ruhminations/nix-scripts/main/oracle-cloud-ubuntu-s3fs-init.sh | sudo bash -s "user:pass" "bucket-name" "namespace" "region"
# docs: https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/s3compatibleapi.htm (Mounting Object Storage buckets using s3fs)

sudo apt-get -y install s3fs nfs-kernel-server
echo $1 | sudo tee /etc/passwd-s3fs
chmod 600 /etc/passwd-s3fs
sudo mkdir /bedrock_bucket
echo "$2 /bedrock_bucket fuse.s3fs use_path_request_style,passwd_file=/etc/passwd-s3fs,url=https://$3.compat.objectstorage.$4.oraclecloud.com,endpoint=$4 kernel_cache,multipart_size=128,parallel_count=50,multireq_max=100,max_background=1000,allow_other,_netdev" | sudo tee -a /etc/fstab
echo "to mount right now, run: sudo s3fs $2 /bedrock_bucket -o passwd_file=/etc/passwd-s3fs -o url=https://$3.compat.objectstorage.$4.oraclecloud.com -o use_path_request_style -o kernel_cache -o multipart_size=128 -o parallel_count=50 -o multireq_max=100 -o max_background=1000 -o endpoint=$4 -o allow_other"
