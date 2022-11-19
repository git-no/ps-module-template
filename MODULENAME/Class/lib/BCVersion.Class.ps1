# ******
# BCVersion
# ******

class BCVersion {

    # Constructors
  
    BCVersion(
        [String]$versionString
    ) {
        $version = VersionFromString($versionString)
  
        $this.major = $version.Major
        $this.minor = $version.Minor
        $this.build = $version.Build
        $this.revision = $version.Revision
        $this.name = "$($this.major).$($this.minor)"
    }
  
    BCVersion(
        [Int32]$major
    ) {
        $version = [Version]::new("$($major).0")
        $this.major = $version.Major
        $this.minor = $version.Minor
        $this.build = $version.Build
        $this.revision = $version.Revision
        $this.name = "$($this.major).$($this.minor)"
    }
  
    BCVersion(
        [Int32]$major,
        [Int32]$minor
    ) {
        $version = [Version]::new($major, $minor)
        $this.major = $version.Major
        $this.minor = $version.Minor
        $this.build = $version.Build
        $this.revision = $version.Revision
        $this.name = "$($this.major).$($this.minor)"
    }
  
    # Properties
  
    [string]$name
    [Int32]$major
    [Int32]$minor
    [Int32]$build
    [Int32]$revision

    [BCVersionType]$type = [BCVersionType]::OnPremise
    [string]$region = 'w1'
  
    
    # Methods
  
    [Version]Version() {
        $version = [Version]::new($this.name)
        return $version
    }

    [Version]VersionFromString($versionString) {
        $versionString -match "(\d{1,2})\.?(\d{0,2})\.?(\d{0,5})\.?(\d{0,5})"
        $versionMajor = @{$true = "0"; $false = $matches[1] }[[String]::IsNullOrEmpty($matches[1])]
        $versionMinor = @{$true = "0"; $false = $matches[2] }[[String]::IsNullOrEmpty($matches[2])]
        $version = [Version]::new("$($versionMajor).$($versionMinor)")

        if (![String]::IsNullOrEmpty($matches[3])) {
            $version = [Version]::new("$($versionMajor).$($versionMinor).$($matches[3])")
        }
        if (![String]::IsNullOrEmpty($matches[4])) {
            $version = [Version]::new("$($versionMajor).$($versionMinor).$($version.build).$($matches[4])")
        }

        return $version
    }

  
    [bool]IsBC() {
        return ($this.major -ge 14)
    }
  
    [bool]IsBC14() {
        return ($this.major -eq 14)
    }
  
    [bool]IsALOnly() {
        return ($this.major -ge 15)
    }
  
    [bool]IsMSAppExt() {
        $number = [decimal]::new("$($this.major).$($this.minor)")
        return ($number -ge 15.3)
    }
  
    [String]Centum() {  
        [String]$version = $this.major
        return $version.PadRight(3, '0')  # 19 => 190
    }
  
    [String]ToString() {
        $value = "$($this.major).$($this.minor)"
        if ($this.build -ne - 1) {
            $value += ".$($this.build)"
        }
        if ($this.revision -ne - 1) {
            $value += ".$($this.revision)"
        }
        return $value
    }
    
    [String]MajorMinorString() {
        return "$($this.major).$($this.minor)"
    }
  
    [String]Common() {
        return "$($this.major).$($this.minor)"
    }
  
    [String]VersionString() {
        $value = "$($this.major).$($this.minor)"
        $value += @{$true = ".0"; $false = ".$($this.build)" }[$this.build -eq - 1]
        $value += @{$true = ".0"; $false = ".$($this.revision)" }[$this.revision -eq -1]
        return $value    
    }
  
    # Setter / Getter
  
}
  
  