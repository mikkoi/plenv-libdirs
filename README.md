# plenv-libdirs

A [plenv](https://github.com/tokuhirom/plenv) plugin to add additional include directories to Perl.

## Installation

```sh
mkdir -p ${PLENV_ROOT}/plugins
git clone https://github.com/mikkoi/plenv-libdirs.git ${PLENV_ROOT}/plugins/plenv-libdirs
mkdir -p ${PLENV_ROOT}/plenv.d/exec
cp ${PLENV_ROOT}/plugins/plenv-libdirs/plenv.d/exec/libdirs.bash ${PLENV_ROOT}/plenv.d/exec/
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
