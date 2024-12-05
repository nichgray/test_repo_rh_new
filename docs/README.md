# Documentation
{:.no_toc}

Welcome to the Recovery Hub Edition template. To get started with your own edition click the "Use this template" button above to make a copy on your own GitHub account. To publish, you can enable GitHub Pages by going to your new repository's settings and in the "Pages" tab, choose your branch as the source and save. (Note, your repository must be public!) Github will then display the URL of your new site. 

In order for links to work, you will then need to change your `_config.yml` file (See "editing directly on github" below) ((TODO: add)) with the values of this new URL. 

If your URL is, for instance, `https://recoveryhub.github.io/edition_base/`

then these will be your values (note the slash placement): 

```
baseurl: "/edition_base"
url: "https://recoveryhub.github.io/"
```

Once GitHub regenerates your pages (it can take up to a couple of minutes but is usually pretty quick) you can see your site.

## Table of Contents
{:.no_toc}

* Table of Contents
{:toc}

## To Add

- Brief explanation of jekyll, minima, github pages
  - File structure
- some boilerplate text on recovery work
- info on "upgrading"
- Editing files via github
- Working on files on your computer
- text files and uses, file naming conventions (from here: https://github.com/recoveryhub/recoveryhub.github.io/blob/gh-pages/_docs/docs.markdown, we will need to decide what goes where)

## Jekyll Version

Built with Jekyll 3.9.0

note: as of this publication, this is the latest version of Jekyll that 
will work natively with GitHub Pages
see here: for up to date details: https://pages.github.com/versions/

If you need to look up documentation, the current docs on jekyllrb.com will not always work since they are for a newer version. Looking for the page you need at the 3.9.0 release tag may help https://github.com/jekyll/jekyll/tree/v3.9.0/docs

## Config file

The config file is meant for settings that affect your whole blog, values
which you are expected to set up once and rarely edit after that. If you find
yourself editing this file very often, consider using Jekyll's data files
feature for the data you need to update frequently.

If you need help with YAML syntax, here are some quick references for you: 
https://learn-the-web.algonquindesign.ca/topics/markdown-yaml-cheat-sheet/#yaml
 https://learnxinyminutes.com/docs/yaml/

### Site settings
These are used to personalize your new site. If you look in the HTML files,
you will see them accessed via {{ site.title }}, {{ site.email }}, and so on.
You can create any custom variable you would like, and they will be accessible
in the templates via {{ site.myvariable }}.

## Theme

The Recovery Hub base theme is based off "Minima", a Jekyll theme for writers. The base theme adds additional styling and guidance for creating text based editions, as well as some useful starter templates for things like pagination and tables of contents. 

## Preparing files

All markdown files must have either a # header at the top of the document (because GitHub Pages using jekyll-optional-front-matter as a dependency 5 https://github.com/benbalter/jekyll-optional-front-matter), or must declare a title: in the frontmatter. 

Files that don't do one of these things will be not be processed - that is, they won't be transformed into HTML or included in any of the listings, but they will be passed through as is. For more information see metadata, below. 

### Markdown

The only text format currently supported is markdown. The site supports kramdown for special formatting, as well. 

Todo: either find sites to link to or explain more here

### Metadata

Unless you directly specify metadata other than title (Author, date, etc) it will not appear for items in the metadata for the page and so will not be available for harvesters or citation programs (i.e. zotero)

In order to add this, you will either need to define it in the frontmatter of each page or add the values in the _config.yml file. Frontmatter is a better approach if every item might be different, while the config is useful if an entire folder share the same values. 

- `title:` If you have a markdown header at the top of your file, that will be taken as the "title" for the page. if you would like to set a different title, you can do so using the `title:` value
- `creator:` (look up how this would work for multiple values)
- `contributor:` contributors to the digital file, transcribers, encoders, etc.
- `published_date:` (look to see how this would work)

TODO: figure out other metadata that would need to be added to make different doc types save correctly in zotero, etc.

