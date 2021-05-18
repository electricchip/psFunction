<#
.Synopsis
Find first duplicate character from string.
.DESCRIPTION
This will return the first character from a string which is encountered more then once when moving from the start of the string to the end.

Also Note:
This function considers uppercase letters to be different character than their lowercase partners.
.EXAMPLE
Get-DuplicateCharacter -StringToSearch "lazybrownfoxjumpedoverthehog"
.EXAMPLE
Get-DuplicateCharacter -StringToSearch "Sphinxofblackquartz,judgemyvow"
#>
function Get-DuplicateCharacter
{
    [CmdletBinding()]
    Param(
        #Input String to Search
        [Parameter(Mandatory=$true,Position=0)]
        [string]$StringToSearch
    )
        $CharactersPassed = @{}
        for ($i=1; $i -lt $StringToSearch.Length; $i=$i+1) {
            $currentChar = $StringToSearch[$i]

            if ($CharactersPassed.ContainsKey($currentChar)) {
                Write-Verbose "$currentChar Matches.  The $($i+1) character of the string is a duplicate. $StringToSearch"
                return $currentChar
            } else {
                # insert into hash.
                $CharactersPassed.Add($currentChar, $null)
            }
        }
        Write-Verbose "No duplicate character was found in provided string."
        return $null
}