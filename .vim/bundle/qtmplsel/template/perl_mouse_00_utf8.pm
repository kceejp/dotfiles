package Sample;

use Any::Moose;
use Mouse::Util::TypeConstraints;

has '' => (
    is       => 'rw',
    isa      => 'Object',
    required => 1,
)

around BUILDARGS => sub {
    my ($next, $class, %init_args) = @_;
    return $class->$next(%init_args);
}
sub BUILD {
    my ($self, %init_args) = @_;
    $self->_initialize(%init_args);
}

__PACKAGE__->meta->make_immutable;

no Any::Moose;

1;

__END__
