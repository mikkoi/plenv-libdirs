# plenv-libdirs

A [plenv](https://github.com/tokuhirom/plenv) plugin to add additional include directories to Perl.

This plugin sets the contents of file `.perl-libdirs`.
It hooks into `plenv-exec` command and every time you run `perl`
or any other command under **plenv**, `plenv-libdirs` uses the
`.perl-libdirs` files to set the PERL5LIB environment variable.

`plenv-libdirs` makes use of `.perl-libdirs` files
in the current working directory and every directory
between it and root.
Environment variable PERL5LIB has a list of paths separated (like in PATH)
by a colon on Unixish platforms and by a semicolon on Windows
(the proper path separator being given by the command perl -V:path_sep).
When `plenv-libdirs` collects the paths from `.perl-libdirs` files,
the order of the paths follows the order of the directories.
The longer the path to `.perl-libdirs` file, the higher precedence in PERL5LIB.

Like environment variable PATH, `perl` uses the paths in PERL5LIB
in the order they appear. Likewise, the search paths in `perl-libdirs` files
appear in the same order. Example:
three projects in dir `root`: *project-a* has a dependency
on *utils* and its test files have a dependency on *testing-utils*.
Together, when working directory in `/root/project-a`,
these would result in: `PERL5LIB=/root/testing-utils/lib:/root/utils/lib`

```
root: projects
|- .perl-libdirs: **/root/utils/lib**
|- project-a
|  |- .perl-libdirs: **/root/testing-utils/lib**
|  |- lib
|  |- t
|
|- utils
|  |- lib
|
|- testing-utils
   |- lib
```

## Installation

```sh
mkdir -p ${PLENV_ROOT}/plugins
git clone https://github.com/mikkoi/plenv-libdirs.git ${PLENV_ROOT}/plugins/plenv-libdirs
mkdir -p ${PLENV_ROOT}/plenv.d/exec
ln -s ${PLENV_ROOT}/plugins/plenv-libdirs/plenv.d/exec/libdirs.bash ${PLENV_ROOT}/plenv.d/exec/libdirs.bash
```

## Usage

```
$ plenv libdirs ../other-project
$ plenv libdirs
../other-project/lib
$ plenv libdirs --add /tmp/second-project
$ plenv libdirs
../other-project/lib:/tmp/second-project
$ plenv libdirs --rm ../other-project
$ plenv libdirs
/tmp/second-project
$ perl -M5.020 -Mstrict -W -e 'say $INC[0];'
/tmp/second-project
$ plenv libdirs --unset
$ plenv libdirs
```

## AUTHOR

Mikko Koivunalho

## LICENSE

See [the document](./LICENSE).
