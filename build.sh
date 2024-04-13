#!/usr/bin/env sh

dotnet clean
echo "attempting to upgrade dependencies"
pushd GrokAssembly
dotnet add package System.Reflection.Metadata
popd
echo "build started"
dotnet build
dotnet publish
echo "build complete"

dotnet ./GrokAssembly/bin/Debug/net8.0/GrokAssembly.dll ./GrokAssembly/bin/Debug/net8.0/GrokAssembly.dll

if [[ "$?" -eq 0 ]] ; then
  echo 
  echo 
  echo "SUCCESS - GrokAssembly test passed"
else
  echo 
  echo 
  echo "FAILED - dependency-check GrokAssembly test failed"
  exit 1
fi
