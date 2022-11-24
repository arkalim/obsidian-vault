---
created: 2022-09-23T23:24:50-04:00
updated: 2022-09-26T13:42:08-04:00
---
[[Pre-Requisites]]

---
# Security

##  Asymmetric Keys
- Data can be encrypted by either one of them and will be decrypted by the other
- If you encrypt your data with your private key, anyone with your public key can decrypt your data.
- Private keys have the word `key` in their name
	- ![[attachments/Pasted image 20220926132925.png]]

## SSL & TLS Certificates
- A certificate is used to guarantee trust between two parties during a transaction
- TLS (Transport Layer Security) certificate ensure that the communication between the user and the server is encrypted and the server is who it says it is.
- TLS or HTTPS relies on symmetric encryption which is computationally light. But, if the key is sniffed while being sent from the server to the user, it could be used to decrypt the communication between the user and the server. So, we use asymmetric encryption to encrypt & transfer the symmetric key from the user to the server and then use symmetric encryption for future communications.

## SSH
- The user wants to securely connect to the server
- The **user generates a key pair** (public and private key)
	- `ssh-keygen` - this will generate a private key (`id_rsa`) and a public key (`id_rsa.pub`)
- Add the public key to the list of authorized keys for SSH (`~/.ssh/authorized_keys`)
	- `ssh-copy-id -i ~/.ssh/mykey.pub <user>@<server>`
- When doing an SSH into the server, the user specifies the private key in the SSH command
	- `ssh -i id_rsa user@server`

> - We can use the same key pair to SSH into multiple servers by adding the public key to their list of authorized keys for SSH.
> - We can authorize other users to SSH into our server by adding their public keys into `~/.ssh/authorized_keys`

## How TLS works
#### Encrypting Communication
- The **server generates a private and public key pair**
	- ![[attachments/Pasted image 20220926122851.png]]
- The server sends the public key to the user (could be sniffed)
- The user's browser generates a symmetric key and encrypts it using the public key which was sent by the server.
- The encrypted symmetric key is then sent to the server (could be sniffed)
- The server decrypts the symmetric key using the private key
- Now, both client and server have the same symmetric key and can secure all future communication between them.

#### Verifying Server Identity
- When the server sends the public key, it sends the key inside a digital certificate. The certificate contains information about the identity of the web server. 
- **Self-signed certificates** are not trusted as anyone can generate a certificate and sign it themselves. So, the identities of servers sending self-signed certificates are not verified.
- Modern web browsers validate the certificate sent by the server during the SSL handshake. If the certificate is self signed, they will warn you.
- Certificates signed by **Certificate Authorities (CA)** are trusted. Some common CAs are Symantec, GlobalSign, Comodo, DigiCert etc.
- To get your certificate signed by a CA, you need to generate a **Certificate Signing Request (CSR)** using the public key and the domain name of your website. Once they verify your server's information, they sign your certificate and send it to you.
	- ![[attachments/Pasted image 20220926130250.png]]
	- The CSR file needs to be sent to the CA for signing

> This whole process of generating and maintaining certificates is called Public Key Infrastructure (PKI)

> [!tip]+ How do browsers verify CA's identity?
> - Every CA has a key pair. They use the private key to sign the certificate.
> - The public keys of all the CAs are saved in the browser. The browser verifies the certificate's sign using the public key of the associated  certificate authority.

> [!important]+ Verifying sites hosted locally
> We can deploy a CA locally for our private network (eg. organization's network). Most of the CA companies offer a private version of their service.
> Once a CA server is set up in your internal network, you can then install the public key of the CA on all of the employees' browsers to establish secure connectivity within your organization.