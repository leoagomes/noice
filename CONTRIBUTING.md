# Noice Contribution Guidelines

The intent of this document is to introduce possible contributors to the basic
workflow of contributing to Noice.

The first important part of developing Noice is having a proper development
environment.

## Environment Setup

The project is written in Lua, so having Lua installed is useful. Also, the
project uses Moonscript, which depends on LPEG, which needs a C compiler and
make.

We plan, in the future, to create a Docker image which can easily build the
project, but that's a bit into the future.

### C, Make and Build Essentials

If you already have an environment with the essentials to build a C application
(GCC, make, LD, etc.), you may skip this session and go straight to installing
Lua. If you're on Windows, then it might be better to have installed both MinGW
and MSVC.

#### Linux

```bash
# Quick guide to installing build essentials on various Linux distros
# Debia/Ubuntu (also Mint and Elementary)
$ sudo apt-get install build-essential
# Arch (also Manjaro) (it might already be installed)
$ sudo pacman -S base-devel

# (know how to install it on other distros? tell us in an issue!)
```

#### macOS

On the Mac, you need Xcode first and foremost, so download it from the App
Store. After you download everything and agree to Apple's policies, run

```bash
$ xcode-select --install
```

you may need to agree to more Apple policies.

#### Windows

On Windows, it is (obviously) more difficult, since nothing can ever work easily
on Windows.

For "guaranteed" (read the paragraph above once again) functionality, install
both MinGW and MSVC. MSYS (2) should also help. If you're interested, check
out chocolatey.

### Lua

You can find more information on Lua over at
[its website](https://www.lua.org/start.html), including a very simple
installation guide. We'll try to be a bit more specific/clear here, but you
should still check out their website. For this project, Lua versions 5.1 through
5.3 should work. Different platforms use different default versions; the only
important thing is to be using the same version for the `lua` binary and
`luarocks`.

#### Linux

Even though some Linux distros come with Lua preinstalled, it might be the case
that the development packages aren't, so you still might need to install some
of the packages listed below.

```bash
# Quick guide to installing Lua (with development packages) and LuaRocks
# Debia/Ubuntu (also Mint and Elementary)
$ sudo apt-get install lua5.1 liblua5.1-dev luarocks
# Arch/Manjaro
$ sudo apt-get install lua luarocks
```

#### macOS

On the Mac, I believe the following should work if you have
[brew](https://brew.sh/).

```bash
$ brew install lua5.1 luarocks5.1
```

#### Windows

Try [LuaDist](http://luadist.org/) or if you've installed chocolatey, you can
install it from there.

### Moonscript

Now that LuaRocks should be installed, you can install Moonscript.

```bash
# If the following generates permissions complaints, try sudo'ing it.
# or the windows alternative of running it in an Admin prompt.
$ luarocks install moonscript
```

### LÖVE

In order to run the project, you'll need to have LÖVE (a.k.a. love2d). You can
find out more on how to install it on [its website](https://love2d.org/).

Hints: it will help if you add `love.exe` to Windows' PATH; on linux, your
distro may already have love packages, but the version we're using here is
`0.11.1`.

### A Nice Editor

You may already like a specific text editor, and that's fine. This section's
here just to recommend some editors/IDEs.

[Visual Studio Code](https://code.visualstudio.com/) works reasonably well and
has extensions that support Lua, Moonscript and LÖVE.

[ZeroBrane Studio](https://studio.zerobrane.com/) is a Lua IDE which at the time
that I used it, worked best, but has no extension support/community.

[VIM](https://www.vim.org/) works really well in my opinion, supports Lua out of
the box in most cases and has Moonscript support. I believe there is a
LÖVE-oriented extension for it as well.

## Build Process

At the moment, there is actually a build step, but no build automation tools are
yet used in the project. I believe the entire "build process" can be easily and
cleanly managed by a build script which is in development (contributions always
welcome).

### Moonscript

There are a few modules of this project that use moonscript for some of its
features and cleaner syntax, like the UI module. Because of that, you'll need to
build all `.moon` files. At the moment, the building is happening in source, so
the source directories will get a little cluttered and that is a problem we
intend on addressing on the build script.

```bash
# to build everything in the root directory run
$ moonc .

# you can make moonc watch the current directory for file changes
$ moonc -w .
```

### Packaging

We have plans to have a packaging step in our build process to create packaged
executables for the available platforms. There is nothing like that actually
implemented at the moment.

## Running

Once everything is installed and built, you can run the game through some ways:
if love's in your PATH, you can `cd` to the project's root and run `love .`;
you can zip the root folder's contents (`main.lua` must be at the zip's root)
and drag and drop it into LÖVE's desktop icon; you can install extensions for
your IDE that will run the project for you.

## Contributing

If you already know what change you want to make to our code, that is cool, but
if you're looking for a place to start, you can check [ROADMAP.md](ROADMAP.md)
to see what we've already accomplished and what we plan to do next. You should
also check (the issues page)[https://github.com/leoagomes/noice/issues] of the
GitHub repository to check if any bugs need fixing.

Reporting bugs is also a great way to contribute, even though at the moment we
want to prioritize the development of core functionality over fixing every issue
(that doesn't seem to break everything).

### Getting Help

Currently, the best way to get in touch is by email, and you can find that in
the commit history or on the creators public profiles. We'll try to answer as
soon as possible.

### Coding Style

Try your best to keep the code readable while adhering to these simple rules:

* 1 indent = 4 spaces (not tabs)
* lf, not crlf
* use a nice color theme on your editor

We are not particularly fond of `camelCase`, because it is not much Lua-ish, but
since we are already obliged to use it because of some of the libraries we use,
we won't be picky about it, just try to be consistent.

In order to make life easier, try setting your editor to a configuration where
it renders whitespace. Doing that alone will help you make sure you already meet
2 out of the 3 code standards.

#### Current Project Structure

At the moment the project is planned to be structured as described below.

```
.
+-- assets
|   +-- # general game assets, such as layouts, textures, values, etc.
+-- docs
|   +-- # code and project documentation
+-- game
|   +-- # game logic files
+-- lib
|   +-- # third and some firts party libraries used by the game
+-- states
|   +-- # game state files for the main menu, the game state, etc.
+-- ui
|   +-- # the UI 'library'
+-- conf.lua # love2d configuration file
+-- main.lua # the game's main entry points and callbacks
```

### Making the PR

After you made the changes you wanted to and you feel you're ready to share
with us your progress, send us a Pull Request.

Try describing what feature you implemented, why and how in the PR's body.

Thank you for contributing to the project. It means a lot to us that you felt
this was a project worth contributing to and decided to help.