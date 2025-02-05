# List of S3 folders
declare -a arr=("s3://caminho da pasta no s3/")

#Permite particionar o processo de extração com a declaração do intervalo
start_timestamp=0
end_timestamp=1000


for s3_folder in "${arr[@]}"
do
  echo "Processing folder: $s3_folder"

  files=$(aws s3 ls $s3_folder | awk '{print $4}')


  for file in $files
  do

    timestamp=$(echo "$file" | awk -F'[_.]' '{print $1}')

    if [[ $timestamp -ge $start_timestamp && $timestamp -le $end_timestamp ]]; then
      prefix="s3://caminho_do_seu_bucket_s3/"
      string="$s3_folder$file"
      foo=${string#"$prefix"}
      echo "${foo}"
   
   #Restaurando os arquivos na categoria gratuita (até 24horas de processo) e deixando-os disponiveis para os proximos 10 dias;
      echo "Processing file: $file"
      echo "key: $s"
      aws s3api restore-object --bucket nome--bucket --key "$foo" --restore-request '{"Days":10,"GlacierJobParameters":{"Tier":"Bulk"}}'
      echo "$file processing complete."
    else
      echo "Skipping file: $file as it is not within the specified interval."
    fi
  done

  echo "$s3_folder processing complete."
done

echo "All folders processed."