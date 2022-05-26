---
created: 2022-05-25T17:57:36+05:30
updated: 2022-05-26T21:09:16+05:30
---
[[100 Notes|Notes]]

---
# Portfolio
- Built using [[Hugo]]
- [Hugo PaperMod Theme](https://github.com/adityatelange/hugo-PaperMod) in **Profile Info** mode
- [GitHub Repo](https://github.com/arkalim/portfolio)

## Setup
Create a new site
```
hugo new site portfolio -f yaml
```
```
cd portfolio
```
Initialize Git and install [Hugo PaperMod Theme](https://github.com/adityatelange/hugo-PaperMod)
```
git init
```
```
git submodule add https://github.com/adityatelange/hugo-PaperMod themes/PaperMod --depth=1
```
Commit changes and publish repo.

## Updating Theme
```
git submodule update --remote --merge
```

## Publish to Netlify
- Push the changes to remote to trigger auto build and deploy to Netlify
- Setup using [[Hugo#Publish to Netlify]]

## Custom Domain in Netlify
- Open Netlify
- In the site's domain settings, add a custom domain `arkalim.org`
- For the custom domain, go to DNS panel
	- ![[attachments/Pasted image 20220526205603.png]]
- Copy the NS records provided and update the domain registrar's NS to these
	- ![[attachments/Pasted image 20220526205710.png]]
- Wait for the NS records to change in the domain registrar
- In the HTTPS section, verify the SSL certificate for free