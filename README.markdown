# Matlab structures merge

`mergestruct` is utility function to merge two structures in Matlab. It is
opinionated as to what the resulting structure should be in variouse cases.

## Installation

Simply copy the `mergestruct.m` under `./lib` to somewhere in your `path`.

## Usage

The resulting merged stucture depends on whether one of the inputs is a struct
array or not. If one of the inputs is a struct array, the two input stucts are
simply concatenated together:

    >> s1(1).x = 1;
    >> s1(2).x = 'foo';
    >> s2(1).y = 8;
    >> s3 = mergestruct(s1, s2);
    >> { s3.x }

    ans =

        [1]    'foo'    []

    >> { s3.y }

    ans =

        []    []    [8]

If neither of the two structs is a struct array, the two are merged recursively,
with `s2` being dominant if the same key exists in both structures without being
a subkey:

    >> a.x.y = 1;
    >> a.x.z = 3;
    >> a.foo = 'bar';
    >> a.baz = [5 6];
    >> b.foo = 'nope';
    >> b.x.z = 10;
    >> b.x.s = {'la' 'li' 'lu'};
    >> c = mergestruct(a, b);
    >> c

    c =

          x: [1x1 struct]
        foo: 'nope'
        baz: [5 6]

    >> c.x

    ans =

        y: 1
        z: 10
        s: {'la'  'li'  'lu'}

## Contributing

1. Fork it ( https://github.com/muellerj/mergestruct/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
