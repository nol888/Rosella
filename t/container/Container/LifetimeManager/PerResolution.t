class Test_Rosella_Container_LifetimeManager_PerResolution
{
    function has_instance()
    {
        self.status.verify("Test Rosella.Container.LifetimeManager.PerResolution.has_instance()");
        var obj = create_new();

        var result = obj.has_instance();
        self.assert.is_false(result);
    }

    function set_instance()
    {
        self.status.verify("Test Rosella.Container.LifetimeManager.PerResolution.set_instance()");
        var obj = create_new();

        var arg_0 = null;
        var result = obj.set_instance(arg_0);
    }

    function get_instance()
    {
        self.status.verify("Test Rosella.Container.LifetimeManager.PerResolution.get_instance()");
        var obj = create_new();

        var result = obj.get_instance();
        self.assert.is_null(result);
    }
}

function main[main]()
{
    var core = load_packfile("rosella/core.pbc");
    var(Rosella.initialize_rosella)("test");
    var(Rosella.load_bytecode_file)("rosella/container.pbc", "load");
    var(Rosella.Test.test)(class Test_Rosella_Container_LifetimeManager_PerResolution);
}
