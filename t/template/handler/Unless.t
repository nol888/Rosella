// Automatically generated test for Class Rosella.Template.Handler.Unless
class Test_Rosella_Template_Handler_Unless
{
    function test_sanity()
    {
        self.assert.is_true(1);
    }

    function test_new() {
        var obj = new Rosella.Template.Handler.Unless();
        self.assert.not_null(obj);
        self.assert.instance_of(obj, class Rosella.Template.Handler.Unless);
    }


    function Unless() {
        self.status.verify("Test Rosella.Template.Handler.Unless.Unless()");
        var obj = new Rosella.Template.Handler.Unless();

        var arg_0 = null;
        var result = obj.Unless(arg_0);
    }

    function render() {
        self.status.verify("Test Rosella.Template.Handler.Unless.render()");
        var obj = new Rosella.Template.Handler.Unless();

        var arg_0 = null;
        var arg_1 = null;
        var arg_2 = null;
        var result = obj.render(arg_0, arg_1, arg_2);
    }
}

function main[main]()
{
    load_bytecode("rosella/test.pbc");
    load_bytecode("rosella/template.pbc");
    using Rosella.Test.test;
    test(class Test_Rosella_Template_Handler_Unless);
}
