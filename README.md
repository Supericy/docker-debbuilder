# packagebuilder-docker

Easily build Ubuntu 16.04 debian packages in any environment that is supported by Docker.

### Build Docker Image:

    docker build -t packagebuilder .
    
    
### Create Deb:

    docker run -v /path/to/export/deb/:/output -v /path/to/package/source:/source packagebuilder
    
    
### Example:

    > ls
    media-bundle
      
    > ls media-bundle
    debian
    files
      
    > docker run -v $(pwd):/output $(pwd)/media-bundle:/source packagebuilder
      
    > ls
    media-bundle
    media-bundle_1.0.0_all.deb
    
    