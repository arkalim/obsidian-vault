---
created: 2022-05-25T10:03:46+05:30
updated: 2022-05-25T16:35:18+05:30
---
[[100 Notes|Notes]]

---
# Hugo
Open-source static site generator based on GoLang
## Quick Start Guide
[Quick Start | Hugo](https://gohugo.io/getting-started/quick-start/)

## Points
- Steps to install a theme is provided in the theme's GitHub repo
- Configurations depend upon the theme
- `draft: true` makes a post only available during the development server and it will not be built for the final website

## Installation
```
brew install hugo
```

## Themes
[Hugo PaperMod Theme](https://github.com/adityatelange/hugo-PaperMod)

#### Modifying Themes
- In the layouts folder, create folders to match the exact path of the file that you want to modify from the theme's layout folder (`themes/themeName/layout`)
- Copy the file to that path in the layouts folder and edit it

> If we edit the layouts of the theme directly, then the updates will get overwritten if we update the theme

## Commands
#### Create a new site
With `.toml` config file
```
hugo new site my-blog
```
With `.yaml` config file
```
hugo new site <name of site> -f yaml
```

#### Create a new post
```
hugo new posts/first-post.md
```
This automatically adds front-matter to the created MD file

#### Start development server
```
hugo server -D
```

## Folder Structure
- Whenever you create a new Hugo site, these folders will be automatically created:
	- `content` - for MD files
	- `layouts` - to overwrite default theme layouts
	- `static` - for static assets like images
	- `themes` - contains all the themes

## Resources
[Hugo Tutorial with PaperMod Theme](https://www.youtube.com/watch?v=hjD9jTi_DQ4)