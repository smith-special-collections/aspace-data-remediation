# Single-use Fixup Scripts

In this directory, you'll find scripts that have been run
over the Smith EAD corpus.  They're essentially kept for historical
value, rather than intended for use - once run, the results are copied over
the existing EAD files.

Still, if you should need to run them:

1. cd into the top directory of this repository
2. `bundle`
3. `mkdir out`
4. `bundle exec ruby scripts/scriptnameGoesHere.rb` (example: `bundle exec ruby scripts/unitid-dupe-fixer.rb`)
