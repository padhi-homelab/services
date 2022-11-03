# Services

### Usage

```console
$ ./composition.sh
Usage:
  ./composition.sh <verb>[,<verb>,...] [flags] <comp_dir> [<comp_dir> ...]

Verbs:
  check                      Check health of a composition
  clean                      Delete '<comp_dir>/data'
  down                       Stop a composition
  up                         Start a composition

Flags:
  [-I | --ignore-failures]   Ignore verb failures and continue
  [-D | --attach-devices]    Attach devices listed in 'docker-compose.devices.yml'
  [-s | --no-hook-scripts]   Ignore all pre and post hook scripts
  [-l | --no-labels]         Ignore 'docker-compose.labels.yml' file
  [-o | --no-override]       Ignore 'docker-compose.override.yml' file
  [-P | --expose-ports]      Expose ports listed in 'docker-compose.ports.yml'
  [-R | --regenerate]        Force generate '.env' and 'generated/'

Compositions:
  airdcpp      certbot    docker.sock  hass       indexarr
  monitarr     navidrome  netdata      nextcloud  pihole
  qbittorrent  tang       traefik      unifi
```

### Arch. Support

<table>
  <thead>
    <tr>
      <th colspan='4' align='center'>╭── &nbsp; Compositions &nbsp; &nbsp; \ &nbsp; &nbsp; Supported Archs &nbsp; ─── </th>
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
        <a href='https://airdcpp.net/'>AirDC++</a>
        <br>
        <sub>:443/airdcpp</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28AirDC%2B%2B%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(AirDC%2B%2B)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A <br> B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/openvpn-client/'>
          <sub>openvpn&#8209;client</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/airdcpp/'>
          <sub>airdcpp</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.5.6</sub></code>
        <br>
        <code><sub>2.11.2</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://certbot.eff.org/'>Certbot</a>
        <br>
        <sub>:80</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Certbot%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(Certbot)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/certbot/'>
          <sub>certbot</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>1.31.0</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://docs.docker.com/engine/security/protect-access/'>docker.sock</a>
        <br>
        <sub>-</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28docker.sock%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(docker.sock)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/docker.sock-proxy'>
          <sub>docker.sock&#8209;proxy</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.6.6</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://www.home-assistant.io/hassio/'>HAss</a>
        <br>
        <sub>:8123</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28HAss%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(HAss)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/hass'>
          <sub>hass</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2022.11.0_1.28.3</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        Indexarr
        <br>
        <sub>:443/jackett</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Indexarr%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(Indexarr)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A <br> C
      </th>
      <th align='right'>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/openvpn-client/'>
          <sub>openvpn&#8209;client</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/jackett/'>
          <sub>jackett</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.5.6</sub></code>
        <br>
        <code><sub>0.20.2163</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://wiki.servarr.com/'>Monitarr</a>
        <br>
        <sub>:443/{lid,rad,son}arr</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Monitarr%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(Monitarr)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        C <br> C <br> C
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/lidarr/'>
          <sub>lidarr</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/radarr/'>
          <sub>radarr</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/sonarr/'>
          <sub>sonarr</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>1.1.0.2649</sub></code>
        <br>
        <code><sub>4.3.0.6671</sub></code>
        <br>
        <code><sub>3.0.9.1549</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://www.navidrome.org/'>Navidrome</a>
        <br>
        <sub>:443/navidrome</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Navidrome%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(Navidrome)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/deluan/navidrome'>
          <sub>navidrome</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>sha-af5c2b5</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://www.netdata.cloud'>netdata</a>
        <br>
        <sub>:9443/netdata</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28netdata%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(netdata)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/netdata'>
          <sub>netdata</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>1.36.0</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
    </tr>
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
        <code><sub>25.0.0</sub></code>
        <br>
        <code><sub>25.0.0</sub></code>
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
    <tr>
      <th>
        <a href='https://pi-hole.net'>Pi&#8209;hole</a>
        <br>
        <sub>:53, :9443/pihole</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28PiHole%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(PiHole)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A <br> B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/repository/docker/padhihomelab/dnscrypt-proxy'>
          <sub>dnscrypt&#8209;proxy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/pihole/pihole'>
          <sub>pihole</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.1.2</sub></code>
        <br>
        <code><sub>2022.10</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://www.qbittorrent.org/'>qBittorrent</a>
        <br>
        <sub>:5432, :443/qbittorrent</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28qBittorrent%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(qBittorrent)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A <br> A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/openvpn-client/'>
          <sub>openvpn&#8209;client</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/qbittorrent-nox/'>
          <sub>qbittorrent&#8209;nox</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.5.6</sub></code>
        <br>
        <code><sub>4.4.5</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://github.com/latchset/tang'>Tang</a>
        <br>
        <sub>:9080/tang</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Tang%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(Tang)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/tang/'>
          <sub>tang</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>git.e2...p3</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://traefik.io/'>Traefik</a>
        <br>
        <sub>:443, :9080, :9443</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Traefik%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(Traefik)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/traefik'>
          <sub>traefik</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.9.1</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://unifi-network.ui.com'>Unifi</a>
        <br>
        <sub>:3478, :8080, :8843, :10001</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Unifi%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(Unifi)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> X
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/mongo'>
          <sub>mongodb</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/unifi'>
          <sub>unifi</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>4.4.17</sub></code>
        <br>
        <code><sub>7.2.94</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
  </tbody>
</table>

#### Legend

<table>
  <tbody>
    <tr>
      <td>A</td>
      <td>Dockerfiles with application binaries from OS repo / compiled from sources</td>
    </tr>
    <tr>
      <td>B</td>
      <td>Official open-source Dockerfiles / binaries from authors</td>
    </tr>
    <tr>
      <td>C</td>
      <td>Dockerfiles / binaries from third parties who publish full source code</td>
    </tr>
    <tr>
      <td>X</td>
      <td>Dockerfiles containing closed-source binaries (blobs)</td>
    </tr>
  </tbody>
</table>

### Structure & Conventions

When deploying, all changes MUST appear in `.gitignore`d files:

- at the repo root:
  - a `static.global.override.env` file may store fixed global environment variables,
    such as WAN FQDN, ACME configs etc.
  - a `dynamic.global.override.env.sh` script may generate additional server-specific
    dynamic global evironment variables such as public IP, UID of calling user etc.

- within each composition:
  - a `dynamic.override.env.sh` script may generate additional service-specific evironment variables
  - `docker-compose.override.{yml|yaml}` file may contain the usual override stuff for docker compose
  - `docker-compose.{up,down,clean}.{pre,post}_hook.override*.sh` scripts
    may contain additional hooks to be run

#### Subdirectories

- subdirectories under `config/`, `data/`, `extra/`, and `generated/`
  must match the service names within `docker-compose.yml`
- the directory structure under each of `config/`, `data/`, `extra/`, and `generated/`
  must match the root directory hierarchy in the target container
- `config/` contents:
  - _may_ be mounted in read-only mode (`:ro`)
  - _must_ be checked in
- `data/` contents:
  - _should_ be mounted in read+write mode (`:rw`)
  - _must not_ be checked in; excluded using `.gitignore`
- `env/` contents:
  - _must not_ be mounted within containers!
    - _may_ be used as `env_file` for containers
  - _should_ be checked in
- `extra/` contents:
  - _must not_ be mounted within containers!
    - containers may fetch these by other means,
      e.g. over the network, or from `generated/`
  - _should_ be checked in
- `generated/` contents:
  - _must_ be mounted in read-only mode (`:ro`)
  - _must not_ be checked in; excluded using `.gitignore`
