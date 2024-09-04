# Services

<details>
<summary><h3>Why <code>compositions.sh</code>?</h3></summary>

The multi-staged nature and repetitive commands for setting up
compositions with non-standard configuration
(e.g., non-root containers, networking across compositions etc.)
is the raison d'être for `compositions.sh`.

For running non-root containers with the host users UID:GID,
so as to avoid permission issues with mounted volumes,
one must at least create a `.env` file
with variables pointing to their UID:GID,
for `docker compose` to pick them up and replace them in YAML files.
But, that's just the start!

One might want to attach some "hooks" when starting and/or stopping services.
For instance, since Traefik [can't simultaneously accept][traefik config]
a static configuration file _and_ some command-line configuration arguments,
I have a "start" hook to _generate_ a static configuration file with server-specific
details (server's FQDN, ACME email and server etc.).

One might also want to attach containers to [externally-created Docker networks],
for sharing data across multiple compositions without exposing anything to host.
In that case, a separate `docker network` command must be executed before starting services.
`compositions.sh` automatically detects external networks in YAML files,
and creates them if they do not already exist.

Finally, I also added several safeguards that `docker compose` doesn't provide.
For instance, missing host directories that are required to be mounted to containers
are automatically created by Docker (and are owned by `root`!),
but `compositions.sh` errors out in such cases requesting the user for explicit action.

#### Why not use Ansible?

Seemed like an overkill, when I initially wrote `compositions.sh`.
</details>

### Usage

Initial setup:

1. Override the global env generators as necessary, e.g.:
   ```
   echo "MY_GLOBAL_ENV_VAR=10" >> static.global.override.env
   ```
2. For each desired composition, override the:
    - static and/or dynamic env generators in a similar manner
    - docker service configuration: `docker-compose.override.yml`
    - docker service hooks: `docker-compose.up.pre_hook.override.01.sh` etc.

See [Structure & Conventions](#structure--conventions)
for more details on these overrides.

Typical workflows:

- (Re)start compositions:
  ```
  ./compositions.sh down,up tang pihole
  ```

- Update repo & restart a composition:
  ```
  git pull && ./compositions.sh pdu pihole
  ```
  Note how we specify verbs `pull,down,up` using just their first characters.

- Checking the status of compositions:
  ```
  ./compositions.sh status tang pihole
  ```

<details>
<summary><h4>Full List of Flags and Options</h4></summary>

```console
$ ./compositions.sh
Usage:
  ./compositions.sh <verb>[,<verb>,...] [flags] <comp_dir> [<comp_dir> ...]

Verbs: (short forms within [])
  [c]lean        Delete '<comp_dir>/data'
  [d]own         Stop a composition
  [o]verrides    List all override files in a composition
  [p]ull         Pull all images for a composition
  [s]tatus       Display health / status of a composition
  [u]p           Start a composition
  [v]alidate     Validate a composition

Flags:
  [-P | --skip-prereqs]      Ignore verifying/starting prerequisite compositions
  [-F | --fail-fast]         Fail on the first verb failures
  [-O | --skip-overrides]    Ignore overrides in scripts, environments, flags etc.
  [-R | --skip-regenerate]   Use existing '.env' and 'generated/'

Options:              { yes | no }
  [-d | --devices]    Attach devices listed in 'docker-compose.devices.yml'
  [-g | --logging]    Configure logging as specified in 'docker-compose.logging.yml'
  [-h | --hooks]      Run pre and post hook 'docker-compose.*.yml' scripts
  [-l | --labels]     Use labels specified in 'docker-compose.labels.yml'
  [-p | --ports]      Expose ports listed in 'docker-compose.ports.yml'

 <omitted> = Configure the option unless overridden in options.override.conf:
             use 'docker-compose.*.{sh,yml}' unless overriden in options.override.conf.
        no = Never configure the option (and use docker default instead):
             ignores 'docker-compose.*.{sh,yml}' files.
       yes = Always configure the option as specified:
             ignores options*.conf and uses all 'docker-compose.*.{sh,yml}' files.

Compositions Found (18):
  airdcpp      certbot  docker.sock  gitea      hass       indexarr
  influxdb     kodi.db  monitarr     navidrome  nextcloud  pihole
  qbittorrent  tang     telegraf     teslamate  traefik    unifi
```
</details>

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
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28AirDC%2B%2B%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_airdcpp.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
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
        <code><sub>2.6.11</sub></code>
        <br>
        <code><sub>2.12.2</sub></code>
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
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Certbot%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_certbot.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
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
        <code><sub>2.11.0</sub></code>
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
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28docker.sock%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_docker.sock.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
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
        <code><sub>2.8.10</sub></code>
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
        <a href='https://gitea.io/'>Gitea</a>
        <br>
        <sub>:443/gitea</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Gitea%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_gitea.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/gitea/gitea'>
          <sub>gitea</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>1.22.1-r...s</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
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
        <a href='https://www.home-assistant.io/hassio/'>HAss</a>
        <br>
        <sub>:443/</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28HAss%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_hass.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/hass'>
          <sub>hass</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2024.8.3_2.0.0</sub></code>
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
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Indexarr%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_indexarr.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A <br> B <br> B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/openvpn-client/'>
          <sub>openvpn&#8209;client</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/flaresolverr/flaresolverr/'>
          <sub>solvarr</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/jackett/'>
          <sub>jackett</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.6.11</sub></code>
        <br>
        <code><sub>v3.3.21</sub></code>
        <br>
        <code><sub>0.22.554</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
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
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://www.influxdata.com/'>InfluxDB</a>
        <br>
        <sub>:8086</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28InfluxDB%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_influxdb.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/influxdb'>
          <sub>influxdb</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.7.10-a...e</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
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
        <a href='https://kodi.wiki/view/MySQL/Setting_up_MySQL'>Kodi.DB</a>
        <br>
        <sub>:3306</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Kodi.DB%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_kodi.db.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/mariadb'>
          <sub>mariadb</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>11.5.2</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
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
        <a href='https://wiki.servarr.com/'>Monitarr</a>
        <br>
        <sub>:443/{lid,rad,son}arr</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Monitarr%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_monitarr.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> B <br> B
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
        <code><sub>2.5.3.4341</sub></code>
        <br>
        <code><sub>5.9.1.9070</sub></code>
        <br>
        <code><sub>4.0.9.2244</sub></code>
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
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Navidrome%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_navidrome.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
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
        <code><sub>0.52.5</sub></code>
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
        <a href='https://nextcloud.com/'>Nextcloud</a>
        <br>
        <sub>:443/nextcloud</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Nextcloud%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_nextcloud.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> B <br> B <br> C <br> B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/mariadb'>
          <sub>mariadb</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/_/redis'>
          <sub>redis</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/repository/docker/nextcloud/aio-imaginary'>
          <sub>imaginary</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/nextcloud/'>
          <sub>nextcloud</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/nextcloud/'>
          <sub>cron</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/nextcloud/'>
          <sub>push</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>10.11.6</sub></code>
        <br>
        <code><sub>7.4.0</sub></code>
        <br>
        <code><sub>20240808...48</sub></code>
        <br>
        <code><sub>29.0.6...core</sub></code>
        <br>
        <code><sub>29.0.6...core</sub></code>
        <br>
        <code><sub>29.0.6...core</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
        <br>
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
        <br>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://pi-hole.net'>Pi&#8209;hole</a>
        <br>
        <sub>:53, :9443/pihole</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28PiHole%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_pihole.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
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
        <code><sub>2.1.5</sub></code>
        <br>
        <code><sub>2024.07.0</sub></code>
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
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28qBittorrent%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_qbittorrent.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
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
        <code><sub>2.6.11</sub></code>
        <br>
        <code><sub>4.6.5</sub></code>
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
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Tang%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_tang.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
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
        <code><sub>git.02...c8</sub></code>
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
        <a href='https://www.influxdata.com/time-series-platform/telegraf/'>Telegraf</a>
        <br>
        <sub>-</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Telegraf%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_telegraf.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/telegraf'>
          <sub>telegraf</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>1.31.3</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
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
        <a href='https://github.com/teslamate-org/teslamate'>Teslamate</a>
        <br>
        <sub>:1883, :9443/teslamate</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Teslamate%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_teslamate.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> B <br> B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/postgres'>
          <sub>db</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/_/eclipse-mosquitto'>
          <sub>mqtt</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/teslamate/teslamate'>
          <sub>teslamate</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>16.3</sub></code>
        <br>
        <code><sub>2.0.18</sub></code>
        <br>
        <code><sub>1.30.0</sub></code>
        <br>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
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
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://traefik.io/'>Traefik</a>
        <br>
        <sub>:443, :8443, :9080, :9443</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Traefik%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_traefik.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
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
        <code><sub>2.11.8</sub></code>
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
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Unifi%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_unifi.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
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
        <code><sub>4.4.18</sub></code>
        <br>
        <code><sub>8.4.59</sub></code>
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

Below, we say that a container is a _non-root container_,
if it allows running the target service as a non-root user,
e.g. using `--user` with docker run.

Note that this is different from (less secure compared to)
running the container with a rootless docker daemon.

<table>
  <tbody>
    <tr>
      <th>A</th>
      <td><i>Trustworthy:</i> Non-root containers with binaries compiled during build, or from OS repos</td>
    </tr>
    <tr>
      <th>B</th>
      <td><i>Secure:</i> Non-root containers with open-source binaries only</td>
    </tr>
    <tr>
      <th>C</th>
      <td><i>Open:</i> Root-ed containers with open-source binaries only</td>
    </tr>
    <tr>
      <th>X</th>
      <td><i>Untrusted:</i> Containers with closed-source binaries</td>
    </tr>
  </tbody>
</table>

### Structure & Conventions

When deploying, all changes MUST appear in `.gitignore`d files:

- at the repo root:
  - `static.global.override.env` may store global constants
    - e.g. ACME configs, ports to be open etc.
    - these are exposed as-is to docker compose
    - see [`static.global.env`](static.global.env) for the default
  - `dynamic.global.override.env.sh` may generate additional dynamic variables
    - e.g. as public IP, UID of calling user etc.
    - these are (re)computed just before running each a composition
    - see [`dynamic.global.env.sh`](dynamic.global.env.sh) for the default

- within each composition:
  - `options.override.env` may contain overrides for default values of the `{devices|labels|logging|ports}`
    options
    - options provided on the command-line may still override `options.override.conf`
    - see [`.github/workflows/config/options.conf`](.github/workflows/config/options.conf) for an example
  - `static.override.env` may store additional service-specific constants
    - similar idea as its global counterpart `static.global.env`
    - see [`.archive/nocodb/static.env`](.archive/nocodb/static.env) for an example
  - `dynamic.override.env.sh` may generate additional service-specific evironment variables
    - similar idea as its global counterpart `dynamic.global.env.sh`
    - see [`pihole/dynamic.env.sh`](pihole/dynamic.env.sh) for an example
  - `docker-compose.override.{yml|yaml}` may contain overrides for docker compose
    - modular overrides may also be specified for individual YAML fragment files:  
      `docker-compose.{devices|labels|logging|ports}.override.{yml|yaml}`
  - `docker-compose.{up,down,clean}.{pre,post}_hook.override.*.sh`
    may define additional hooks to be run
    - see [`monitarr/docker-compose.up.pre_hook.sh`](monitarr/docker-compose.up.pre_hook.sh) for an example

#### Subdirectories

- immediate subdirectories under `config/`, `data/`, `extra/`, and `generated/`
  must match the service names within `docker-compose.yml`
- the directory structure at each of `config/X/Y...`, `data/X/Y...`, `extra/X/Y...`, and `generated/X/Y...`
  must match the root directory hierarchy `/Y/...` in the target container `X`

<table>
  <thead>
    <tr>
      <th></th>
      <th>Mount mode</th>
      <th>Git commit</th>
      <th>Comments</th>
    <tr>
  </thead>
  <tbody>
    <tr>
      <th>config/</th>
      <td><code>:ro</code> or -</td>
      <td>:heavy_check_mark:</td>
      <td></td>
    </tr>
    <tr>
      <th>data/</th>
      <td><code>:rw</code></td>
      <td>:heavy_multiplication_x:</td>
      <td></td>
    </tr>
    <tr>
      <th>env/</th>
      <td>-</td>
      <td>:heavy_check_mark:</td>
      <td>May contain <code>env_file</code>s</td>
    </tr>
    <tr>
      <th>extra/</th>
      <td>-</td>
      <td>:heavy_check_mark:</td>
      <td>Only indirect access, e.g. via <code>generated/</code></td>
    </tr>
    <tr>
      <th>generated/</th>
      <td><code>:ro</code></td>
      <td>:heavy_multiplication_x:</td>
      <td></td>
    </tr>
  </tbody>
</table>



[externally-created docker networks]: https://docs.docker.com/compose/networking/#use-a-pre-existing-network
[traefik config]:                     https://doc.traefik.io/traefik/getting-started/configuration-overview/#the-static-configuration
