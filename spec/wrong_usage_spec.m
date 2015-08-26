function wrong_usage_spec

a.x = 1;
b = {1};

found_error = false;
try
  c = catstruct(a, b);
catch exception
  if strcmp(exception.message, 'Both arguments must be structs')
    found_error = true;
  end
end
expect(found_error);
