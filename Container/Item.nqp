class ParrotContainer::Container::Item
{
    has @!method_initializers;

    method method_initializers(@meth_inits) {
        if pir::defined(@meth_inits) {
            @!method_initializers := @meth_inits;
        } else {
            @!method_initializers := [];
        }
    }

    method resolve(*%options) {
        my $item := self.resolve_instance();
        for @!method_initializers {
            $_.execute($item);
        }
        return $item;
    }

    method resolve_instance() {
        pir::die("Must use a subclass");
    }
}

class ParrotContainer::Container::Item::Instance
    is ParrotContainer::Container::Item
{
    has $!instance;

    method BUILD($obj, @meth_inits) {
        $!instance := $obj;
        self.method_initializers(@meth_inits);
    }

    method resolve_instance() {
        return $!instance;
    }
}

# Instantiate an object from a P6protoobject
class ParrotContainer::Container::Item::P6protoobject
    is ParrotContainer::Container::Item
{
    has $!proto;

    method BUILD($proto, @meth_inits) {
        $!proto := $proto;
        self.method_initializers(@meth_inits);
    }

    method resolve_instance() {
        return $!proto.new();
    }
}

# Instantiate an object from a ParrotClass
class ParrotContainer::Container::Item::ParrotClass
    is ParrotContainer::Container::Item
{
    has $!class;
    has $!init_pmc;

    method BUILD($class, $init_pmc, @meth_inits) {
        $!class := $class;
        $!init_pmc := $init_pmc;
        self.method_initializers(@meth_inits);
    }

    method resolve_instance() {
        if pir::defined($!init_pmc) {
            return pir::new__PPP($!class, $!init_pmc);
        }
        return pir::new__PP($!class);
    }
}

# Instantiate an object from an object prototype
class ParrotContainer::Container::Item::Prototype
    is ParrotContainer::Container::Item
{
    has $!prototype;

    method BUILD($proto, @meth_inits) {
        $!prototype := $proto;
        self.method_initializers(@meth_inits);
    }

    method resolve_instance() {
        return pir::clone($!prototype);
    }
}
