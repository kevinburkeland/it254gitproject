# Specify the EC2 instance parameters
$instanceParams = @{
    ImageId          = 'ami-0440d3b780d96b29d'
    InstanceType     = 't2.micro'            
    MinCount         = 1
    MaxCount         = 1
}

# Launch the EC2 instance
$instances = New-EC2Instance @instanceParams