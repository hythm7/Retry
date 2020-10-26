unit module Retry:ver<0.0.1>:auth<github:hythm7>;

sub retry ( &action, :$max is copy = 4, :$delay is copy = 0.2 ) is export {

  loop {

    my $result = try action();

    return $result unless $!;

    $!.rethrow unless $max;

    sleep $delay;

    $delay *= 2;
    $max   -= 1;

  }

}
