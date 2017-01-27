# Chocolatey Toast Extension (Unofficial)

Chocolatey extension module that allows Chocolatey packages to display toast messages to report their (un)installation progress. The notifications are also displayed in Windows Action Center.

## Installation

Install through chocolatey:

```PowerShell
PS> choco install chocolatey-toast.extension
```

**NOTE**: The module is usually automatically installed as a dependency.

## Usage

1. To create a package that uses this extension module add the following to your nuspec specification:

	```XML
	<dependencies>
	    <dependency id="chocolatey-toast.extension" version="1.0.0" />
	</dependencies>
	```

	**NOTE**: Make sure you use adequate minimum version.

2. In your chocolatey package chocolateyinstall.ps1 file add the following function calls:

	```PowerShell
	Show-ChocolateyInstallStartedToast $packageName $packageVersion;
	Show-ChocolateyInstallSuccessToast $packageName $packageVersion;
	Show-ChocolateyInstallFailedToast $packageName $packageVersion;
	```

3. In your chocolatey package chocolateyuninstall.ps1 file use the following function calls:

	```PowerShell
	Show-ChocolateyUninstallStartedToast $packageName $packageVersion;
	Show-ChocolateyUninstallSuccessToast $packageName $packageVersion;
	Show-ChocolateyUninstallFailedToast $packageName $packageVersion;
	```

## Change Log

### Version 1.0.0

#### New Features

* Added support to Show-ChocolateyToast message
* Added support to Show-ChocolateyInstallStartedToast message
* Added support to Show-ChocolateyInstallSuccessToast message
* Added support to Show-ChocolateyInstallFailedToast message
* Added support to Show-ChocolateyUninstallStartedToast message
* Added support to Show-ChocolateyUninstallSuccessToast message
* Added support to Show-ChocolateyUninstallFailedToast message

#### Notes

* Works only on Windows 10
* Can be used on other versions of Windows but nothing will happen;