$SourcePath = "C:\Users\david.ersser\Documents\awsscript\newtextdocument.txt"
$BucketName = "s3bucketclilab"
$TempPath = "C:\Users\Public\tempfile.zip"


#compress 
Compress-Archive -Path $SourcePath -DestinationPath $TempPath -Force

#upload to s3 
aws s3 cp $TempPath "s3://$BucketName/tempfile.zip"


