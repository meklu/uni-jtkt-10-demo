# What is this thing?

This is a nice little demo on fault tolerance made as a part of a presentation.

# How do you use this?

Run `./run.sh` to start the demo.

The program goes through a list of provided "modules" or sample cases and
terminates once it reaches the end of the list.

It is recommended to run `./comp.sh` before running the actual program script,
as some of the samples require compiling. This can also be done with the `c`
command in the main program.

# What do I need?

For displaying the source code this program uses `pygmentize`. You should have
the package that provides it installed. It's some python thing.

The samples are written in Java, C, and PHP. You'll need a `javac`, `cc`, and a
`php` binary installed and in your `$PATH`.
