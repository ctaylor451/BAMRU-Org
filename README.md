# BAMRU.org Static Website

[![Build Status](https://travis-ci.org/andyl/BAMRU-Org.svg)]
(https://travis-ci.org/andyl/BAMRU-Org)
[![Code Climate](https://codeclimate.com/github/andyl/BAMRU-Org/badges/gpa.svg)]
(https://codeclimate.com/github/andyl/BAMRU-Org)

## Overview

BAMRU.org is a public-facing static website.  The live version of this website
is at http://bamru.org .

Any BAMRU Member or Supporter is welcome to do hands-on editing or programming.
Contact Andy L. for info on current needs.
[Fork](http://help.github.com/articles/fork-a-repo) this repository if you
would like to experiment.

## Editing Workflow

A site generator called [MiddleMan](http://middlemanapp.com) is used
to generate the static assets from page templates.

Templates are in plain-text formats like
[Markdown](http://en.wikipedia.org/wiki/Markdown),
[ERB](http://en.wikipedia.org/wiki/ERuby) and
[Slim](http://slim-lang.com).

The static assets can be served from any webserver.  For convenience
and cost-savings, we use [GitHub Pages](https://pages.github.com) as
the server host.

The development/editing workflow generally follows this cycle:

1) Set up the required tools and repositories.  

2) Fork the repo, then clone your fork.  Make edits and test locally.

3) Push your edits to your fork, then submit a pull request.

## How to Contribute

You'll need a GitHub account, Ubuntu or UbuntuVM, Command Line savvy and basic
coding skills (HTML, CSS, JS, Ruby).

[Contributing](./docs/contributing.md)

[About the Development Environment](./docs/dev_environment.md)

[Changing the Website](./docs/web_editing.md)

[Integrating with Google Calendar](./docs/google_calendar.md)

[Running Auto-Updates with Cron](./docs/cron.md)

[Pair Programming](./docs/pair_programming.md)
