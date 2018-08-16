//Written in the D programming language

/++
    D header file for FreeBSD's extensions to POSIX's unistd.h.

    Copyright: Copyright 2018
    License:   $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
    Authors:   $(HTTP jmdavisprog.com, Jonathan M Davis)
 +/
module core.sys.freebsd.unistd;

public import core.sys.posix.unistd;

version (FreeBSD):
extern(C):
@nogc:
nothrow:

int getosreldate() pure @trusted;

// Corresponds to INO64_FIRST, indicating when the first inode64 changes were
// commited to FreeBSD. It's package rather than public (with the name being a
// D name rather than matching the C name), because the corresponding C symbol
// is local to the kernel and not part of the public API. Those using the C API
// don't usually need to know the version number, because they already have the
// correct bindings by simply using the C headers, whereas the D bindings have
// to be explicitly versioned to match.
// https://github.com/freebsd/freebsd/commit/6563dfe551747f8f748c876f4f4b6889f3ad03d9
package(core.sys) enum ino64First = 1200031;
