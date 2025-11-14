# Services <a href='https://github.com/padhi-homelab/services/actions/workflows/self_test.yml'><img align='right' src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/self_test.yml?branch=master&logo=github&logoWidth=24&style=for-the-badge&label=self test'></img></a>


<details>
<summary><h4>Why <code>comp</code>?</h4></summary>

The multi-staged nature and repetitive commands for setting up complex compositions
(e.g., containers with files owned by host user's UID:GID,
shared external networks across compositions, etc.)
is the raison d'être for `comp`.
Some of the key considerations are highlighted below.

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

See [comp#L373](comp#L373) for all supported supported flags and options.

Also see [Structure & Conventions](#structure--conventions)
for optionally customizing compositions via _overrides_.

### Arch. Support

<table>
  <thead>
    <tr>
      <th colspan='4' align='center'>╭── &nbsp; Compositions &nbsp; &nbsp; \ &nbsp; &nbsp; Supported Archs &nbsp; ─── </th>
      <th align='center'><sub>amd 64</sub></th>
      <th align='center'><sub>arm 64</sub></th>
      <th align='center'><sub>arm v7</sub></th>
      <th align='center'><sub>risc v64</sub></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>
        <a href='https://airdcpp.net/'>AirDC++</a>
        <br>
        <sub>:443/airdcpp/</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28AirDC%2B%2B%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_airdcpp.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/airdcpp/'>
          <sub>airdcpp</sub>
        </a>
      </th>
      <td align='center'>
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
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://beszel.dev/'>Beszel Agent</a>
        <br>
        <sub>:45876</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Beszel%20Agent%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_beszel_agent.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/henrygd/beszel-agent'>
          <sub>agent</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>0.16.0</sub></code>
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
        <a href='https://beszel.dev/'>Beszel Hub</a>
        <br>
        <sub>:24432/beszel/</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Beszel%20Hub%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_beszel_hub.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/henrygd/beszel'>
          <sub>beszel</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>0.15.4</sub></code>
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
        <a href='https://bitmagnet.io/'>bitmagnet</a>
        <br>
        <sub>:4433/</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28bitmagnet%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_bitmagnet.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> C
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/postgres'>
          <sub>postgres</sub>
        </a>
        <br>
        <a href='https://github.com/bitmagnet-io/bitmagnet/pkgs/container/bitmagnet'>
          <sub>bitmagnet</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>17.5...ne</sub></code>
        <br>
        <code><sub>v0.10.0</sub></code>
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
        <a href='https://certbot.eff.org/'>Certbot</a>
        <br>
        <sub>:80/</sub>
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
        <code><sub>v5.1.0</sub></code>
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
      <td align='center'>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://docs.docker.com/engine/security/protect-access/'>docker_sock</a>
        <br>
        <sub>:44432/docker_sock/</sub>
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
        <code><sub>3.0.7</sub></code>
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
        <a href='https://frigate.video/'>Frigate</a>
        <br>
        <sub>:4433/</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Frigate%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_frigate.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://ghcr.io/blakeblackshear/frigate'>
          <sub>frigate</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>0.16.2</sub></code>
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
      <td align='center'>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://gitea.io/'>Gitea</a>
        <br>
        <sub>:443/gitea/</sub>
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
        <code><sub>1.25.1-r...s</sub></code>
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
      <td align='center'>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://www.home-assistant.io/hassio/'>HAss</a>
        <br>
        <sub>:4431/</sub>
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
        <code><sub>2025.11.1_2.0.5</sub></code>
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
        <sub>:443/jackett/</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Indexarr%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_indexarr.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/flaresolverr/flaresolverr/'>
          <sub>solvarr</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/jackett/'>
          <sub>jackett</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>v3.4.5</sub></code>
        <br>
        <code><sub>0.24.268</sub></code>
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
        <code><sub>11.7.2</sub></code>
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
      <td align='center'>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://wiki.servarr.com/'>Monitarr</a>
        <br>
        <sub>:443/{lid,rad,son}arr/</sub>
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
        <code><sub>3.0.1.4866</sub></code>
        <br>
        <code><sub>5.28.0.10274</sub></code>
        <br>
        <code><sub>4.0.16.2944</sub></code>
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
        <sub>:443/navidrome/</sub>
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
        <code><sub>0.58.5</sub></code>
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
        <sub>:443/nextcloud/</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Nextcloud%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_nextcloud.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> B <br> C <br> C <br> B <br> B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/mariadb'>
          <sub>mariadb</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/valkey/valkey'>
          <sub>valkey</sub>
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
        <code><sub>11.7.2</sub></code>
        <br>
        <code><sub>8.1.3...ne</sub></code>
        <br>
        <code><sub>20250710...55</sub></code>
        <br>
        <code><sub>20250710...55</sub></code>
        <br>
        <code><sub>31.0.7</sub></code>
        <br>
        <code><sub>31.0.7</sub></code>
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
        <sub>:25, :44431/, :44433/</sub>
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
        <code><sub>v2.14.0</sub></code>
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
        <a href='https://openvpn.net/'>OpenVPN</a>
        <br>
        <sub>:5432</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28OpenVPN%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_openvpn.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/openvpn-client/'>
          <sub>vpn</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.6.14</sub></code>
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
        <a href='https://pi-hole.net'>Pi&#8209;hole</a>
        <br>
        <sub>:53, :44433/pihole/</sub>
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
        <code><sub>2.1.12</sub></code>
        <br>
        <code><sub>2025.11.0</sub></code>
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
        <sub>:443/qbittorrent/</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28qBittorrent%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_qbittorrent.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/qbittorrent-nox/'>
          <sub>qbittorrent&#8209;nox</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>5.1.3</sub></code>
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
        <a href='https://github.com/latchset/tang'>Tang</a>
        <br>
        <sub>:802/tang/</sub>
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
        <a href='https://mosquitto.org/'>Mosquitto</a>
        <br>
        <sub></sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Mosquitto%29%22'><img src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/services/compose-test_mosquitto.yml?branch=master&logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/eclipse-mosquitto'>
          <sub>mosquitto</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.0.22</sub></code>
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
        <a href='https://github.com/padhi-homelab/docker_tiny-httpd/'>Tiny HTTPD</a>
        <br>
        <sub>:443/</sub>
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
        <code><sub>2.29-r5</sub></code>
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
        <sub>:443, :802, :803, :2443, :4431, :4432</sub>
        <br>
        <sub>:4433, :4443, :24431, :24432, :24433</sub>
        <br>
        <sub>:44431, :44432, :44433</sub>
        <br>
        <sub>:24432/traefik</sub>
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
        <code><sub>3.6.1</sub></code>
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
      <td align='center'>
        :heavy_check_mark:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://unifi-network.ui.com'>Unifi</a>
        <br>
        <sub>:3478, :8080, :8843/, :10001</sub>
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
        <code><sub>9.5.21</sub></code>
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
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
  </tbody>
</table>

#### Service Rating

Below, we say that a container is a _non-root container_,
if it allows running the target service as a non-root user,
e.g. using `--user` with docker run.

Note that this is different from (less secure compared to)
running a _root-less container_,
i.e., with a root-less docker daemon.

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

#### Network Exposure

<table>
  <thead>
    <tr>
      <td colspan='2' rowspan='2' align='center'>(Default Ports)</th>
      <td colspan='1' align='center'><strong>HTTP</strong> (?<strong>80</strong>?)</td>
      <td colspan='3' align='center'><strong>HTTPS</strong> (?<strong>443</strong>?)</td>
    </tr>
    <tr>
      <td align='center'><strong>Service</strong><br>(80?)</td>
      <td align='center'><strong>Internal</strong><br>(<strong>4</strong>443?)</td>
      <td align='center'><strong>Monitor</strong><br>(<strong>2</strong>443?)</td>
      <td align='center'><strong>Service</strong><br>(443?)</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan='2' align='center'><strong>WAN</strong></td>
      <td align='center'><strong>Shared</strong><br>(*)</td></td>
      <td rowspan='2' colspan='2' align='center'>:heavy_multiplication_x:</td>
      <td align='center'>2443</td>
      <td align='center'>443</td>
    </tr>
    <tr>
      <td align='center'><strong>Exclusive</strong><br>(*<strong>1</strong>)</td></td>
      <td align='center'>24431</td>
      <td align='center'>4431</td>
    </tr>
    <tr>
      <td rowspan='2' align='center'><strong>LAN</strong></td>
      <td align='center'><strong>Shared</strong><br>(*<strong>2</strong>)</td></td>
      <td align='center'>802</td>
      <td align='center'>44432</td>
      <td align='center'>24432</td>
      <td align='center'>4432</td>
    </tr>
    <tr>
      <td align='center'><strong>Exclusive</strong><br>(*<strong>3</strong>)</td></td>
      <td align='center'>803</td>
      <td align='center'>44433</td>
      <td align='center'>24433</td>
      <td align='center'>4433</td>
    </tr>
  </tbody>
</table>

- **Shared**: Ports for applications that support serving under subpaths
- **Exclusive**: Ports for containers that do not support subpaths
<br><br>
- **Service**: Ports for end-user UI
- **Monitor**: Ports for monitoring applications
- **Internal**: Ports for other internal applications

#### Overrides

All local tweaks should be added to `*.override.*` files.

- at the repo root:
  - `versions.global.override.env` may store global version numbers
    - these are exposed as-is to docker compose
    - see [`versions.global.env`](versions.global.env) for the default
  - `static.global.override.env` may store global constants
    - e.g. ACME configs, ports to be open etc.
    - these are exposed as-is to docker compose
    - see [`static.global.env`](static.global.env) for the default
  - `dynamic.global.override.env.sh` may generate additional dynamic variables
    - e.g. as public IP, UID of calling user etc.
    - these are (re)computed just before running each a composition
    - see [`dynamic.global.env.sh`](dynamic.global.env.sh) for the default

- within each composition:
  - `versions.global.override.env` may store additional composition-specific version numbers
    - similar idea as its global counterpart `versions.global.env`
    - see [`unifi/versions.env`](unifi/versions.env) for an example
  - `static.override.env` may store additional composition-specific constants
    - similar idea as its global counterpart `static.global.env`
    - see [`gitea/static.env`](gitea/static.env) for an example
  - `dynamic.override.env.sh` may generate additional composition-specific environment variables
    - similar idea as its global counterpart `dynamic.global.env.sh`
    - see [`pihole/dynamic.env.sh`](pihole/dynamic.env.sh) for an example
  - `meta.override.yml` may:
    - specify other compositions as _prerequisites_
      - see [`airdcpp/meta.yml`](airdcpp/meta.yml) for an example
      - these are started and validated before starting the composition
    - specify other compositions as _related_
      - see [`tang/meta.yml`](tang/meta.yml) for an example
      - these are optionally started and validated after starting the composition
    - contain overrides for the `{devices|labels|logging|ports}` fragments  
      (flags used on the command-line will further override this)
      - see [`.github/workflows/config/meta.override.yml`](.github/workflows/config/meta.override.yml) for an example
    - specify messages to be displayed after verb executions
      - see [`traefik/meta.yml`](traefik/meta.yml) for an example
  - `compose.override.{yml|yaml}` may contain overrides for docker compose
    - modular overrides may also be specified for individual YAML fragment files:  
      `compose.{devices|labels|logging|ports}.override.{yml|yaml}`
  - `compose.{pre,post}_hook.override.*.sh`
    may define additional hooks to be run before `docker compose`
    - see [`nextcloud/compose.pre_hook.sh`](nextcloud/compose.pre_hook.sh) for an example
  - `compose.{up,down,clean}.{pre,post}_hook.override.*.sh`
    may define additional verb-specific hooks to be run
    - see [`monitarr/compose.up.pre_hook.sh`](monitarr/compose.up.pre_hook.sh) for an example

#### Subdirectories

- immediate subdirectories under `config/`, `data/`, `extra/`, and `generated/`
  must match the service names within `compose.yml`
- the directory structure at each of `config/X/Y/...`, `data/X/Y/...`, `extra/X/Y/...`, and `generated/X/Y/...`
  must match the absolute path hierarchy `/Y/...` in the container for service `X`

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
