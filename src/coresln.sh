alias coresln="'createDotnetNtierProject'"
function coresln? {
    echo "Creates a new dotnet core solution and project structure with the given name."
    echo "Parameters (solutionName)"
    echo "$indentString solutionName: The name of the application that you are making."
}

function createDotnetNtierProject {
    local projectName=$1

    # === Create the Solution ===
    dotnet new sln -n $projectName

    # === Create Projects ===
    createDotnetSharedLayer $projectName
    createDotnetDataAccessLayer $projectName
    createDotnetApplicationCore $projectName
    createDotnetConsole $projectName
    createDotnetTestProject $projectName
}

function createDotnetSharedLayer {
    local projectName=$1

    dotnet new classlib -n $projectName.Shared
    dotnet sln $projectName.sln add "$projectName.Shared/$projectName.Shared.csproj"

    pushd $projectName.Shared

    # === Clean up unwanted Files ===
    rm -f Class1.cs

    # === Structuring ===
    mkdir Models
    pushd Models # Entering Repositories

    # === Create Example Repository
    touch ExampleModel.cs
    echo "namespace $projectName.Shared.Models" >> ExampleModel.cs
    echo "{" >> ExampleModel.cs
    echo "    public class ExampleModel" >> ExampleModel.cs
    echo "    {" >> ExampleModel.cs
    echo "    }" >> ExampleModel.cs
    echo "}" >> ExampleModel.cs

    popd # Leaving Models
    
    popd # Back to solution root
}

function createDotnetDataAccessLayer {
    local projectName=$1

    dotnet new classlib -n $projectName.DAL
    dotnet sln $projectName.sln add "$projectName.DAL/$projectName.DAL.csproj"
    dotnet add "$projectName.DAL/$projectName.DAL.csproj" reference "$projectName.Shared/$projectName.Shared.csproj"

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
    dotnet add "$projectName.ApplicationCore/$projectName.ApplicationCore.csproj" reference "$projectName.Shared/$projectName.Shared.csproj"
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
    dotnet add "$projectName.Console/$projectName.Console.csproj" reference "$projectName.Shared/$projectName.Shared.csproj"
    dotnet add "$projectName.Console/$projectName.Console.csproj" reference "$projectName.ApplicationCore/$projectName.ApplicationCore.csproj"
    dotnet add "$projectName.Console/$projectName.Console.csproj" package System.Configuration.ConfigurationManager
    dotnet add "$projectName.Console/$projectName.Console.csproj" package NTrospection.CLI

    pushd $projectName.Console

    # === Create Program.cs ===
    rm -f Program.cs
    touch Program.cs
    echo "using NTrospection.CLI.Core;" >> Program.cs
    echo "" >> Program.cs
    echo "namespace $projectName.Console" >> Program.cs
    echo "{" >> Program.cs
    echo "   class Program" >> Program.cs
    echo "   {" >> Program.cs
    echo "       static void Main(string[] args)" >> Program.cs
    echo "       {" >> Program.cs
    echo "           new Processor().ProcessArguments(args);" >> Program.cs
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
    echo "using NTrospection.CLI.Attributes;" >> ExampleController.cs
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


function createDotnetTestProject {
    local projectName=$1

    # === Project Setup ===
    dotnet new mstest -n $projectName.Tests
    dotnet sln $projectName.sln add "$projectName.Tests/$projectName.Tests.csproj"

    # === Add Project Dependencies ===
    dotnet add "$projectName.Tests/$projectName.Tests.csproj" reference "$projectName.Shared/$projectName.Shared.csproj"
    dotnet add "$projectName.Tests/$projectName.Tests.csproj" reference "$projectName.DAL/$projectName.DAL.csproj"
    dotnet add "$projectName.Tests/$projectName.Tests.csproj" reference "$projectName.ApplicationCore/$projectName.ApplicationCore.csproj"
    dotnet add "$projectName.Tests/$projectName.Tests.csproj" reference "$projectName.Console/$projectName.Console.csproj"
    dotnet add "$projectName.Tests/$projectName.Tests.csproj" package System.Configuration.ConfigurationManager
    dotnet add "$projectName.Tests/$projectName.Tests.csproj" package NTrospection.CLI

    pushd $projectName.Tests

    # === Create Application Config ===
    touch app.config
    echo "<?xml version=\"1.0\" encoding=\"utf-8\" ?>" >> app.config
    echo "<configuration>" >> app.config
    echo "  <appSettings>" >> app.config
    echo "    <add key=\"applicationLoopEnabled\" value=\"true\" />" >> app.config
    echo "  </appSettings>" >> app.config
    echo "</configuration>" >> app.config
    
    popd
}

function createDotnetBlazor {
    local projectName=$1

    # === Project Setup ===
    dotnet new blazorwasm -n $projectName.UI
    dotnet sln $projectName.sln add "$projectName.UI/$projectName.UI.csproj"

    # === Add Project Dependencies ===
    dotnet add "$projectName.UI/$projectName.UI.csproj" reference "$projectName.Shared/$projectName.Shared.csproj"
    dotnet add "$projectName.UI/$projectName.UI.csproj" reference "$projectName.ApplicationCore/$projectName.ApplicationCore.csproj"
}
