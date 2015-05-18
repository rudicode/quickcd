# Quickcd

## Installation

Install it as a gem:

    $ gem install quickcd

## Usage

qcd runs inside your current shell and changes to your predefined directories
you need to source qcd.sh to add the qcd function to your shell.
the function will execute the ruby script qcd which does all the logic.


Features:

    qcd code
    qcd proje
    qcd code\some
    qcd 23

  cd into directory with associated shortcut.
  Checks for exact match in shortcuts and changes to the directory associated
  If no match is found then it checks for partial matches in directories.
  If there is more than one match it will go to the next on
  on the list.


    qcd

  Switch back to last changed directory. This is shared between
  terminals. So if in one terminal you do qcd /some/really/long/directory
  then in another terminal just do a qcd and it will take you to that last
  one.

    qcd -l

  lists all the saved directories.


    qcd -l proje

  list saved directories that match proje


    qcd -a
    qcd -a ~/code/fluffy_bunny

  add the current directory to the list.
  
  add the given directory to the list


    qcd -s

  sort the directory listing. Be careful, as it changes your numbering


    qcd -show-stale

  Shows all directories that are currently listed but do not exist anymore.
  Also shows directories that can't be reached because they are not mounted.
  Use this to see which directories will be removed with the -remove-stale
  command


    qcd -remove-stale

  Checks each entry to see if it exists, if not it copies the entry
  to ~/.qcd/removed, and removes it from ~/.qcd/directories
  Caution: If you saved directories to unmounted devices, those will
  be removed as well.


    qcd -h

  get help info


***

Config files

    ~/.qcd/directories

You can edit the directories and their positions

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/quickcd/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
