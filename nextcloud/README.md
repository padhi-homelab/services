# Nextcloud

<table>
  <thead>
    <tr>
      <th colspan='4' align='center'>╭── &nbsp; Composition &nbsp; &nbsp; \ &nbsp; &nbsp; Supported Archs &nbsp; ─── </th>
      <th align='center'><sub>amd64</sub></th>
      <th align='center'><sub>386</sub></th>
      <th align='center'><sub>arm/v6</sub></th>
      <th align='center'><sub>arm/v7</sub></th>
      <th align='center'><sub>arm64</sub></th>
      <th align='center'><sub>ppc64le</sub></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>
        <a href='https://nextcloud.com/'>Nextcloud</a>
        <br>
        <sub>:443/nextcloud</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Nextcloud%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(Nextcloud)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> B <br> B <br> B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/mariadb'>
          <sub>mariadb</sub>
        </a>
        <a href='https://hub.docker.com/_/redis'>
          <sub>redis</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/_/nextcloud'>
          <sub>nextcloud</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/_/nextcloud'>
          <sub>cron</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>10.9.3</sub></code>
        <br>
        <code><sub>7.0.5</sub></code>
        <br>
        <code><sub>25.0.1</sub></code>
        <br>
        <code><sub>25.0.1</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
    </tr>
  </tbody>
</table>


## Exposure

- Ports:
  - `80` ; NOT exposed to host

- Reverse Proxy
  - `traefik` ; dynamic routing via docker labels
    - Entrypoint: `SERVER_WAN_HTTPS_PORT` (see: [static.global.env](../static.global.env))
    - Subfolder: `/nextcloud`


## Bug Fixes

### 1. [(Issue)][redis issue] Redis session handler doesn't work on non-root Nextcloud container

Implemented solution proposed in [comment-1007447212](https://github.com/nextcloud/docker/issues/763#issuecomment-1007447212).

### 2. [(Issue)][apache issue] Setting `APACHE_DISABLE_REWRITE_IP` doesn't work on non-root Nextcloud container

Implemented solution proposed in [comment-1213540687](https://github.com/nextcloud/docker/issues/1494#issuecomment-1213540687).

### 3. [(Issue)][cron issue] Cron jobs do not run with non-root Nextcloud container

Implemented solution proposed in [comment-1308141561](https://github.com/nextcloud/docker/issues/1740#issuecomment-1308141561).

## Enhancements

### Security

1. Redis and MariaDB are isolated in a `default` network,
   and no ports are exposed to the host, nor to Traefik layer.

2. MariaDB uses a [random root password],
   which only appears in the docker logs (visible to host).

### Usability

1. Proper [carddav and caldav redirection](docker-compose.labels.yml#L8-L10)
   with subfolder in Traefik

2. Ability to edit crontab file (`data/nextcloud/crontabs/user`, generated after first run)
   directly to add or remove cron jobs on the fly without restarts.


## Known Issues

### 1. [(Issue)][cron uid issue] The `cron` container runs as root user

`crond` in Alpine Linux is available via [BusyBox].
Its implementation [calls `change_identity`](https://github.com/mirror/busybox/blob/master/miscutils/crond.c#L686),
which requires the `CAP_SETGID` [Linux capability](https://man7.org/linux/man-pages/man7/capabilities.7.html).
Since the `busybox` executable lacks this capability,
`busybox crond` must be invoked by root for `change_identity` to work correctly.

Since the `cron` container is supposed to only run `crond` as root,
and the cron jobs themselves are run as the appropriate non-root user (after `change_indentity`),
the attack surface seems small.
I use a custom entrypoint to run `busybox crond` as the _only_ process (via `exec`) in the container.

There are [sophisticated workarounds](https://medium.com/@geekidea_81313/running-cron-jobs-as-non-root-on-alpine-linux-e5fa94827c34)
to add `CAP_SETGID` to `crond` for it to be able to run correctly as a non-root user, 


[apache issue]:         https://github.com/nextcloud/docker/issues/1494
[BusyBox]:              https://en.wikipedia.org/wiki/BusyBox
[cron issue]:           https://github.com/nextcloud/docker/issues/1740
[cron uid issue]:       https://github.com/gliderlabs/docker-alpine/issues/381
[random root password]: https://mariadb.com/kb/en/mariadb-docker-environment-variables/#mariadb_random_root_password-mysql_random_root_password
[redis issue]:          https://github.com/nextcloud/docker/issues/763