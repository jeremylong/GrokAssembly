#!/usr/bin/env sh

PUBLISH=./GrokAssembly/bin/Release/net7.0/publish
TEMP=./GrokAssembly/bin/Release/net7.0/temp

echo "clean"
dotnet clean --configuration Release
echo "build"
dotnet build --configuration Release
echo "publish"
dotnet publish --configuration Release
echo "package"

dotnet ./GrokAssembly/bin/Release/net7.0/publish/GrokAssembly.dll ./GrokAssembly/bin/Release/net7.0/publish/GrokAssembly.dll

if [[ "$?" -eq 0 ]] ; then
  echo "SUCCESS - GrokAssembly test passed"
else
  echo "FAILED - GrokAssembly test failed"
  exit 1
fi



##[[ -d "$TEMP" ]] || mkdir "$TEMP"
##rm -rfv "$TEMP/*"
##cp -R "$PUBLISH" "$TEMP"/GrokAssembly
##pushd "$TEMP"
pushd "$PUBLISH"
zip -r GrokAssembly.zip ./ -x "*.DS_Store"
popd
##cp "$PUBLISH"/GrokAssembly.zip "$PUBLISH"
##rm -rfv "$TEMP"

echo "Packaging complete: "$PUBLISH"/GrokAssembly.zip"