# Dockerize Magento 1

A composer package for dockerizing your Magento 1.9.x

The composer package **wambo/dockerize-magento1** adds Docker and Docker Compose files to your Magento 1 project so you can run your Magento 1 shop without having to install Apache/Nginx, MySQL or PHP on your system.

## Installation

Make sure you have the right [deploy strategy](https://github.com/Cotya/magento-composer-installer/blob/master/doc/Deploy.md) for your project. Because docker will not work if your docker-compose.yml is just a symlink:

- If you use the "copy" strategy, you don't have to change anything.
- If you use the default "symlink" strategy you must create an exception for `wambo/dockerize-magento1` in your composer.json:

    ```json
    {
    	"extra":{
    		"magento-deploystrategy": "symlink",
            "magento-deploystrategy-overwrite": {
                "wambo/dockerize-magento1": "copy"
            }
    	}
    }
    ```

Add `wambo/dockerize-magento1` to your Magento 1 project:

```bash
composer require wambo/dockerize-magento1
```

Choose a database name and the passwords for the root user and shop user in the `.env` file:

```
DATABASE_ROOT_PASSWORD=rootUserPassword68J49AC2224U3n9
DATABASE_USER=magento
DATABASE_PASSWORD=magentoUserPassword7pJ344229w6V6d6
DATABASE_NAME=magento1dockerized
```

Build and start the docker containers:

```bash
docker-compose up -d
```

## Software Requirements

For Linux users you must have a recent version of [docker](https://github.com/docker/docker/releases) and [docker-compose](https://github.com/docker/compose/releases) installed.

If you are a Mac or Windows user, use Docker for Mac or Docker for Windows:

- [Docker for Mac](https://www.docker.com/docker-mac)
- [Docker for Windows](https://www.docker.com/docker-windows)

## Licensing

dockerize-magento1 is licensed under the Apache License, Version 2.0.
See [LICENSE](LICENSE) for the full license text.

## Related projects

- [github.com/andreaskoch/dockerized-magento](https://github.com/andreaskoch/dockerized-magento) is very similar to this package but its focus is more on being a self-contained Magento shop environment whereas **wambo/dockerize-magento1**'s emphasis is more on adding docker to an existing project
- [github.com/arvatoSCM/dockerize-magento2](https://github.com/arvatoSCM/dockerize-magento2) is the Magento 2 equivalent to **wambo/dockerize-magento1**
