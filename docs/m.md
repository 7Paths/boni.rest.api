# Manager for MongoDB versions

```console
    mkdir -p servers/mongodb/bin
    mkdir -p data/mongodb/MONGO_V

    echo "export M_PREFIX=~/servers/mongodb" >> ~/.zshrc

    m

    m list

    m MONGO_VERSION

    m use MONGO_VERSION --dbpath ~/data/mongodb/MONGO_VERSION_FOLDER_CREATED

    m shell MONGO_VERSION

```

```console
    m use 5.3.2 --dbpath ~/data/mongodb/5.3.2
```