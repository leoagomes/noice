# Noice

Noice is a simplified RTS (Real Time Strategy) game with an online focus.

It is still under development and no usable product is available at the moment.

## Building

Because of the dependency of some modules on Moonscript, there is a need to
build some of the files.

### Dependencies

* Moonscript, definitely.
* consequently lua and luarocks
* [LOVE](http://love2d.org)

Install `lua` (preferrably version 5.1) and `luarocks` using your OS' package
manager (like pacman, brew or chocolatey), then install moonscript by running
`luarocks install moonscript`.

### Building...

Running `moonc .` on the root of this project should suffice. A building\cleanup
script is under development as well.

## License

All code in this repository unless where stated otherwise (which is the case of
libraries inside the lib directory) is released under the GNU Affero GPL at the
moment (which may change in the future). For more information on licensing,
please check LICENSE.