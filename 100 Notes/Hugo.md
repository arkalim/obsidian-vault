---
created: 2022-05-25T10:03:46+05:30
updated: 2022-05-25T15:57:44+05:30
---
[[../000 Home|Home]]

---
# Hugo
Open-source static site generator based on GoLang
## Quick Start Guide
[Quick Start | Hugo](https://gohugo.io/getting-started/quick-start/)

## Installation
```
brew install hugo
```

## PaperMod Theme
[Hugo PaperMod Theme](https://github.com/adityatelange/hugo-PaperMod)

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
[Getting Started With Hugo](https://www.youtube.com/watch?v=hjD9jTi_DQ4)