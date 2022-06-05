---
created: 2022-05-25T17:57:36+05:30
updated: 2022-06-05T13:06:22+05:30
---
[[../Notes|Notes]]

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

## Favicon
- Use [vecteezy.com](https://www.vecteezy.com/free-vector/ar-logo) for logos
- Remove background using [slazzer.com](https://www.slazzer.com/)
- Convert to Favicon using [Favicon Generator](https://favicon.io/favicon-converter/)
- Put `favicon.ico` under the `static` folder

## Publish to Netlify
- Push the changes to remote to trigger auto build and deploy to Netlify
- Setup using [[Hugo#Publish to Netlify]]

## Custom Domain in Netlify
- Open Netlify
- In the site's domain settings, add a custom domain `arkalim.org`
- For the custom domain, go to DNS panel
	- ![[../attachments/Pasted image 20220526205603.png]]
- Copy the NS records provided and update the domain registrar's NS to these
	- ![[../attachments/Pasted image 20220526205710.png]]
- Wait for the NS records to change in the domain registrar
- In the HTTPS section, enable SSL encryption for free using **Let's Encrypt**
- Resource: [How to connect a domain name to Netlify - YouTube](https://www.youtube.com/watch?v=qlrCptpwtgs)

## Important
- Use `#center` to center an image in MD `![name](path/to/image.png#center)`

## Theme Modifications
- Added a custom param `hideDescriptionInList`  to show or hide description in list view
- Added a new variable `dateString` to allow us to write date as string
- Changed footer text to: © 2022 [Abdur Rahman](https://arkalim.org/)
- Added empty character and a space in front of TOC
- Change cursor to pointer when expanding or collapsing TOC
- Changed font size of Post Meta to 14 and Description in List View to 18
- Made the header sticky (required update in the Mobile view)