static_version=1.1
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
tag=$(git describe --tags 2>/dev/null)
distro_release=bionic
version=""
echo $branch
echo $tag
if [ -n "$tag" ]; then
	 version=tag
elif [ $branch = "master" ] || [ -z "$branch" ]; then
	version=$static_version
else
	version=$branch
fi


echo "Building rpcs3-docker-$distro_release as version $version."
pushd $distro_release
docker build -t rpcs3/rpcs3-ci-$distro_release:$version .
popd
