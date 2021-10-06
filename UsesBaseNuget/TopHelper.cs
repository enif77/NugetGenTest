namespace UsesBaseNuget;

public class TopHelper
{
    public void HelpAll()
    {
        var baseHelper = new BaseNuget.BaseHelper();

        baseHelper.HelpMe();

        System.Console.WriteLine("I, the TopHelper, helped him too!");
    }
}
