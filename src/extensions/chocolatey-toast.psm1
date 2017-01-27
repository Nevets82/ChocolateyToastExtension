# Chocolatey Toast Extension (Unofficial)
# Copyright (C) 2016-2017 Steven Lietaer, All rights reserved.
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

$ScriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition;

Import-Module "$ScriptPath\Init-ChocolateyToast.ps1";
Import-Module "$ScriptPath\Show-ChocolateyToast.ps1";
Import-Module "$ScriptPath\Show-ChocolateyInstallFailedToast.ps1";
Import-Module "$ScriptPath\Show-ChocolateyInstallStartedToast.ps1";
Import-Module "$ScriptPath\Show-ChocolateyInstallSuccessToast.ps1";
Import-Module "$ScriptPath\Show-ChocolateyUninstallFailedToast.ps1";
Import-Module "$ScriptPath\Show-ChocolateyUninstallStartedToast.ps1";
Import-Module "$ScriptPath\Show-ChocolateyUninstallSuccessToast.ps1";

Export-ModuleMember -Function Show-ChocolateyToast;
Export-ModuleMember -Function Show-ChocolateyInstallFailedToast;
Export-ModuleMember -Function Show-ChocolateyInstallStartedToast;
Export-ModuleMember -Function Show-ChocolateyInstallSuccessToast;
Export-ModuleMember -Function Show-ChocolateyUninstallFailedToast;
Export-ModuleMember -Function Show-ChocolateyUninstallStartedToast;
Export-ModuleMember -Function Show-ChocolateyUninstallSuccessToast;
