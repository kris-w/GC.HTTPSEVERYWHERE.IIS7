# GC.HTTPSEveryWhere.IIS7

==This guide and code are depricated - do not use! Check the TBS ITPIN for the latest requirements!==

How the heck do we comply with the [TBS ITPIN on Implementing HTTPS for Secure Web Connections](https://www.canada.ca/en/treasury-board-secretariat/services/information-technology/policy-implementation-notices/implementing-https-secure-web-connections-itpin.html) on a legacy server running IIS7?

## 1. Get yourself a certificate
I used a self signed certificate for our tests (I know... I know...), but our production certificate will come from our infrastrucutre service provider. 

Mercifully, there are also ways to [get certificates from LetsEncrypt onto a website that lives in IIS](https://weblog.west-wind.com/posts/2016/feb/22/using-lets-encrypt-with-iis-on-windows).

## 2. Apply the certificate
I followed a guide from [DigiCert](https://knowledge.digicert.com/solution/SO14335.html). Verify that you can access your site from a browser using HTTPS. 

*Note: Sites that use a self signed certificate will rightfully throw all kinds of red flags and warnings if you try to access them via HTTPS with any modern browser.*

## 3. Install the URL Rewrite module for IIS7
I downloaded the module from the Microsoft's [URL Rewrite Module 2.0 for IIS 7](https://www.microsoft.com/en-us/download/details.aspx?id=7435) page, ran the MSI installation package.

## 4. Redirect all HTTP requests to HTTPS
The sample web.config file contains entries to handle the redirect configuration. Merge the contents of this with your own web.config file.

If you would prefer the point and click approach, you can follow the guide from Namecheap on [Implementing redirects from HTTP to HTTPS in IIS](https://www.namecheap.com/support/knowledgebase/article.aspx/9953/38/iis-redirect-http-to-https).

## 5. Enable HSTS
Again, the entries in the sample web.config file already takes care of this. *Reminder: merge the contents of this with your own web.config file, do not simply overwrite your own.*

However, if you'd rather click through the Windows interface, TBS Certificates (no, not that TBS) provides a nice writeup on how to [Configure HSTS on IIS 7/8](https://www.tbs-certificates.co.uk/FAQ/en/hsts-iis.html)

## 6. Enable TLS 1.2
The sample powershell script takes care of this for you. 

If you would rather apply this change manually in the registry, see the [How to enable TLS 1.2 on Windows Server 2008 R2](https://support.quovadisglobal.com/kb/a433/how-to-enable-tls-1_2-on-windows-server-2008-r2.aspx) by QuoVadis Global. 

## 7. Disable Older Versions of SSL, TLS, and weak ciphers
Once again, the sample powershell script can do all of this for you. It already contains calls to set registry values to disable old versions of SSL, TLS, and some known weak ciphers. However, check in with your departmental technical security teams to determine if any additional entries are required, and be sure to test using the HTTPS diagnostic tool of your choice!

Since all of this configuration is handled in the registry, you may want to stick to scripting this. However, you can manually add these to the registry as well. TBS Certificates hosts a list of keys to modify to [How to disable weak ciphers such as RC4 and 3DES on Windows Server](https://www.tbs-certificates.co.uk/FAQ/en/desactiver_rc4_windows.html). SSL Shopper has an alternative guide that includes [Instructions on disabling other weak ciphers and keys for older version sof SSL and TLS](https://www.sslshopper.com/article-how-to-disable-ssl-2.0-in-iis-7.html).
