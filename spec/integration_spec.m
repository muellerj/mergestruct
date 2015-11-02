function integration_spec

a.x.y = 1;
a.x.z = 2;
a.bar = 10;
b.x.foo = 'hi there!';
b.bar = 'lalal';
b.baz = 3;

c = mergestruct(a, b);

expect(c.x.y == 1);
expect(c.x.z == 2);
expect(strcmp(c.x.foo, 'hi there!'));
expect(strcmp(c.bar, 'lalal'));
expect(c.baz == 3);

clear a b

a(1).x = 1;
a(2).x = 1;
b(1).y = 2;
b(2).y = 6;

c = mergestruct(a, b);

expect(length(c) == 4);
expect(c(1).x == 1);
expect(c(2).x == 1);
expect(isempty(c(3).x));
expect(c(3).y == 2);
