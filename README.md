# Migração de Dados entre AWS S3 e Google Cloud Storage

## Descrição

Este repositório contém um script Bash para copiar arquivos de um bucket S3 da AWS para um bucket no Google Cloud Storage (GCP). Além disso, há um trecho de código que permite restaurar objetos arquivados no S3 antes da migração.

## Funcionalidades

- Listar arquivos em um bucket S3
- Copiar arquivos do S3 para um diretório local
- Enviar arquivos do diretório local para um bucket do GCP
- Remover arquivos locais após a migração
- Restaurar objetos arquivados no S3 para transferência
- Definir intervalo de tempo para particionar a extração de arquivos

## Pré-requisitos

Antes de executar o script, certifique-se de ter:

- AWS CLI configurado com as credenciais corretas
- Google Cloud SDK instalado e autenticado
- Permissões adequadas para acessar os buckets S3 e GCP

## Uso

1. Modifique o script para incluir os caminhos corretos dos buckets S3 e GCP.
2. Defina os valores de `start_timestamp` e `end_timestamp` conforme necessário.
3. Execute o script usando:
   ```bash
   chmod +x script.sh
   ./script.sh
   ```

## Observações

- O script usa a ferramenta `aws s3 cp` para copiar os arquivos e `gsutil cp` para enviá-los ao GCP.
- Para arquivos armazenados no Amazon S3 Glacier, o script realiza a restauração na classe "Bulk" e os mantém disponíveis por 10 dias.

## Contato
darlene.rno@gmail.com

