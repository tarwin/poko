Quick introduction to Poko / PokoCMS

# Introduction #

Poko is a web framework written in the **haxe** programming language, targeted at a **PHP** back-end. PokoCMS is a data-centric Content Management System (CMS) created using Poko, both as a useful tool and a demonstration of how you can use Poko.

The source contains an example site, including both simple Poko examples as well as demonstrations of how the CMS can be used and integrated.

# Poko #

Poko is loosely based on the the ideas of MVC (Model View Controller) frameworks, but tries to not force you to write any container code, and generally get out of your way while providing good tools to get your job done.

If you're coming from an MVC background, you may like to think of the sytem like this:

  * Model: The database
  * View: A template
  * Controller: A class

Poko does **not** provide any CRUD (Create Read Update Delete) mechanisms, and encourages the use of the PokoCMS as a data management layer. The data for a lot of websites can generally be pulled from your data source (database) by one (or at most two) SQL query, so why complicate things?

It provides the flexibility of PHP (just start coding), but without just dropping you in the dessert with a map written in 5 different languages, none of them you understand, except the footnotes (if that makes any sense?).

Templates can be written in either Templo or PHP, and by default the template with the same name (different extension) as the class file is used, with all of that class files public variables (and functions) accessible from the template. Accessing functions from PHP templates may be a little more tricky than from Templo.

Currently Poko works best output to a PHP target, but may be modified for use with a Neko target.

Poko comes with a build script (currently just a Windows batch file) which by default builds both your Poko site, and the attached content management system.

# PokoCMS #

The PokoCMS is different than many CMSs out there. For years we played around with other web frameworks, and other CMSs trying to find one that would not get in our way, and would not force us to work for it, but have it work for us. To allow us to create any kind of data structure we needed but not have us having to create widgets or templates to do so.

It is not a CMS for a mom-and-pop operation to use to create a family photo album (though I could probably teach my dad how to do it in a few yours) but instead is aimed at developers. You should know a bit about databases and have a good idea of how you want to structure your database before even thinking about using PokoCMS!

Thought PokoCMS does allow you to create _pages_, the main focus of the site is to provide deep data manipulation with record lists, sub lists, one-to-one, many-to-one and many-to-many associations.

It also provides easy input for files, images, rich text (through WYMEditor) and a whole lot more, as well as robust error / input handling and filtering (which doesn't actually work yet, sorry).

PokoCMS also supplies hooks such as being able to run SQL queries on adding or deletion of records. It allows you to create lists of data with filterable headings (via SQL), searching and pagination.

# Some things we're thinking adding; want to help? #

## Poko ##

  * An easy way to set up new sites, rather than just copypasting old ones
  * More examples
  * Optional URL re-writing (though of course it can be annoying when writing your templates, we know!)

## PokoCMS ##
  * Internationalization / multi-language support in PokoCMS
  * A better WYSIWYM editor, that includes detection of pasting from Word (or HTML sources)
  * Full documentation
  * Better, richer examples
  * A free Java Applet FTP uploader (anyone want to write one for us?)
  * Better user control with access rights for CRUD per table, row and
  * Record / page locking
  * Some kind of "page roll" that makes it easier to use the system on page/article based sites, including the ability for editors to add pages
  * Nice popups with easy to use GUIs for Site Map options (there is a lot you can do with the Site Map but you have to read the code to know what it is!)
  * A simple way to add new database fields when you can't be bothered going to phpMyAdmin
  * Auto-generation helper that can show a white-board template site directly from reading the Site Map.
**Inline help when creating things liked linked tables.** Auto-generation (or some kind of helper) for fields needed for linked tables, and multilink tables!