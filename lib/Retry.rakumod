unit module Retry:ver<0.0.2>:auth<github:hythm7>;

multi sub retry ( &action, Int:D :$max is copy = 4, Real:D :$delay is copy = 0.2 ) is export {

  loop {

    my $result = try action();

    return $result unless $!;

    $!.rethrow if $max == 0;

    sleep $delay;

    $delay *= 2;
    $max   -= 1;

  }

}

multi sub retry ( &action, Int:D :$max is copy = 4, :&delay ) is export {

  loop {

    my $result = try action();

    return $result unless $!;

    $!.rethrow if $max == 0;

    sleep delay;

    $max   -= 1;

  }

}
