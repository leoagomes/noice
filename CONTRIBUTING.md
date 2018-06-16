# Noice Contribution Guidelines

The intent of this document is to introduce possible contributors to the basic
workflow of contributing to Noice.

The first important part of developing Noice is having a proper development
environment.

## Environment Setup

In this game, we use the Godot Engine. Godot is a powerful and easy to use MIT
licensed 2D/3D game engine.

To contribute with our project, just download the last stable
[Godot Engine](https://godotengine.org)
and open the project. Also, you can install the
[Steam version](https://store.steampowered.com/app/404790/)
if you got a Steam account. Now you are good to go!

### Some useful links about Godot

- [Godot Documentation](docs.godotengine.org/)
- [Platform Game Tutorial by HeartBeast](https://www.youtube.com/watch?v=wETY5_9kFtA)
- [Godot 3 Tutorial by Gamefromscratch](https://www.youtube.com/watch?v=hG_MgGHAX-Q)

## Contributing

If you already know what change you want to make to our code, that is cool, but
if you're looking for a place to start, you can check [ROADMAP.md](ROADMAP.md)
to see what we've already accomplished and what we plan to do next. You should
also check [the issues page](https://github.com/leoagomes/noice/issues) of the
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

* We use Godot default style for programming, so it may not be a problem
* Naming:
  * Constants: DIS\_CONST
  * Classes: DaClass
  * Variables: imma\_var
  * Functions: foo\_bar\(\*\)

## Current Project Structure

At the moment the project is planned to be structured as described below.

```
.
+-- assets
|   +-- # general game assets, such as layouts, textures, values, scenes, tilesets, etc.
+-- docs
|   +-- # code and project documentation
+-- game
|   +-- # game logic files
```

### Making the PR

After you made the changes you wanted to and you feel you're ready to share
with us your progress, send us a Pull Request.

Try describing what feature you implemented, why and how in the PR's body.

Thank you for contributing to the project. It means a lot to us that you felt
this was a project worth contributing to and decided to help.
