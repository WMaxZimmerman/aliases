function createDotnetNtierProject {
    local projectName=$1

    # === Create the Solution ===
    dotnet new sln -n $projectName

    # === Create Projects ===
    createDotnetDataAccessLayer $projectName
    createDotnetApplicationCore $projectName
    createDotnetConsole $projectName
}

function createDotnetDataAccessLayer {
    local projectName=$1

    dotnet new classlib -n $projectName.DAL
    dotnet sln $projectName.sln add "$projectName.DAL/$projectName.DAL.csproj"

    pushd $projectName.DAL

    # === Clean up unwanted Files ===
    rm -f Class1.cs

    # === Structuring ===
    mkdir Repositories
    pushd Repositories # Entering Repositories

    # === Create Example Repository
    touch ExampleRepository.cs
    echo "namespace $projectName.DAL.Repositories" >> ExampleRepository.cs
    echo "{" >> ExampleRepository.cs
    echo "    public class ExampleRepository" >> ExampleRepository.cs
    echo "    {" >> ExampleRepository.cs
    echo "        public static string HelloWorld()" >> ExampleRepository.cs
    echo "        {" >> ExampleRepository.cs
    echo "            return \"Hello World\";" >> ExampleRepository.cs
    echo "        }" >> ExampleRepository.cs
    echo "    }" >> ExampleRepository.cs
    echo "}" >> ExampleRepository.cs

    popd # Leaving Repositories
    
    popd # Back to solution root
}

function createDotnetApplicationCore {
    local projectName=$1

    dotnet new classlib -n $projectName.ApplicationCore
    dotnet sln $projectName.sln add "$projectName.ApplicationCore/$projectName.ApplicationCore.csproj"
    dotnet add "$projectName.ApplicationCore/$projectName.ApplicationCore.csproj" reference "$projectName.DAL/$projectName.DAL.csproj"

    pushd $projectName.ApplicationCore

    # === Clean up unwanted Files ===
    rm -f Class1.cs

    mcd Services
    # === Create ExampleService.cs ===
    touch ExampleService.cs
    echo "using $projectName.DAL.Repositories;" >> ExampleService.cs
    echo "" >> ExampleService.cs
    echo "namespace $projectName.ApplicationCore.Services" >> ExampleService.cs
    echo "{" >> ExampleService.cs
    echo "    public class ExampleService" >> ExampleService.cs
    echo "    {" >> ExampleService.cs
    echo "        public static string HelloWorld()" >> ExampleService.cs
    echo "        {" >> ExampleService.cs
    echo "            return ExampleRepository.HelloWorld();" >> ExampleService.cs
    echo "        }" >> ExampleService.cs
    echo "    }" >> ExampleService.cs
    echo "}" >> ExampleService.cs
    
    popd
}

function createDotnetConsole {
    local projectName=$1

    # === Project Setup ===
    dotnet new console -n $projectName.Console
    dotnet sln $projectName.sln add "$projectName.Console/$projectName.Console.csproj"

    # === Add Project Dependencies ===
    dotnet add "$projectName.Console/$projectName.Console.csproj" reference "$projectName.ApplicationCore/$projectName.ApplicationCore.csproj"
    dotnet add "$projectName.Console/$projectName.Console.csproj" package System.Configuration.ConfigurationManager
    dotnet add "$projectName.Console/$projectName.Console.csproj" package WMZ.CommandAndConquer.CLI

    pushd $projectName.Console

    # === Create Program.cs ===
    rm -f Program.cs
    touch Program.cs
    echo "using CommandAndConquer.CLI.Core;" >> Program.cs
    echo "" >> Program.cs
    echo "namespace $projectName.Console" >> Program.cs
    echo "{" >> Program.cs
    echo "   class Program" >> Program.cs
    echo "   {" >> Program.cs
    echo "       static void Main(string[] args)" >> Program.cs
    echo "       {" >> Program.cs
    echo "           Processor.ProcessArguments(args);" >> Program.cs
    echo "       }" >> Program.cs
    echo "   }" >> Program.cs
    echo "}" >> Program.cs

    # === Create Application Config ===
    touch app.config
    echo "<?xml version=\"1.0\" encoding=\"utf-8\" ?>" >> app.config
    echo "<configuration>" >> app.config
    echo "  <appSettings>" >> app.config
    echo "    <add key=\"applicationLoopEnabled\" value=\"true\" />" >> app.config
    echo "  </appSettings>" >> app.config
    echo "</configuration>" >> app.config
    
    # === Project Structure ===
    mcd Controllers

    # === Create the Example Controller ===
    touch ExampleController.cs
    echo "using $projectName.ApplicationCore.Services;" >> ExampleController.cs
    echo "using CommandAndConquer.CLI.Attributes;" >> ExampleController.cs
    echo "" >> ExampleController.cs
    echo "namespace $projectName.Console.Controllers" >> ExampleController.cs
    echo "{" >> ExampleController.cs
    echo "    [CliController(\"example\", \"An example of a CLI Controller\")]" >> ExampleController.cs
    echo "    public class ExampleController" >> ExampleController.cs
    echo "    {" >> ExampleController.cs
    echo "        [CliCommand(\"hello\", \"A Hello World for a CLI Project\")]" >> ExampleController.cs
    echo "        public void HelloWorld()" >> ExampleController.cs
    echo "        {" >> ExampleController.cs
    echo "            System.Console.WriteLine(ExampleService.HelloWorld());" >> ExampleController.cs
    echo "        }" >> ExampleController.cs
    echo "    }" >> ExampleController.cs
    echo "}" >> ExampleController.cs
    
    popd
}
