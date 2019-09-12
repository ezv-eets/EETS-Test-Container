# EETS-Test-Container (CH)

This document describes the setup process for the container based testing solution.

### Prerequisites
In order to run this container the following tools have to be installed on your device:
1. [Docker](https://docs.docker.com/install)
2. [Docker-Compose](https://docs.docker.com/compose/install/)

### Configuration
Before you can run any tests with this setup certain things have to be configured:
#### Provider identification
First of all we need to know how you are. 
Therefor please provide us with your countryCode, providerIdentifier and name according to your registration.
To do so set the properties in the `provider.properties` file accordingly.

In addition to that we need to know the common-name of your client certificate (the one used to establish the mTLS connection) in order authenticate your request.
Please add the `commonName` property to the `provider.properties`-file as well. 
#### Certificates:
##### mTLS
The production environment of the IS-EETS-System uses mutual TLS authentication. 
To achieve a similar setup for your test a few thing need to be considered:
* Export your CA-Certificate and save it to the following path: `cert/client_ca.crt`. This allows us to establish a trust relationship to the (potentially self-signed) certificate your system uses for testing purposes.
* In order for your system to establish trust to this container setup you have two options.<br> 1. You can use the self-signed certificates that we deliver within the `cert`-folder and make sure that your system trusts those.
<br> 2. You can provide certificates that you created according to your systems needs. If you choose that option you have to export the certificate-cain (`cert/fullchain.pem`) as well as the private-key (`cert/privkey.pem`) and sve both files to the corresponding path. (Note that the filenames should be exact matches)
##### Message signature
All messages need to be digitally signed.
 
In order for us validate your systems signature we need to know the certificate you are using to sign your messages.
Please copy the certificate into the folder `eets-testsupport-service`.
After that change the `SIGNING_CERTIFICATE_FILE` argument (in the `docker-compose.yml`) to match the relative path of your certificate.

Since you might need to validate our signatures as well you can find the certificate that our test-setup uses for signing here: `cert/fca/eets-test-signing.crt`
 ### Startup
 After the configuration is completed starting the test-containers is pretty simple: Just run the following command in the project root directory:
 <br>```docker-compose up -d```
 
 ### Shutdown
 Run: `docker-compose down`
 
 
### Update
We will keep publishing new versions of our services to this repository as our services (and the container solution around it) evolve.
We recommend to pull from this repository on regular basis.
If a new version is available please perform a rebuild of the containers build by running:
<br>`docker-compose build --no-cache`<br>

You can also combine the build and startup command (depending on your OS and shell) by doing something like this:
<br>`docker-compose build --no-cache && docker-compose up -d`


### Advanced Configuration
Depending on your setup you might want to change some other settings. 
The most common settings that may need to be changed will be described here. However if there is something else you have to change, we would recommend you refer to the docker/docker compose documentation.

#### Ports
By default our services bind to the following ports of the host system:
* 0.0.0.0:80 --> Redirects to 0.0.0.0:443 
* 0.0.0.0:443 -->   The FCA's interface to the eets-providers
* 0.0.0.0:3320 --> The database of our services
* 0.0.0.0:8096 --> The Test-Support-Service that allows you to prepare, execute and assess the defended test-cases.

If you want to change these bindings you need to adjust the `docker-compose.yml` file. For each service that publishes ports there is a configuration-section like this:
```    
eets-testcontainer-testsupportservice: //service-name
  [...]
  ports:
    - "8096:8096"
```
You can change this port to eg.: 8099 by changing the configuration to: 

```    
eets-testcontainer-testsupportservice: //service-name
  [...]
  ports:
    - "8099:8096"
```
 Note that only the value on the left side has been changed.
 
 Restart the container and you will reach the test-support-service under:
 * 0.0.0.0:8099
 
### Tips
As an easy way to keep track of both your configuration and possible upstream changes we would recommend you to fork this repository.

### Get help / Get in touch 
If you have some feedback or need help please open an issue in this repository.