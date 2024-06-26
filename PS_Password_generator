function Generate-Password {
    param (
        [int]$length = 16,
        [string]$characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+'
    )

    # Create a secure random number generator
    $secureRng = New-Object System.Security.Cryptography.RNGCryptoServiceProvider
    $passwordChars = New-Object System.Char[] $length
    $charArray = $characters.ToCharArray()
    $charArrayLength = $charArray.Length

    for ($i = 0; $i -lt $length; $i++) {
        $randomNumber = New-Object Byte[] 1
        $secureRng.GetBytes($randomNumber)
        $randomIndex = [math]::Floor($charArrayLength * ($randomNumber[0] / [byte]::MaxValue))
        $passwordChars[$i] = $charArray[$randomIndex]
    }

    return -join $passwordChars
}

# Generate a random password with the default length of 16 characters
$generatedPassword = Generate-Password
Write-Output "Generated Password: $generatedPassword"

# Generate a random password with a custom length of 24 characters
$customLengthPassword = Generate-Password -length 24
Write-Output "Custom Length Password: $customLengthPassword"
