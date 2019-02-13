# GC.HTTPSEVERYWHERE.IIS
How the heck do we comply with the [TBS ITPIN on Implementing HTTPS for Secure Web Connections](https://www.canada.ca/en/treasury-board-secretariat/services/information-technology/policy-implementation-notices/implementing-https-secure-web-connections-itpin.html) on a legacy server running IIS7?

## 1. Get yourself a certificate
I used a self signed certificate for our tests (I know... I know...), but our production certificate will come from our infrastrucutre service provider. 

Mercifully, there are also ways to [get certificates from LetsEncrypt onto a website that lives in IIS](https://weblog.west-wind.com/posts/2016/feb/22/using-lets-encrypt-with-iis-on-windows).

## 2. Apply the certificate
I followed a guide from [DigiCert](https://knowledge.digicert.com/solution/SO14335.html). Verify that you can access your site from a browser using HTTPS. 

*Note: Sites that use a self signed certificate will rightfully throw all kinds of red flags and warnings if you try to access them via HTTPS with any modern browser.*
