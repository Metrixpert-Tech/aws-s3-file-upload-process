$bucketName = "********************-bucket_name"
$path = "the\s3\path\"

Get-ChildItem -Filter *.log |
ForEach-Object -Begin{$i=0} {  
  $i++;
  $key = $path+$_ ;
  
  ## progress rate
  Write-Host $key "($i/1000)"  -ForegroundColor Green ;
  
  ## upload to aws s3
  Write-S3Object -BucketName $bucketName -File $_.FullName -Key $key ;
}
