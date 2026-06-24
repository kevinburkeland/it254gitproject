#generate 1000 random numbers between 0-1000 stored in a single array
#if array contains the number 42 script to output "The answer to life the universe and everything is found"
#doesn't contain 42 script to create a user with the username kcromer and the full name "Kiara Cromer" on your local system
#If the kcromer users already exists it should delete the user and display "So long and thanks for all the fish"

# Generate 1000 random numbers between 0 and 1000
$numbers = 1..1000 | ForEach-Object { Get-Random -Minimum 0 -Maximum 1001 }

# Check if the array contains 42
if ($numbers -contains 42) {
    Write-Output "The answer to life the universe and everything is found."
}
else {
    # Check if the user 'kcromer' exists
    $user = Get-LocalUser -Name 'kcromer' -ErrorAction SilentlyContinue

    if ($user) {
        # User exists, delete the user
        Remove-LocalUser -Name 'kcromer'
        Write-Output "So long and thanks for all the fish."
    }
    else {
        # User does not exist, create the user
        New-LocalUser -Name 'kcromer' -FullName 'Kiara Cromer' -NoPassword
        Write-Output "User 'kcromer' with full name 'Kiara Cromer' created."
    }
}