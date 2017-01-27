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

function Show-ChocolateyToast {
    param(
      [string] $title = $null,
      [string] $text = $null,
      [boolean] $success = $true,
      [boolean] $popup = $true,
      [DateTime] $expirationTime = [System.DateTime]::MinValue
    )

    try
    {
        $installDirectory = $env:ChocolateyInstall;

        $toastAppId = 'Chocolatey Toast';
        $toastTag = [System.DateTime]::Now.Ticks.ToString().SubString(4);
        $toastTitle = $title;
        $toastText = $text;
        $toastImage = "file:///$installDirectory\extensions\chocolatey-toast\images\toast-failure.png";

        if ($success)
        {
            $toastImage = "file:///$installDirectory\extensions\chocolatey-toast\images\toast-success.png";
        }

        if ($expirationTime -eq [System.DateTime]::MinValue)
        {
            if ($success)
            {
                $expirationTime = [DateTime]::Now.AddHours(1);
            }
            else
            {
                $expirationTime = [DateTime]::Now.AddHours(24);
            }
        }

        if ([System.Environment]::OSVersion.Version.Major -eq 10)
        {
            Init-ChocolateyToast $toastAppId;
        
            [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null;
            $toastTemplate = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastImageAndText02);

            $toastXml = [xml] $toastTemplate.GetXml();

            $imageAltAttribute = $toastXml.CreateAttribute('alt');
            $imageAltAttribute.Value = $toastAppId;

            $imageSrcAttribute = $toastXml.CreateAttribute('src');
            $imageSrcAttribute.Value = $toastImage;
    
            $toastXml.GetElementsByTagName('image')[0].Attributes.SetNamedItem($imageAltAttribute) | Out-Null;
            $toastXml.GetElementsByTagName('image')[0].Attributes.SetNamedItem($imageSrcAttribute) | Out-Null;
            $toastXml.GetElementsByTagName('text')[0].AppendChild($toastXml.CreateTextNode($toastTitle)) | Out-Null;
            $toastXml.GetElementsByTagName('text')[1].AppendChild($toastXml.CreateTextNode($toastText)) | Out-Null;
    
            $xml = New-Object Windows.Data.Xml.Dom.XmlDocument;
            $xml.LoadXml($toastXml.OuterXml);

            $toast = [Windows.UI.Notifications.ToastNotification]::new($xml);
            $toast.Group = $toastAppId;
          	$toast.Tag = $toastTag;
            $toast.ExpirationTime = $expirationTime;
            $toast.SuppressPopup = ($popup -eq $false);

            $notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($toastAppId);
            $notifier.Show($toast);
        }
    }
    catch
    {
        # Ignore exception.
    }
}