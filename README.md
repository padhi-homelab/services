# Services <a href='https://github.com/padhi-homelab/services/actions/workflows/self_test.yml'><img align='right' src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/self_test.yml?branch=master&logo=github&logoWidth=24&style=for-the-badge&label=self test'></img></a>


<details>
<summary><h4>Why <code>comp</code>?</h4></summary>

The multi-staged nature and repetitive commands for setting up complex compositions
(e.g., containers with host user's UID:GID, shared networks across compositions, etc.)
is the raison d'être for `comp`. Some of the key features are highlighted below.

For running non-root containers with the host user's UID:GID
(e.g., to avoid permission issues with mounted volumes),
one must grab these from the host, and pass them as `env` variables,
for `docker compose` to pick them up.
The same applies to `TZ` and other host-side configs as well.
Not all of these configs are absolute constants
that maybe added to a `.env` and never be updated again.
In such cases, we ideally want a "hook" that runs before `docker compose` is run,
and updates / generates the `.env` as necessary.

Similar hooks are also desirable to set up [external networks]
that are shared across multiple compositions.
In such cases, the hook would execute a `docker network` command
before running `docker compose`.
`comp` automatically grabs all external networks in YAML files,
and has a hook to create them if they do not already exist.

`comp` also has several safeguards that `docker compose` doesn't provide.
For instance, any non-existent host directories that are mounted to containers
are automatically created by Docker and are owned by `root`,
even when the `--user` flag is set!
`comp` errors out in such cases, requesting the user for explicit action.

#### Why not use Ansible / Kubernetes / XYZ?

Seemed like overkill, when I initially wrote `comp`.

#### Why `bash`?

Why not?
</details>

### Usage

Typical workflows:

- (Re)start compositions:
  ```
  ./comp down,up tang pihole
  ```

- Update repo & restart a composition:
  ```
  git pull && ./comp pdu pihole
  ```
  Note how we specify verbs `pull,down,up` using just their first characters.

- Checking the status of compositions:
  ```
  ./comp status tang pihole
  ```

See [comp#L372](comp#L372) for all supported supported flags and options.

Also see [Structure & Conventions](#structure--conventions)
for optionally customizing compositions via _overrides_.

### Arch. Support

<table>
  <thead>
    <tr>
      <th colspan='4' align='center'>╭── &nbsp; Compositions &nbsp; &nbsp; \ &nbsp; &nbsp; Supported Archs &nbsp; ─── </th>
      <th align='center'><sub>amd 64</sub></th>
      <th align='center'><sub>arm v7</sub></th>
      <th align='center'><sub>arm 64</sub></th>
      <th align='center'><sub>risc v64</sub></th>
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
        <code><sub>2.6.12</sub></code>
        <br>
        <code><sub>2.13.2</sub></code>
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
        <a href='https://certbot.eff.org/'>Certbot</a>
        <br>
        <sub>:80</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Certbot%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_certbot.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/certbot/certbot/'>
          <sub>certbot</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>v3.1.0</sub></code>
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
        <a href='https://docs.docker.com/engine/security/protect-access/'>docker_sock</a>
        <br>
        <sub>-</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28docker_sock%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_docker_sock.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
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
        :heavy_multiplication_x:
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
        <code><sub>1.23.1-r...s</sub></code>
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
        <code><sub>2025.1.2_2.0.3</sub></code>
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
        <code><sub>2.6.12</sub></code>
        <br>
        <code><sub>v3.3.21</sub></code>
        <br>
        <code><sub>0.22.1261</sub></code>
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
        <code><sub>2.7.11-a...e</sub></code>
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
        <a href='https://kodi.wiki/view/MySQL/Setting_up_MySQL'>Kodi.DB</a>
        <br>
        <sub>:3306</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Kodi.DB%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_kodi_db.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
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
        <code><sub>11.6.2</sub></code>
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
        <code><sub>2.8.2.4493</sub></code>
        <br>
        <code><sub>5.17.2.9580</sub></code>
        <br>
        <code><sub>4.0.12.2823</sub></code>
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
        <code><sub>0.54.4</sub></code>
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
        <a href='https://github.com/netbox-community/netbox'>Netbox</a>
        <br>
        <sub>:9443/netbox</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Netbox%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_netbox.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> B <br> A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/postgres'>
          <sub>postgres</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/valkey/valkey'>
          <sub>redis</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/netbox/'>
          <sub>netbox</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>17.2...ne</sub></code>
        <br>
        <code><sub>8.0.2...ne</sub></code>
        <br>
        <code><sub>4.2.2</sub></code>
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
        <a href='https://hub.docker.com/repository/docker/nextcloud/aio-fulltextsearch'>
          <sub>fulltextsearch</sub>
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
      </th>
      <td align='center'>
        <code><sub>11.6.2</sub></code>
        <br>
        <code><sub>7.4.2</sub></code>
        <br>
        <code><sub>20250116...30</sub></code>
        <br>
        <code><sub>20250114...11</sub></code>
        <br>
        <code><sub>30.0.5-core</sub></code>
        <br>
        <code><sub>30.0.5-core</sub></code>
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
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
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
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://ntfy.sh/'>ntfy</a>
        <br>
        <sub>:443, :4443</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Ntfy%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_ntfy.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/binwiederhier/ntfy'>
          <sub>ntfy</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>v2.11.0</sub></code>
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
        <code><sub>2.1.7</sub></code>
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
        :heavy_multiplication_x:
        <br>
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
        <code><sub>2.6.12</sub></code>
        <br>
        <code><sub>5.0.1</sub></code>
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
        :heavy_multiplication_x:
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
        <code><sub>1.33.1</sub></code>
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
        <code><sub>17.2...ne</sub></code>
        <br>
        <code><sub>2.0.20</sub></code>
        <br>
        <code><sub>1.31.1</sub></code>
        <br>
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
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://github.com/padhi-homelab/docker_tiny-httpd/'>Tiny HTTPD</a>
        <br>
        <sub>:443</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Tiny_HTTPD%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_tiny_httpd.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/tiny-httpd'>
          <sub>tiny-httpd</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.29</sub></code>
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
        <code><sub>3.3.2</sub></code>
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
        :heavy_check_mark:
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
        <a href='https://hub.docker.com/r/goofball222/unifi'>
          <sub>unifi</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>4.4.18</sub></code>
        <br>
        <code><sub>9.0.108</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
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

All specializations should be added to `*.override.*` files.

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
  - `meta.override.yml` may:
    - specify other compositions as prerequisites
      - see [`tang/meta.yml`](tang/meta.yml) for an example
    - contain overrides for the `{devices|labels|logging|ports}` fragments  
      (flags used on the command-line will further override this)
      - see [`.github/workflows/config/meta.override.yml`](.github/workflows/config/meta.override.yml) for an example
    - specify messages to be displayed after verb executions
      - see [`traefik/meta.yml`](traefik/meta.yml) for an example
  - `static.override.env` may store additional service-specific constants
    - similar idea as its global counterpart `static.global.env`
    - see [`gitea/static.env`](gitea/static.env) for an example
  - `dynamic.override.env.sh` may generate additional service-specific evironment variables
    - similar idea as its global counterpart `dynamic.global.env.sh`
    - see [`pihole/dynamic.env.sh`](pihole/dynamic.env.sh) for an example
  - `docker-compose.override.{yml|yaml}` may contain overrides for docker compose
    - modular overrides may also be specified for individual YAML fragment files:  
      `docker-compose.{devices|labels|logging|ports}.override.{yml|yaml}`
  - `docker-compose.{pre,post}_hook.override.*.sh`
    may define additional hooks to be run before `docker compose`
    - see [`nextcloud/docker-compose.pre_hook.sh`](nextcloud/docker-compose.pre_hook.sh) for an example
  - `docker-compose.{up,down,clean}.{pre,post}_hook.override.*.sh`
    may define additional verb-specific hooks to be run
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



[external networks]: https://docs.docker.com/compose/networking/#use-a-pre-existing-network
