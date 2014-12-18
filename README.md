# BAMRU.org Static Website

## Overview

BAMRU.org is a public-facing website composed of static assets. (html, css, images, javascript).  A live version of this website is at http://andyl.github.io/BAMRU-Org/.

A site generator called [MiddleMan](http://middlemanapp.com) is used to generate the static assets from page templates.

Templates are in plain-text formats like [Markdown](http://en.wikipedia.org/wiki/Markdown), [ERB](http://en.wikipedia.org/wiki/ERuby) and [Slim](http://slim-lang.com).

The static assets can be served from any webserver.  For convenience and cost-savings, we use [GitHub Pages](https://pages.github.com) as the server host.

Using MiddleMan, the editing workflow generally follows this cycle:

1) Set up the required tools and repositories.  Get access to the BAMRU.org repo.

2) Clone the repo, make edits and test locally.

3) Upload the finished commits, and publish the edits.

## Who Can Edit

Any BAMRU Member or Supporter is welcome to do hands-on editing.  Contact Andy L. for info on current needs.  [Fork](http://help.github.com/articles/fork-a-repo) this repository if you would like to experiment.

Maintaining the website is a team effort with multiple roles.

| Role       | Responsibility                                      |
| ----       | --------------                                      |
| Copywriter | Make textual edits                                  |
| Designer   | Create site styling, edit graphics                  |
| JS Coder   | Client-Side Javascript for interactive components   |
| Ruby Coder | Server-Side Ruby for site generation and automation |

## Tools and Skills

To be productive, you will the following tools and skills:

### Tools

* Ubuntu or Mac computer
* Good internet connection

### Required Skills

* Command Line Savvy
* Text Editor Skills
* Knowledge of [Git](http://git-scm.com) & [GitHub](http://github.com)

### Nice-To-Have Skills

* Ruby
* Middleman / Rails
* Markdown / ERB / Slim
* CSS
* JavaScript / Coffeescript
* ReactJS / Reflux

## Environment Setup

TBD

## Repo Setup

Before starting, you must have update rights on the repo.

First step is to make sure there is a gh-pages branch which holds the HTML output.

    git clone git@github.com:andyl/BAMRU-Org.git    # clone the repo
    git branches -a                                 # show all branches - make sure there is a `gh-pages` branch
    git checkout -b gh-pages origin/gh-pages        # make a local copy of the `gh-pages` branch

## Support Software

This site depends on Ruby 2.1.5 and the `middleman` gem.

    ruby-install ruby 2.1.5
    cd <dir>/BAMRU-Org
    gem install bundler
    bundle

## Building the Site

Project input is read from the `source` directory.

To run the generator:

    cd <dir>/BAMRU-Org
    bundle exec middleman build

Project output is written to the `out` directory.

## Deploying the Site

The project is hosted on github pages.  Output HTML is stored on the `gh-pages` branch.

The manual deploy process looks like this:

    cd <dir>/BAMRU-Org
    rm -rf /tmp/output
    cp -r output /tmp
    git checkout gh-pages
    rm -rf .
    cp -r /tmp/output/* .
    git add .
    git commit -am'update website'
    git push
    git checkout master

See [GitHub Pages](http://pages.github.com) to learn more.

## Rake Tasks

The build and deploy tasks have been automated using a Ruby tool called [Rake](http://en.wikipedia.org/wiki/Rake_%28software%29).

To view all of the Rake options, type `rake -T`.

Most important Rake tasks include:

    rake site:generate     # run the build command
    rake site:deploy       # run the deploy script 
