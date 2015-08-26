function integration_spec

a.x.y = 1;
a.x.z = 2;
a.bar = 10;
b.x.foo = 'hi there!';
b.bar = 'lalal';
b.baz = 3;

c = catstruct(a, b);

expect(c.x.y == 1);
expect(c.x.z == 2);
expect(strcmp(c.x.foo, 'hi there!'));
expect(strcmp(c.bar, 'lalal'));
expect(c.baz == 3);
